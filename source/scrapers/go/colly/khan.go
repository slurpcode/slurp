package main

import (
	"fmt"
	"github.com/gocolly/colly"
	"log"
	"regexp"
)

func main() {
	allowed := "www.khanacademy.org"
	url := "https://%s/profile/%s/"

	// Instantiate default collector
	c := colly.NewCollector(
		// Visit only domains: khanacademy.org
		colly.AllowedDomains(allowed),
	)

	// Before making a request print "Visiting ..."
	c.OnRequest(func(r *colly.Request) {
		fmt.Println("Visiting", r.URL.String())
	})

	c.OnError(func(_ *colly.Response, err error) {
		log.Println("Something went wrong:", err)
	})

	c.OnXML("//div[@id='footer']/following::script[contains(.,'prefersReducedMotion')]", func(e *colly.XMLElement) {
		re, _ := regexp.Compile("points\":(\\d+),\"prefersReducedMotion")
		res := re.FindAllStringSubmatch(e.Text, -1)
		if len(res) > 0 {
			fmt.Println(res[0][1])
		} else {
			fmt.Println("Not found")
		}

	})
	// Start scraping on https://khanacademy.org
	c.Visit(fmt.Sprintf(url, allowed, "XSLTGod"))
}
