package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/jung-kurt/gofpdf"
	"math/rand"
	"net/http"
	"os"
	"path/filepath"
	"time"
)

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
		c.HTML(http.StatusOK, "index.tmpl.html", gin.H{})
	})
	router.POST("/pdf", handler())
	router.Run(":" + port)
}

func handler() gin.HandlerFunc {
	fn := func(c *gin.Context) {
		var w http.ResponseWriter = c.Writer
		var req *http.Request = c.Request

		name := c.DefaultPostForm("name", "World")
		hello := fmt.Sprintf("Hello %s", name)

		pdf := gofpdf.New("P", "mm", "A4", "")
		pdf.AddPage()
		pdf.SetFont("Arial", "B", 16)
		pdf.Cell(40, 10, hello)

		now := time.Now()
		nanos := now.UnixNano()
		t := rand.Int63()
		filename := fmt.Sprintf("hello-%v-%v", nanos, t)
		savepath := ""
		if os.Getenv("APP_ENV") == "production" {
			savepath = "/tmp"
		} else {
			savepath = "./pdfs"
		}
		fp := fmt.Sprintf("%s/%s.pdf", savepath, filename)
		err := pdf.OutputFileAndClose(fp)

		absPath, _ := filepath.Abs(fp)
		f, err := os.Open(absPath)
		if err != nil {
			print(err)
		}
		defer f.Close()
		fileInfo, err := f.Stat()
		if err != nil {
			print(err)
		}
		http.ServeContent(w, req, fileInfo.Name(), fileInfo.ModTime(), f)
	}
	return gin.HandlerFunc(fn)
}
