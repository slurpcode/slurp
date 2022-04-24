package main

import (
	"strconv"
	"testing"
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
