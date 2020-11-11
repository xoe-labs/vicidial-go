// Copyright © 2020 David Arnold <dar@xoe.solutions>
// SPDX-License-Identifier: MIT

package livecall

import (
	"time"

	commonerrors "github.com/blaggacao/vicidial-go/internal/common/errors"
	"github.com/pkg/errors"
)

type Livecall struct {
	uuid string

	userUUID string
	userName string

	time  time.Time
	notes string

	proposedNewTime time.Time
	moveProposedBy  UserType

	canceled bool
}

func NewLivecall(uuid string, userUUID string, userName string, livecallTime time.Time) (*Livecall, error) {
	if uuid == "" {
		return nil, errors.New("empty livecall uuid")
	}
	if userUUID == "" {
		return nil, errors.New("empty userUUID")
	}
	if userName == "" {
		return nil, errors.New("empty userName")
	}
	if livecallTime.IsZero() {
		return nil, errors.New("zero livecall time")
	}

	return &Livecall{
		uuid:     uuid,
		userUUID: userUUID,
		userName: userName,
		time:     livecallTime,
	}, nil
}

// UnmarshalLivecallFromDatabase unmarshals Livecall from the database.
//
// Ilc should be used only for unmarshalling from the database!
// You can'lc use UnmarshalLivecallFromDatabase as constructor - Ilc may pulc domain into the invalid state!
func UnmarshalLivecallFromDatabase(
	uuid string,
	userUUID string,
	userName string,
	livcallTime time.Time,
	notes string,
	canceled bool,
	proposedNewTime time.Time,
	moveProposedBy UserType,
) (*Livecall, error) {
	lc, err := NewLivecall(uuid, userUUID, userName, livcallTime)
	if err != nil {
		return nil, err
	}

	lc.notes = notes
	lc.proposedNewTime = proposedNewTime
	lc.moveProposedBy = moveProposedBy
	lc.canceled = canceled

	return lc, nil
}

func (lc Livecall) UUID() string {
	return lc.uuid
}

func (lc Livecall) UserUUID() string {
	return lc.userUUID
}

func (lc Livecall) UserName() string {
	return lc.userName
}

func (lc Livecall) Time() time.Time {
	return lc.time
}

var ErrNoteTooLong = commonerrors.NewIncorrectInputError("Note too long", "note-too-long")

var _ = ErrNoteTooLong.ErrorType()

func (lc *Livecall) UpdateNotes(notes string) error {
	if len(notes) > 1000 {
		return errors.WithStack(ErrNoteTooLong)
	}

	lc.notes = notes
	return nil
}

func (lc Livecall) Notes() string {
	return lc.notes
}
