package stdlib

import (
	"bench/entity"
	scan "bench/scanner"
	"database/sql"

	_ "github.com/lib/pq"
)

var db *sql.DB

func StdLib() ([]entity.User, error) {
	rows, err := db.Query(entity.Query)
	if err != nil {
		return nil, err
	}
	var users []entity.User
	err = scan.ScanStdLib(rows, &users)
	return users, err
}

func init() {

	d, err := sql.Open("postgres", entity.DSN)
	if err != nil {
		panic(err)
	}
	db = d
}
