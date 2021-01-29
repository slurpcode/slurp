package main

import (
	"fmt"
	"log"
	"os"
	"strings"
	"time"

	"github.com/gocolly/colly/v2"
	flag "github.com/spf13/pflag"
)

// flags
var (
	username string
)

func main() {
	flag.Parse()
	if flag.NFlag() == 0 {
		fmt.Printf("Usage: %s [options]\n", os.Args[0])
		fmt.Println("Options:")
		flag.PrintDefaults()
		os.Exit(1)
	}
	scrape(username)
}

func init() {
	flag.StringVarP(&username, "username", "u", "", "Codewars profile username ")
}

func scrape(username string) {
	allowed := "www.codewars.com"
	url := "https://%s/users/%s"
	var record []string
	c := colly.NewCollector(
		colly.AllowedDomains(allowed),
		//colly.CacheDir(""),
	)
	c.Limit(&colly.LimitRule{
		// Filter domains affected by this rule
		DomainGlob: "codewars.com/*",
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
	c.OnXML("//div[@class='stat-box'][ancestor::div[@class='stat-container']/h2/text()='Progress']/div[@class='stat'][b/text()='Rank:']/text()", func(e *colly.XMLElement) {
		record = append(record, e.Text)
	})
	c.OnXML("//div[@class='stat-box'][ancestor::div[@class='stat-container']/h2/text()='Progress']/div[@class='stat'][b/text()='Honor:']/text()", func(e *colly.XMLElement) {
		record = append(record, strings.Replace(e.Text, ",", "", -1))
	})
	c.OnXML("//div[@class='stat-box'][ancestor::div[@class='stat-container']/h2/text()='Progress']/div[@class='stat'][b/text()='Leaderboard Position:']/text()", func(e *colly.XMLElement) {
		record = append(record, strings.Replace(strings.TrimPrefix(e.Text, "#"), ",", "", -1))
	})
	c.OnXML("//div[@class='stat-box'][ancestor::div[@class='stat-container']/h2/text()='Progress']/div[@class='stat'][b/text()='Honor Percentile:']/text()", func(e *colly.XMLElement) {
		record = append(record, strings.TrimPrefix(e.Text, "Top "))
	})
	c.OnXML("//div[@class='stat-box'][ancestor::div[@class='stat-container']/h2/text()='Progress']/div[@class='stat'][b/text()='Total Completed Kata:']/text()", func(e *colly.XMLElement) {
		record = append(record, strings.Replace(e.Text, ",", "", -1))
	})
	// Start scraping on https://www.codewars.com
	c.Visit(fmt.Sprintf(url, allowed, username))
	fmt.Println(record)
}
