package main

import (
	"fmt"
	"log"
	"os"
	"strings"
	"time"

	"github.com/gocolly/colly/v2"
	"github.com/urfave/cli/v2"
)

func main() {
	var delay int
	var username string
	app := cli.NewApp()
	app.Flags = []cli.Flag{
		&cli.StringFlag{
			Name:        "username",
			Aliases:     []string{"u"},
			Usage:       "GitHub username",
			Destination: &username,
			Required:    true,
		},
		&cli.IntFlag{
			Name:        "delay",
			Aliases:     []string{"d"},
			Usage:       "Time to delay in seconds",
			Destination: &delay,
			Required:    false,
			Value:       60,
		},
	}
	app.Action = func(c *cli.Context) error {
		record := Scrape(username, delay)
		fmt.Println(record)
		return nil
	}
	err := app.Run(os.Args)
	if err != nil {
		log.Fatal(err)
	}

}

// Scrape is the main function that gets all the stats
func Scrape(username string, delay int) []string {
	time.Sleep(time.Duration(delay) * time.Second)
	allowed := "github.com"
	url := "https://%s/%s"
	var record []string
	c := colly.NewCollector(
		colly.AllowedDomains(allowed),
		// colly.CacheDir(""),
	)
	err := c.Limit(&colly.LimitRule{
		// Filter domains affected by this rule
		DomainGlob: "github.com/*",
		// Set a delay between requests to these domains
		Delay: 1 * time.Second,
		// Add an additional random delay
		RandomDelay: 1 * time.Second,
	})

	if err != nil {
		log.Fatal(err)
	}
	c.OnRequest(func(r *colly.Request) {
		fmt.Println("Visiting", r.URL)
	})
	c.OnError(func(_ *colly.Response, err error) {
		log.Println("Something went wrong:", err)
	})
	// c.OnHTML("div[class='js-yearly-contributions'] h2[class='f4 text-normal mb-2']", func(e *colly.HTMLElement) {
	// 	pos := strings.Index(e.Text, " contribution")
	// 	fmt.Println("Contributions:", e.Text[0:pos])
	// 	record = append(record, strings.TrimSpace(strings.ReplaceAll(e.Text[0:pos], ",", "")))
	// })
	c.OnXML("(//a[contains(@href,'tab=repositories')]/span/@title)[1]", func(e *colly.XMLElement) {
		fmt.Println("Repositories:", e.Text)
		record = append(record, strings.TrimSpace(e.Text))
	})
	c.OnXML("(//a[contains(@href,'tab=stars')]/span/@title)[1]", func(e *colly.XMLElement) {
		fmt.Println("Stars:", e.Text)
		record = append(record, strings.TrimSpace(e.Text))
	})
	c.OnXML("//a[contains(@href,'tab=followers')]/span", func(e *colly.XMLElement) {
		fmt.Println("Followers:", e.Text)
		record = append(record, strings.TrimSpace(e.Text))
	})
	c.OnXML("//a[contains(@href,'tab=following')]/span", func(e *colly.XMLElement) {
		fmt.Println("Following:", e.Text)
		record = append(record, strings.TrimSpace(e.Text))
	})
	err = c.Visit(fmt.Sprintf(url, allowed, username))
	if err != nil {
		log.Fatal(err)
	}
	return record
}
