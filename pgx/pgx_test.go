package pgx_test

import (
	"bench/pgx"
	"testing"
)

func TestPgx(t *testing.T) {
	_, err := pgx.PGX()
	if err != nil {
		t.Error(err)
	}
}
