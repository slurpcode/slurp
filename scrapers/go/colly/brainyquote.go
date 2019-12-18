package main

import (
	"fmt"
	"github.com/gocolly/colly"
	flag "github.com/spf13/pflag"
	"log"
	"os"
	"strings"
	"time"
)

// flags
var (
	keywords string
)

func main() {
	flag.Parse()
	if flag.NFlag() == 0 {
		fmt.Printf("Usage: %s [options]\n", os.Args[0])
		fmt.Println("Options:")
		flag.PrintDefaults()
		os.Exit(1)
	}
	scrape(keywords)
}

func init() {
	flag.StringVarP(&keywords, "keywords", "k", "", "Search keywords: ")
}

func scrape(keywords string) {
	term := strings.Join(strings.Split(keywords, " "), "+")
	allowed := "www.brainyquote.com"
	url := "https://www.brainyquote.com/search_results?q=%s"
	var record []string

	c := colly.NewCollector(
		colly.AllowedDomains(allowed),
		//colly.CacheDir(""),
	)

	c.Limit(&colly.LimitRule{
		// Filter domains affected by this rule
		DomainGlob: "brainyquote.com/*",
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

	c.OnXML("//a[@title='view quote']/text()", func(e *colly.XMLElement) {
		record = append(record, e.Text)
	})

	// Start scraping on https://www.brainyquote.com
	c.Visit(fmt.Sprintf(url, term))
	fmt.Println(record)
}
