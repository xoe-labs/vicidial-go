// Copyright © 2020 David Arnold <dar@xoe.solutions>
// SPDX-License-Identifier: MIT

package party

import (
	"fmt"

	cErrors "github.com/blaggacao/vicidial-go/internal/common/errors"
	// "github.com/pkg/errors"
)

//go:generate go run github.com/xoe-labs/go-generators/ddd-domain-gen -t Party

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
	uuid         *string    `gen:"getter" ddd:"required'missing party UUID'"`
	pType        *PartyType `gen:"getter" ddd:"required'missing party type'"`
	name         *string    `gen:"getter" ddd:"required'missing party name'"`
	endpointUUID *string    `gen:"getter" ddd:"required'missing endpoint UUID'"`
}
