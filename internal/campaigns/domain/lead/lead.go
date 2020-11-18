// Copyright © 2020 David Arnold <dar@xoe.solutions>
// SPDX-License-Identifier: MIT

//go:generate go run github.com/xoe-labs/go-generators/ddd-domain-gen -t Lead
//go:generate go run github.com/phelmkamp/magnum

package lead

import (
	"net/mail"

	// "github.com/pkg/errors"
	"github.com/Boostport/address"
	"github.com/nyaruka/phonenumbers"
	"github.com/satori/go.uuid"
)

type leadStatusCode struct {
	name string `enum:"loaded,queued,incoming,processed,recycled"`
}

// Lead represents a lead within a campaign
type Lead struct {
	uuid           uuid.UUID `ddd:"required,missing lead UUID;equal"`
	name           string    `ddd:"required,missing lead name;stringer"`
	selfIdentifier string

	statusCode     leadStatusCode `ddd:"getter;setter"`
	resultSentinel string         `ddd:"getter;setter"`

	address address.Address
	mail    mail.Address
	numbers []phonenumbers.PhoneNumber

	gender   string
	birthday string
	comment  string
}
