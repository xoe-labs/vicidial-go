// Copyright © 2020 David Arnold <dar@xoe.solutions>
// SPDX-License-Identifier: MIT

package party

import (
	"fmt"

	cErrors "github.com/blaggacao/vicidial-go/internal/common/errors"
	// "github.com/pkg/errors"
)

//go:generate go run github.com/xoe-labs/go-generators/ddd-domain-gen -t Party
//go:generate go run github.com/phelmkamp/metatag

type PartyType struct{ s string }

func (p PartyType) String() string { return p.s }

var (
	Local  = PartyType{"local"}
	Remote = PartyType{"remote"}
)

func NewPartyTypeFromString(partyType string) (PartyType, error) {
	switch partyType {
	case "local":
		return Local, nil
	case "remote":
		return Remote, nil
	}

	return PartyType{}, cErrors.NewIncorrectInputError(
		fmt.Sprintf("invalid '%s' role", partyType),
		"invalid-role",
	)
}

type Party struct {
	uuid         string    `ddd:"required'missing party UUID'" meta:"equal"`
	pType        PartyType `ddd:"required'missing party type'" meta:"stringer"`
	name         string    `ddd:"required'missing party name'" meta:"stringer"`
	endpointUUID string    `ddd:"required'missing endpoint UUID'"`
}
