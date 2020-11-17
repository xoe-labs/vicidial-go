// Copyright © 2020 David Arnold <dar@xoe.solutions>
// SPDX-License-Identifier: MIT

//go:generate go run github.com/xoe-labs/go-generators/ddd-domain-gen -t LocalParty
//go:generate go run github.com/xoe-labs/go-generators/ddd-domain-gen -t RemoteParty
//go:generate go run github.com/phelmkamp/metatag
//go:generate go run github.com/phelmkamp/magnum

package party

import (

// "github.com/pkg/errors"

// cErrors "github.com/xoe-labs/vicidial-go/internal/common/errors"
)

type LocalPartyType struct {
	name string `enum:"agent,service"`
}

type LocalParty struct {
	uuid         string         `ddd:"required'missing party UUID'" meta:"equal"`
	name         string         `ddd:"required'missing party name'" meta:"stringer"`
	endpointUUID string         `ddd:"required'missing endpoint UUID'"`
	pType        LocalPartyType `ddd:"required'missing party type'" meta:"stringer"`
}

type RemoteParty struct {
	uuid         string `ddd:"required'missing party UUID'" meta:"equal"`
	name         string `ddd:"required'missing party name'" meta:"stringer"`
	endpointUUID string `ddd:"required'missing endpoint UUID'"`
}
