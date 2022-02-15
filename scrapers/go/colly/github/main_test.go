package main

import (
	"fmt"
	"log"
	"strconv"
	"strings"
	"testing"
	"time"

	"github.com/gocolly/colly/v2"
)

func TestLength(t *testing.T) {
	got := len(scrape("jbampton", 60))
	if got != 4 {
		t.Errorf("len(scrape(\"jbampton\")) = %d; want 4", got)
	}
}

func TestIntegers(t *testing.T) {
	got := scrape("prestonhunter", 60)
	for _, v := range got {
		i, _ := strconv.Atoi(v)
		s := strconv.Itoa(i)
		if v != s {
			t.Errorf("scrape(\"prestonhunter\") = %s; want all numeric", got)
		}
	}
}

func scrape(username string, delay int) []string {
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
	c.OnHTML("div[class='js-yearly-contributions'] h2[class='f4 text-normal mb-2']", func(e *colly.HTMLElement) {
		pos := strings.Index(e.Text, " contribution")
		record = append(record, strings.TrimSpace(strings.ReplaceAll(e.Text[0:pos], ",", "")))
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
	err = c.Visit(fmt.Sprintf(url, allowed, username))
	if err != nil {
		log.Fatal(err)
	}
	return record
}
