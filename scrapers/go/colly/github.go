package main

import (
	"fmt"
	"github.com/gocolly/colly"
	"log"
	"strings"
	"time"
)

func main() {
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

	c.OnXML("//a[contains(@href,'tab=repositories')]/span", func(e *colly.XMLElement) {
		record = append(record, strings.TrimSpace(e.Text))
	})

	c.OnXML("//a[contains(@href,'tab=stars')]/span", func(e *colly.XMLElement) {
		record = append(record, strings.TrimSpace(e.Text))
	})

	c.OnXML("//a[contains(@href,'tab=followers')]/span", func(e *colly.XMLElement) {
		record = append(record, strings.TrimSpace(e.Text))
	})

	c.OnXML("//a[contains(@href,'tab=following')]/span", func(e *colly.XMLElement) {
		record = append(record, strings.TrimSpace(e.Text))
	})

	c.Visit(fmt.Sprintf(url, allowed, "jbampton"))
	fmt.Println(record)
}
