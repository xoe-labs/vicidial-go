// Copyright © 2020 David Arnold <dar@xoe.solutions>
// SPDX-License-Identifier: MIT

package errors

type CommonError interface {
	Error() string
	IsInvalidInputError() bool
	IsAuthorizationError() bool
}
