// Copyright © 2020 David Arnold <dar@xoe.solutions>
// SPDX-License-Identifier: MIT

package errors

type CommonErrorer interface {
	Error() string
	IsInvalidInputError() bool
	IsAuthorizationError() bool
}

type CommonError string
func (e CommonError) Error() string              { return string(e) }
func (e CommonError) IsInvalidInputError() bool  { return false }
func (e CommonError) IsAuthorizationError() bool { return false }

type InvalidInputError string
func (e InvalidInputError) Error() string              { return string(e) }
func (e InvalidInputError) IsInvalidInputError() bool  { return true }
func (e InvalidInputError) IsAuthorizationError() bool { return false }

type AuthorizationError string
func (e AuthorizationError) Error() string              { return string(e) }
func (e AuthorizationError) IsInvalidInputError() bool  { return false }
func (e AuthorizationError) IsAuthorizationError() bool { return true }
