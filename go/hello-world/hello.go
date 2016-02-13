package hello

import (
	"fmt"
)

const TestVersion = 1

func HelloWorld(name string) string {
	if name != "" {
		return fmt.Sprintf("Hello, %s!", name)
	}
	return "Hello, World!"
}
