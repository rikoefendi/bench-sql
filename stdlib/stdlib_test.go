package stdlib_test

import (
	"bench/stdlib"
	"testing"
)

func TestStdLib(t *testing.T) {
	_, err := stdlib.StdLib()
	if err != nil {
		t.Error(err)
	}
}
