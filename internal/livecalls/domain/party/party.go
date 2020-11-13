// Copyright © 2020 David Arnold <dar@xoe.solutions>
// SPDX-License-Identifier: MIT

//go:generate go run github.com/xoe-labs/go-generators/ddd-domain-gen -t Party
//go:generate go run github.com/phelmkamp/metatag
//go:generate go run github.com/phelmkamp/magnum

package party

import (

	// "github.com/pkg/errors"

	// cErrors "github.com/blaggacao/vicidial-go/internal/common/errors"
)

type PartyType struct {
	name     string `enum:"local,remote"`
}

type Party struct {
	uuid         string    `ddd:"required'missing party UUID'" meta:"equal"`
	pType        PartyType `ddd:"required'missing party type'" meta:"stringer"`
	name         string    `ddd:"required'missing party name'" meta:"stringer"`
	endpointUUID string    `ddd:"required'missing endpoint UUID'"`
}
