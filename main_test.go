package main

import (
	"testing"

	"github.com/sagernet/sing-box/common/geosite"
)

func hasItem(items []geosite.Item, want geosite.Item) bool {
	for _, item := range items {
		if item == want {
			return true
		}
	}
	return false
}

func TestMergeTagsSkipsCategoryCompaniesAtCN(t *testing.T) {
	companyItem := geosite.Item{Type: geosite.RuleTypeDomain, Value: "ssl.gstatic.com"}
	devItem := geosite.Item{Type: geosite.RuleTypeDomain, Value: "pkg.go.dev"}
	baseItem := geosite.Item{Type: geosite.RuleTypeDomain, Value: "example.cn"}

	data := map[string][]geosite.Item{
		"geolocation-cn":        {baseItem},
		"category-companies@cn": {companyItem},
		"category-dev@cn":       {devItem},
	}

	mergeTags(data)

	got := data["geolocation-cn"]
	if !hasItem(got, baseItem) {
		t.Fatalf("base geolocation-cn item missing after merge")
	}
	if !hasItem(got, devItem) {
		t.Fatalf("expected category-dev@cn item to still merge into geolocation-cn")
	}
	if hasItem(got, companyItem) {
		t.Fatalf("did not expect category-companies@cn item to merge into geolocation-cn")
	}
}
