package main

import (
	"crypto/rand"
	"encoding/binary"
	"fmt"
	"net/http"
	"os"
	"path/filepath"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/jung-kurt/gofpdf/v2"
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
	err := router.Run(":" + port)
	if err != nil {
		fmt.Println(err.Error())
	}
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
		b := make([]byte, 8)
		_, err := rand.Read(b)
		if err != nil {
			fmt.Println(err)
		}
		t := int64(binary.BigEndian.Uint64(b))

		filename := fmt.Sprintf("hello-%v-%v", nanos, t)
		savepath := ""
		if os.Getenv("APP_ENV") == "production" {
			savepath = "/tmp"
		} else {
			savepath = "./pdfs"
		}
		fp := fmt.Sprintf("%s/%s.pdf", savepath, filename)
		if errPdf := pdf.OutputFileAndClose(fp); errPdf != nil {
			fmt.Println(err.Error())
		}

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
