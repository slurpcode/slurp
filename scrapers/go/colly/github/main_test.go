// nolint
package main

import (
	"strconv"
	"testing"
)

func TestLength(t *testing.T) {
	got := len(Scrape("jbampton", 60))
	if got != 4 {
		t.Errorf("len(Scrape(\"jbampton\")) = %d; want 4", got)
	}
}

func TestIntegers(t *testing.T) {
	got := Scrape("prestonhunter", 60)
	for _, v := range got {
		i, _ := strconv.Atoi(v)
		s := strconv.Itoa(i)
		if v != s {
			t.Errorf("Scrape(\"prestonhunter\") = %s; want all numeric", got)
		}
	}
}
