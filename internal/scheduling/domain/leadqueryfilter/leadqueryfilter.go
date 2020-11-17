// Copyright © 2020 David Arnold <dar@xoe.solutions>
// SPDX-License-Identifier: MIT

//go:generate go run github.com/xoe-labs/go-generators/ddd-domain-gen -t LeadQueryFilter
//go:generate go run github.com/phelmkamp/metatag

package leadqueryfilter

import (
	// "fmt"
	// "github.com/pkg/errors"
)

// LeadQueryFilter knows how to filter campaign leads
type LeadQueryFilter struct {
	filter string
}
