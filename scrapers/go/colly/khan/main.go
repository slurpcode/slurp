package main

import (
	"context"
	"fmt"
	"log"
	"time"

	"github.com/chromedp/chromedp"
)

func main() {
	//allowed := "www.khanacademy.org"
	////allowed := "https://www.khanacademy.org/profile/JohnBampton/"
	//url := "https://%s/profile/%s/"

	//// Instantiate default collector
	//c := colly.NewCollector(
	//	// Visit only domains: khanacademy.org
	//	colly.AllowedDomains(allowed),
	//)


	//c.OnHTML("a[href]", func(e *colly.HTMLElement) {
	//	e.Request.Visit(e.Attr("href"))
	//})
	//// Before making a request print "Visiting ..."
	//c.OnRequest(func(r *colly.Request) {
	//	fmt.Println("Visiting", r.URL.String())
	//})

	//c.OnError(func(_ *colly.Response, err error) {
	//	log.Println("Something went wrong:", err)
	//})


	//// Start scraping on https://khanacademy.org
	////err := c.Visit(fmt.Sprintf(url, allowed, "XSLTGod"))
	//err := c.Visit(fmt.Sprintf(url, allowed, "JohnBampton"))

	//if err != nil {
	//	log.Fatal(err)
	//}


	//c := colly.NewCollector()

	// Find and visit all links
	// c.OnHTML("h2", func(e *colly.HTMLElement) {
    //    //imgURL := e.Attr("src")
    //    //fmt.Println("Image URL:", imgURL)
	//	 fmt.Println(e.Text)
    //})


	//c.OnHTML("h2", func(e *colly.HTMLElement) {
	//	// Extract the table rows from the table
	//	fmt.Println(e.Text)

	//})

	//c := colly.NewCollector()

	//// Set the timeout duration to 30 seconds
	//c.SetRequestTimeout(60 * time.Second)

	//// Specify the URL to scrape
	//url := "https://www.khanacademy.org/profile/JohnBampton/"

	//// Callback function to handle the scraped data
	//c.OnHTML("a", func(e *colly.HTMLElement) {
	//	fmt.Println(e.Text)
	//})

	//// Error handling callback
	//c.OnError(func(r *colly.Response, err error) {
	//	log.Println("Request URL:", r.Request.URL, "failed with response:", r, "\nError:", err)
	//})

	//// Start the scraping process
	//err := c.Visit(url)
	//if err != nil {
	//	log.Fatal("Error scraping website:", err)
	//}
	ctx, cancel := chromedp.NewContext(context.Background())
	defer cancel()


	opts := append(chromedp.DefaultExecAllocatorOptions[:],
		chromedp.Flag("headless", true),
		chromedp.Flag("disable-gpu", true),
		chromedp.Flag("no-sandbox", true),
		chromedp.Flag("ignore-certificate-errors", true),
	)


	allocatorCtx, cancel := chromedp.NewExecAllocator(ctx, opts...)
	defer cancel()


	ctx, cancel = chromedp.NewContext(allocatorCtx)
	defer cancel()


	url := "https://www.khanacademy.org/profile/JohnBampton/"


	err := chromedp.Run(ctx,
		chromedp.Navigate(url),
	)
	if err != nil {
		log.Fatal("Error navigating to the page:", err)
	}


	err = chromedp.Run(ctx,
		chromedp.Sleep(2*time.Second),
	)
	if err != nil {
		log.Fatal("Error waiting for the page to load:", err)
	}


	var h1Text string
	err = chromedp.Run(ctx,
		chromedp.TextContent("h1", &h1Text, chromedp.ByQuery),
	)
	if err != nil {
		log.Fatal("Error extracting h1 text:", err)
	}

	fmt.Println("h1 text:", h1Text)
}
