package main

import (
    "fmt"
    "log"
    "os"
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
    flag.StringVarP(&username, "username", "u", "", "PyCheckIO username ")
}

func scrape(username string) {
    allowed := "py.checkio.org"
    url := "https://py.checkio.org/user/%s/"
    var record []string
    c := colly.NewCollector(
        colly.AllowedDomains(allowed),
        //colly.CacheDir(""),
    )

    err := c.Limit(&colly.LimitRule{
        // Filter domains affected by this rule
        DomainGlob: "py.checkio.org/*",
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
    c.OnXML("//span[@class='profile_level_value']", func(e *colly.XMLElement) {
        record = append(record, e.Text)
    })
    err = c.Visit(fmt.Sprintf(url, username))

    if err != nil {
        log.Fatal(err)
    }
    fmt.Println(record)
}
