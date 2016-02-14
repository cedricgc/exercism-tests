package raindrops

import (
	"strconv"
)

const TestVersion = 1

func Convert(n int) string {
	s := ""
	if n%3 == 0 {
		s = s + "Pling"
	}
	if n%5 == 0 {
		s = s + "Plang"
	}
	if n%7 == 0 {
		s = s + "Plong"
	}

	if s == "" {
		return strconv.Itoa(n)
	}
	return s

}
