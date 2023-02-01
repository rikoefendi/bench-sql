package pgx

import (
	"bench/entity"
	scan "bench/scanner"
	"context"

	"github.com/jackc/pgx/v5/pgxpool"
)

var p pgxpool.Pool

func PGX() ([]entity.User, error) {

	rows, err := p.Query(context.Background(), entity.Query)
	if err != nil {
		return nil, err
	}
	var users []entity.User
	err = scan.ScanPgx(rows, &users)
	return users, err
}
func init() {
	pool, err := pgxpool.New(context.Background(), entity.DSN)
	if err != nil {
		panic(err)
	}
	p = *pool
}
