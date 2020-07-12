package main

import (
	"fmt"
	"log"
	"os"
	"strings"
	"time"

	"github.com/gocolly/colly"
	"github.com/urfave/cli/v2"
)

func main() {
	var delay int
	var username string
	app := &cli.App{
		Flags: []cli.Flag{
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
		},
		Action: func(c *cli.Context) error {
			return nil
		},
	}
	err := app.Run(os.Args)
	if err != nil {
		log.Fatal(err)
	}
	record := scrape(username, delay)
	fmt.Println(record)
}

func scrape(username string, delay int) []string {
	time.Sleep(time.Duration(delay) * time.Second)
	allowed := "github.com"
	url := "https://%s/%s"
	var record []string
	c := colly.NewCollector(
		colly.AllowedDomains(allowed),
		//colly.CacheDir(""),
	)
	c.Limit(&colly.LimitRule{
		// Filter domains affected by this rule
		DomainGlob: "github.com/*",
		// Set a delay between requests to these domains
		Delay: 1 * time.Second,
		// Add an additional random delay
		RandomDelay: 1 * time.Second,
	})
	c.OnRequest(func(r *colly.Request) {
		fmt.Println("Visiting", r.URL)
	})
	c.OnError(func(_ *colly.Response, err error) {
		log.Println("Something went wrong:", err)
	})
	c.OnHTML("div[class='js-yearly-contributions'] h2[class='f4 text-normal mb-2']", func(e *colly.HTMLElement) {
		pos := strings.Index(e.Text, " contribution")
		record = append(record, strings.TrimSpace(strings.Replace(e.Text[0:pos], ",", "", -1)))
	})
	/* GitHub seems to have removed the "count" of repos from profiles - can this be fixed with a crawl ??
	c.OnXML("//a[contains(@href,'tab=repositories')]/span", func(e *colly.XMLElement) {
		record = append(record, strings.TrimSpace(e.Text))
	})
	*/
	c.OnXML("//a[contains(@href,'tab=stars')]/span", func(e *colly.XMLElement) {
		record = append(record, strings.TrimSpace(e.Text))
	})
	c.OnXML("//a[contains(@href,'tab=followers')]/span", func(e *colly.XMLElement) {
		record = append(record, strings.TrimSpace(e.Text))
	})
	c.OnXML("//a[contains(@href,'tab=following')]/span", func(e *colly.XMLElement) {
		record = append(record, strings.TrimSpace(e.Text))
	})
	c.Visit(fmt.Sprintf(url, allowed, username))
	return record
}
