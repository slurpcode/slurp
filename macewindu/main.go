package main

import (
	"crypto/rand"
	"fmt"
	"math/big"
	"net/http"
	"os"
	"strings"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/gocolly/colly/v2"
	_ "github.com/heroku/x/hmetrics/onload"
)

type ScrappedData struct {
	Data      [][]string
	Address   string
	StartTime string
	Time      string
	RegTime   string
	Colors    string
}

func main() {
	fmt.Println("Starting...")
	port := os.Getenv("PORT")
	if port == "" {
		port = "9000"
		// log.Fatal("$PORT must be set")
	}
	router := gin.New()
	router.Use(gin.Logger())
	router.LoadHTMLGlob("templates/*.tmpl.html")
	router.Static("/static", "static")

	router.GET("/", func(c *gin.Context) {
		d := scrapeGoogle()
		c.HTML(http.StatusOK, "index.tmpl.html", d)
	})

	router.GET("/ping", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "pong",
		})
	})

	router.GET("/the/real/:name", func(c *gin.Context) {
		name := c.Param("name")
		c.String(http.StatusOK, "Hello %s", name)
	})

	// Query string parameters are parsed using the existing underlying request object.
	// The request responds to a url matching:  /welcome?firstname=Jane&lastname=Doe
	router.GET("/welcome", func(c *gin.Context) {
		firstname := c.DefaultQuery("firstname", "Guest")
		lastname := c.Query("lastname")

		c.String(http.StatusOK, "Hello %s %s", firstname, lastname)
	})

	router.GET("/google-charts", func(c *gin.Context) {

		max := big.NewInt(7)
		offsetNumber, _ := rand.Int(rand.Reader, max)

		offsetAmount := 0.2

		c.HTML(http.StatusOK, "charts.tmpl.html", map[string]interface{}{
			"pie_cool":      randIntn(50),
			"pie_battles":   randIntn(50),
			"pie_sleep":     randIntn(50),
			"pie_council":   randIntn(50),
			"pie_eat":       randIntn(50),
			"pie_commute":   randIntn(50),
			"pie_tv":        randIntn(50),
			"offset_number": offsetNumber,
			"offset_amount": offsetAmount,
		})
	})

	if err := router.Run(":" + port); err != nil {
		fmt.Println("error: ", err)
	}
}

func randIntn(max int) int {
	n, _ := rand.Int(rand.Reader, big.NewInt(int64(max+1)))
	return int(n.Int64())
}

func scrapeGoogle() ScrappedData {
	var url string
	var startTime string
	var unixTime string
	var regTime string

	startTime = gettime(time.Now().Unix())
	google := "www.google.com"

	co := colly.NewCollector(
		colly.AllowedDomains(google),
		// colly.CacheDir("./macewindu_cache"),
	)
	co.OnRequest(func(r *colly.Request) {
		url = fmt.Sprintf("%v", r.URL)
	})
	var ret [][]string
	// Find all links
	co.OnHTML("a[href^='/url?q']", func(e *colly.HTMLElement) {
		if len(e.Text) > 0 && e.Text != "Cached" { // fix ??
			var record = make([]string, 2)
			record[0] = e.Text
			link := e.Attr("href")
			record[1] = e.Request.AbsoluteURL(link)
			ret = append(ret, record)
		}
	})

	co.OnScraped(func(r *colly.Response) {
		t := time.Now()
		unixTime = gettime(t.Unix())
		regTime = fmt.Sprintf("%d-%02d-%02dT%02d:%02d:%02d\n",
			t.Year(), t.Month(), t.Day(), t.Hour(), t.Minute(), t.Second())
	})
	// randomize color array
	col := [10]string{"#641E16", "#85C1E9", "#512E5F", "#154360", "#85C1E9", "#0E6251", "#145A32", "#7D6608", "#784212", "#85C1E9"}
	dest := make([]string, len(col))
	indices := make([]int, len(col))
	for i := range indices {
		indices[i] = i
	}

	// Shuffle the slice using Fisher-Yates algorithm and a cryptographically secure random number generator
	rng := rand.Reader
	for i := len(indices) - 1; i > 0; i-- {
		j, err := rand.Int(rng, big.NewInt(int64(i+1)))
		if err != nil {
			fmt.Println("error:", err)
		}
		indices[i], indices[j.Int64()] = indices[j.Int64()], indices[i]
	}

	for i, v := range indices {
		dest[v] = col[i]
	}
	colors := strings.Join(dest, ",")

	if err := co.Visit("https://www.google.com/search?q=mace+windu"); err != nil {
		fmt.Println("error: ", err)
	}
	d := ScrappedData{Data: ret, Address: url, StartTime: startTime, Time: unixTime, RegTime: regTime, Colors: colors}
	return d
}

func gettime(i int64) string {
	return fmt.Sprintf("%v", i)
}
