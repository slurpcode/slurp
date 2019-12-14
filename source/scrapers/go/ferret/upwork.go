package main

import (
	"context"
	"encoding/json"
	"fmt"
	"github.com/MontFerret/ferret/pkg/compiler"
	"github.com/MontFerret/ferret/pkg/drivers"
	"github.com/MontFerret/ferret/pkg/drivers/cdp"
	"github.com/MontFerret/ferret/pkg/drivers/http"
	"log"
)

func main() {
	query := `
			LET doc = DOCUMENT("https://www.upwork.com/fl/johnbampton", true)
			WAIT_ELEMENT(doc, 'span[itemprop="pricerange"]')
			LET price = ELEMENTS(doc, 'span[itemprop="pricerange"]')
				RETURN {rate: price[1]}
	`
	comp := compiler.New()
	program, err := comp.Compile(query)
	if err != nil {
		log.Println(err)
	}
	ctx := context.Background()
	ctx = drivers.WithContext(ctx, cdp.NewDriver())
	ctx = drivers.WithContext(ctx, http.NewDriver(), drivers.AsDefault())
	out, err := program.Run(ctx)
	if err != nil {
		log.Println(err)
	}
	var res map[string]interface{}
	err = json.Unmarshal(out, &res)
	if err != nil {
		log.Println(err)
	}
	rate := res["rate"]
	fmt.Println(rate)
}
