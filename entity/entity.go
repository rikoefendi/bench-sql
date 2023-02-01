package entity

import (
	"errors"
	"fmt"
	"time"

	goccy "github.com/goccy/go-json"
)

const DSN string = "postgres://postgres:postgres@localhost:5432/bench?sslmode=disable&TimeZone=Asia/Jakarta"
const Query string = `select U.id, U.name, U.email, U.created_at, json_agg(jsonb_build_object(
	'id', PU.product_id,
	'name', P.name,
	'is_active', PU.is_active,
	'cut_off', P.cut_off,
	'sku', P.sku
	)) as products
	from users U
	inner join  product_user PU on U.id = PU.user_id
	inner join products P on P.id = PU.product_id group by U.id;`

type User struct {
	ID               uint `gorm:"index"`
	Name             *string
	Username         string  `gorm:"index;unique"`
	Email            string  `gorm:"index;unique"`
	Phone            *int    `gorm:"index"`
	Telegram         *string `gorm:"index"`
	EmailVerifyAt    *time.Time
	TelegramVerifyAt *time.Time
	Password         *string    `json:"-"`
	Pin              *string    `json:"-"`
	CreatedAt        time.Time  `gorm:"autoCreateTime;index"`
	UpdatedAt        *time.Time `gorm:"autoUpdateTime;index"`
	Products         Products   `json:"products" db:"products"`
}
type Products []Product

func (jt *Products) Scan(value interface{}) error {
	var bytes []byte
	switch v := value.(type) {
	case []byte:
		bytes = v
	case string:
		bytes = []byte(v)
	default:
		return errors.New(fmt.Sprint("Failed to unmarshal JSONB value:", value))
	}

	return goccy.Unmarshal(bytes, &jt)
}

type CutOff struct {
	Start string
	End   string
}
type Product struct {
	ID          uint
	ProductId   *string `gorm:"index"`
	SKU         string
	Name        string `json:"name"`
	Slug        string `gorm:"index"`
	Description string
	Stock       int
	Seller      string
	IsActive    bool       `json:"is_active"`
	CutOff      CutOff     `json:"cut_off"`
	CreatedAt   time.Time  `gorm:"autoCreateTime;index"`
	UpdatedAt   *time.Time `gorm:"autoUpdateTime;index"`
}
