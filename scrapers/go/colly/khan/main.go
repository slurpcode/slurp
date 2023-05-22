package main

import (
	"context"
	"fmt"
	"log"
	"time"

	"github.com/chromedp/chromedp"
)

func main() {
	
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
