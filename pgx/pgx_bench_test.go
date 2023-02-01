package pgx_test

import (
	"bench/pgx"
	"testing"
)

func BenchmarkPGX(b *testing.B) {
	_, err := pgx.PGX()
	if err != nil {
		b.Error(err)
	}

}
