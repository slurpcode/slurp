// go test -race -covermode atomic -coverprofile=profile.cov ./...
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
	var (
		delay    int
		username string
	)

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
			Value:       60,
		},
	}
	app.Action = func(c *cli.Context) error {
		record := Scrape(username, delay)
		fmt.Println(record)
		return nil
	}

	if err := app.Run(os.Args); err != nil {
		log.Fatal(err)
	}
}

func Scrape(username string, delay int) []string {
	time.Sleep(time.Duration(delay) * time.Second)

	allowedDomain := "github.com"
	url := fmt.Sprintf("https://%s/%s", allowedDomain, username)
	var record []string

	c := colly.NewCollector(
		colly.AllowedDomains(allowedDomain),
	)

	if err := c.Limit(&colly.LimitRule{
		DomainGlob:  "github.com/*",
		Delay:       1 * time.Second,
		RandomDelay: 1 * time.Second,
	}); err != nil {
		log.Fatal(err)
	}

	c.OnRequest(func(r *colly.Request) {
		fmt.Println("Visiting", r.URL)
	})

	c.OnError(func(_ *colly.Response, err error) {
		log.Println("Something went wrong:", err)
	})

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

	if err := c.Visit(url); err != nil {
		log.Fatal(err)
	}

	return record
}
