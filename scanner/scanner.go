package scan

import (
	"database/sql"
	"reflect"
	"regexp"
	"strings"
	"sync"

	"github.com/jackc/pgx/v5"
)

// var jsonColTypes map[uint32]oid.Oid = map[uint32]oid.Oid{oid.T_json: oid.T_json, oid.T_jsonb: oid.T_jsonb}

type VarTypeError string
type (
	structInfo struct {
		nameMap   map[string]*fieldInfo // mapping from struct field names to field infos
		dbNameMap map[string]*fieldInfo // mapping from db column names to field infos
	}

	structValue struct {
		*structInfo
		value     reflect.Value // the struct value
		tableName string        // the db table name for the struct
	}

	fieldInfo struct {
		name   string // field name
		dbName string // db column name
	}

	structInfoMapKey struct {
		t reflect.Type
		m reflect.Value
	}
)

var (
	// DbTag is the name of the struct tag used to specify the column name for the associated struct field
	DbTag  = "db"
	DbType = "type"

	fieldRegex      = regexp.MustCompile(`([^A-Z_])([A-Z])`)
	structInfoMap   = make(map[structInfoMapKey]*structInfo)
	muStructInfoMap sync.Mutex
)

func (s VarTypeError) Error() string {
	return "Invalid variable type: " + string(s)
}

func ScanPgx(r pgx.Rows, dest interface{}) error {
	// defer r.Close()
	v := reflect.ValueOf(dest)
	if v.Kind() != reflect.Ptr || v.IsNil() {
		return VarTypeError("must be a pointer")
	}
	v = indirect(v)
	et := v.Type()
	isSlice := false
	if v.Kind() == reflect.Slice {
		et = v.Type().Elem()
		isSlice = true
	}
	si := getStructInfo(et)
	fieldDescs := r.FieldDescriptions()
	for r.Next() {
		ev := v
		if isSlice {
			ev = reflect.New(et).Elem()
		}
		refs := make([]interface{}, len(fieldDescs))
		for i, col := range fieldDescs {
			if fi, ok := si.dbNameMap[col.Name]; ok {
				refs[i] = fi.getField(ev).Addr().Interface()
			} else {
				refs[i] = &sql.NullString{}
			}
		}
		if err := r.Scan(refs...); err != nil {
			return err
		}
		if isSlice {
			v.Set(reflect.Append(v, ev))
		}
	}
	r.Close()
	return r.Err()
}
func ScanStdLib(r *sql.Rows, dest interface{}) error {
	defer r.Close()
	v := reflect.ValueOf(dest)
	if v.Kind() != reflect.Ptr || v.IsNil() {
		return VarTypeError("must be a pointer")
	}
	v = indirect(v)
	et := v.Type()
	isSlice := false
	if v.Kind() == reflect.Slice {
		et = v.Type().Elem()
		isSlice = true
	}
	si := getStructInfo(et)
	cTypes, _ := r.ColumnTypes()
	for r.Next() {
		ev := v
		if isSlice {
			ev = reflect.New(et).Elem()
		}
		refs := make([]interface{}, len(cTypes))
		for i, col := range cTypes {
			if fi, ok := si.dbNameMap[col.Name()]; ok {
				refs[i] = fi.getField(ev).Addr().Interface()
			} else {
				refs[i] = &sql.NullString{}
			}
		}
		if err := r.Scan(refs...); err != nil {
			return err
		}
		if isSlice {
			v.Set(reflect.Append(v, ev))
		}
	}
	return r.Close()
}
func indirect(v reflect.Value) reflect.Value {
	for v.Kind() == reflect.Ptr {
		if v.IsNil() {
			v.Set(reflect.New(v.Type().Elem()))
		}
		v = v.Elem()
	}
	return v
}

func getStructInfo(a reflect.Type) *structInfo {
	muStructInfoMap.Lock()
	defer muStructInfoMap.Unlock()

	key := structInfoMapKey{a, reflect.ValueOf(fieldMapper)}
	if si, ok := structInfoMap[key]; ok {
		return si
	}
	si := &structInfo{
		nameMap:   map[string]*fieldInfo{},
		dbNameMap: map[string]*fieldInfo{},
	}
	si.build(a)
	structInfoMap[key] = si

	return si
}

func (si *structInfo) build(a reflect.Type) {
	n := a.NumField()
	for i := 0; i < n; i++ {
		field := a.Field(i)
		dbTag := field.Tag.Get(DbTag)
		if !field.Anonymous && field.PkgPath != "" || dbTag == "-" {
			continue
		}
		name := field.Name
		dbName := dbTag
		if dbName == "" {
			dbName = mapper(name)
		}
		// non-anonymous scanner or struct field
		fi := &fieldInfo{name, dbName}
		si.nameMap[fi.name] = fi
		si.dbNameMap[fi.dbName] = fi
	}
}
func (fi *fieldInfo) getField(a reflect.Value) reflect.Value {
	return a.FieldByName(fi.name)
}
func fieldMapper(f string) string {
	return strings.ToLower(fieldRegex.ReplaceAllString(f, "${1}_$2"))
}

var mapper = fieldMapper
