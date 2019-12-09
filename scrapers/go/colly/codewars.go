package main

import (
	"fmt"
	"github.com/gocolly/colly"
	"log"
	"strings"
	"time"
)

func main() {
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
	c.Visit(fmt.Sprintf(url, allowed, "Beast"))
	fmt.Println(record)
}
