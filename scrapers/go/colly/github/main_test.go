package main

import "testing"

func TestSimple(t *testing.T) {
	got := len(scrape("jbampton"))
	if got != 5 {
		t.Errorf("len(scrape(\"jbampton\")) = %d; want 5", got)
	}
}
