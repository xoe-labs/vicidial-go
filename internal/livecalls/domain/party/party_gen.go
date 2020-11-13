// Code generated by ddd-domain-gen, DO NOT EDIT.
package party

import (
	"errors"
	"reflect"
)

// Generators ...

// New returns a guaranteed-to-be-valid Party or an error
func New(uuid string, pType PartyType, name string, endpointUUID string) (*Party, error) {
	if reflect.ValueOf(uuid).IsZero() {
		return nil, errors.New("missing party UUID")
	}
	if reflect.ValueOf(pType).IsZero() {
		return nil, errors.New("missing party type")
	}
	if reflect.ValueOf(name).IsZero() {
		return nil, errors.New("missing party name")
	}
	if reflect.ValueOf(endpointUUID).IsZero() {
		return nil, errors.New("missing endpoint UUID")
	}
	p := &Party{
		endpointUUID: endpointUUID,
		name:         name,
		pType:        pType,
		uuid:         uuid,
	}
	return p, nil
}

// MustNew returns a guaranteed-to-be-valid Party or panics
func MustNew(uuid string, pType PartyType, name string, endpointUUID string) *Party {
	p, err := New(uuid, pType, name, endpointUUID)
	if err != nil {
		panic(err)
	}
	return p
}

// Marshalers ...

// UnmarshalFromRepository unmarshals Party from the repository so that non-constructable
// private fields can still be initialized from (private) repository state
//
// Important: DO NEVER USE THIS METHOD EXCEPT FROM THE REPOSITORY
// Reason: This method initializes private state, so you could corrupt the domain.
func UnmarshalFromRepository(uuid string, pType PartyType, name string, endpointUUID string) *Party {
	p := MustNew(uuid, pType, name, endpointUUID)
	return p
}
