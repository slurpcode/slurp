// nolint
package main

import (
	"fmt"
	"strconv"
	"testing"
)

func TestLength(t *testing.T) {
	jbampton := Scrape("jbampton", 60)
	fmt.Println(jbampton)
	for i, v := range jbampton {
		fmt.Printf("jbampton[%d] = %s\n", i, v)
	}
	got := len(jbampton)
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
