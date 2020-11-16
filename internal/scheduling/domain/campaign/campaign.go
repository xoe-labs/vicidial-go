// Copyright © 2020 David Arnold <dar@xoe.solutions>
// SPDX-License-Identifier: MIT

//go:generate go run github.com/xoe-labs/go-generators/ddd-domain-gen -t Campaign
//go:generate go run github.com/phelmkamp/metatag
//go:generate go run github.com/phelmkamp/magnum

package campaign

type priority struct {
	name   string `enum:"high,normal,low"`
	factor int    `enum:"3,2,1"`
}

type Campaign struct {
	uuid     string   `meta:"getter"`
	name     string   `meta:"getter"`
	priority priority `meta:"getter"`
}

