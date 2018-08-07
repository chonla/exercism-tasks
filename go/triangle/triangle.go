/*
Package triangle determine what kind of given sides
*/
package triangle

import (
	"math"
)

// Kind represents type of triangle
type Kind string

const (
	// NaT is not-a-triangle
	NaT = "NaT"
	// Equ is equilateral
	Equ = "Equ"
	// Iso is isosceles
	Iso = "Iso"
	// Sca is scalene
	Sca = "Sca"
)

// KindFromSides return type of triangle based on given sides.
func KindFromSides(a, b, c float64) Kind {
	if math.IsNaN(a) || math.IsNaN(b) || math.IsNaN(c) {
		return NaT
	}
	if math.IsInf(a, 0) || math.IsInf(b, 0) || math.IsInf(c, 0) {
		return NaT
	}
	if a == 0 && b == 0 && c == 0 {
		return NaT
	}
	if a <= 0 || b <= 0 || c <= 0 {
		return NaT
	}
	if a+b < c || a+c < b || b+c < a {
		return NaT
	}
	if a == b && a == c {
		return Equ
	}
	if (a == b && a != c) || (a != b && a == c) || (a != b && b == c) {
		return Iso
	}
	if a != b && a != c && b != c {
		return Sca
	}
	return NaT
}
