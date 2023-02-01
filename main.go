package main

import (
	"bench/pgx"
	"bench/stdlib"
	"fmt"
	"log"

	"github.com/labstack/echo/v5"
)

func main() {
	e := echo.New()
	e.GET("/users1", func(c echo.Context) error {
		users, err := pgx.PGX()
		if err != nil {
			log.Print(fmt.Errorf("users1: %v", err))
			return err
		}
		return c.JSON(200, users)
	})
	e.GET("/users2", func(c echo.Context) error {
		users, err := stdlib.StdLib()
		if err != nil {
			log.Print(fmt.Errorf("users2: %v", err))
			return err
		}
		return c.JSON(200, users)
	})
	if err := e.Start(":5000"); err != nil {
		log.Fatal(err)
	}
}
