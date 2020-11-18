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
	// ErrUnableToStopRecording signals that the recording could not be started
	ErrUnableToStopRecording = cerrors.CommonError("ErrUnableToStopRecording")
)

// livecall recording domain topic
type livecallRecording struct {
	recording      string
}

// StartRecording starts a recording through a communications manager
func (l *Livecall) StartRecording(cm domain.CommManager) error {
	// TODO: implement start recording on communications manager
	return nil
}

// StopRecording stops a recording through a communications manager
func (l *Livecall) StopRecording(cm domain.CommManager) error {
	// TODO: implement stop recording on communications manager
	return nil
}
