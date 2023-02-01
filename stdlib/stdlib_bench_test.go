package stdlib_test

import (
	"bench/stdlib"
	"testing"
)

func BenchmarkStdLib(b *testing.B) {
	_, err := stdlib.StdLib()
	if err != nil {
		b.Error(err)
	}

}
