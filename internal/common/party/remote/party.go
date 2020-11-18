// Copyright © 2020 David Arnold <dar@xoe.solutions>
// SPDX-License-Identifier: MIT

//go:generate go run github.com/xoe-labs/go-generators/ddd-domain-gen -t RemoteParty

package party

import (
	// "github.com/pkg/errors"
	"github.com/satori/go.uuid"
	// cErrors "github.com/xoe-labs/vicidial-go/internal/common/errors"
)

type RemoteParty struct {
	uuid         uuid.UUID `ddd:"required,missing party UUID;equal"`
	name         string    `ddd:"required,missing party name;stringer"`
	endpointUUID string    `ddd:"required,missing endpoint UUID"`
}
