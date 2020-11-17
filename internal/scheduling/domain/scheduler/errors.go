// Copyright © 2020 David Arnold <dar@xoe.solutions>
// SPDX-License-Identifier: MIT

package scheduler

import (
	cerrors "github.com/xoe-labs/vicidial-go/internal/common/errors"
)

type inputError string

func (e inputError) Error() string              { return string(e) }
func (e inputError) IsInvalidInputError() bool  { return true }
func (e inputError) IsAuthorizationError() bool { return false }

// inputError implements CommonError interface
var _ cerrors.CommonError = (*inputError)(nil)

const (
	ErrAgentAlreadyAssigned = inputError("ErrAgentAlreadyAssigned")
)

type authorizationError string

func (e authorizationError) Error() string              { return string(e) }
func (e authorizationError) IsInvalidInputError() bool  { return false }
func (e authorizationError) IsAuthorizationError() bool { return true }

// authorizationError implements CommonError interface
var _ cerrors.CommonError = (*authorizationError)(nil)
