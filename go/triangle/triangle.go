package triangle

import (
	"math"
)

const TestVersion = 1

type Kind int

const (
	NaT Kind = iota // not a triangle
	Equ             // equilateral
	Iso             // isosceles
	Sca             // scalene
)

func KindFromSides(a, b, c float64) Kind {
	// Invalid number type
	for _, arg := range []float64{a, b, c} {
		if arg <= 0 || math.IsNaN(arg) || math.IsInf(arg, 0) {
			return NaT
		}
	}

	// triangle inequality
	if a+b < c || a+c < b || b+c < a {
		return NaT
	}

	equ := a == b && b == c
	sca := a != b && a != c && b != c
	// Iso case works b/c we check all other cases first
	if equ {
		return Equ
	} else if sca {
		return Sca
	}
	return Iso
}
