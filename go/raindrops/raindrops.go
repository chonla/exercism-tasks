/*
Package raindrops convert a number to string corresponding to the number's factors.
*/
package raindrops

import (
	"fmt"
	"strings"
)

// Convert does convert a number to string.
// If the number contains factor of 3, return "Pling".
// If the number contains factor of 5, return "Plang".
// If the number contains factor of 7, return "Plong".
// Otherwise, return the number itself as a string.
func Convert(num int) string {
	out := []string{}
	if isDivisibleBy(num, 3) {
		out = append(out, "Pling")
	}
	if isDivisibleBy(num, 5) {
		out = append(out, "Plang")
	}
	if isDivisibleBy(num, 7) {
		out = append(out, "Plong")
	}
	if len(out) > 0 {
		return strings.Join(out, "")
	}
	return fmt.Sprintf("%d", num)
}

func isDivisibleBy(num, divisor int) bool {
	return num%divisor == 0
}
