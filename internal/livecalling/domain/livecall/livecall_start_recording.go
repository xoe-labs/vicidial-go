// Copyright © 2020 David Arnold <dar@xoe.solutions>
// SPDX-License-Identifier: MIT

package livecall

import (
	cerrors "github.com/xoe-labs/vicidial-go/internal/common/errors"
	"github.com/xoe-labs/vicidial-go/internal/livecalling/domain"
)

const (
	// ErrUnableToStartRecording signals that the recording could not be started
	ErrUnableToStartRecording = cerrors.CommonError("ErrUnableToStartRecording")
)

// StartRecording starts a recording through a communications manager
func (l *Livecall) StartRecording(cm domain.CommManager) error {
	// TODO: implement start recording on communications manager
	return nil
}
