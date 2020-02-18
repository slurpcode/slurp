package main

import (
	"strconv"
	"testing"
	"time"
)

func TestLength(t *testing.T) {
	got := len(scrape("jbampton"))
	if got != 5 {
		t.Errorf("len(scrape(\"jbampton\")) = %d; want 5", got)
	}
}

func TestIntegers(t *testing.T) {
	time.Sleep(15 * time.Second)
	got := scrape("prestonhunter")
	for _, v := range got {
		i, _ := strconv.Atoi(v)
		s := strconv.Itoa(i)
		if v != s {
			t.Errorf("scrape(\"prestonhunter\") = %s; want all numeric", got)
		}
	}
}
