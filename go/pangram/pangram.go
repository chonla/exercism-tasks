/*
Package pangram provides method to determine if a string is pangram or not.
*/
package pangram

import (
	"strings"
)

// IsPangram determines if given string is pangram.
func IsPangram(s string) bool {
	letters := map[rune]bool{}

	s = strings.ToLower(s)
	for _, c := range s {
		if 'a' <= c && c <= 'z' {
			if _, ok := letters[c]; !ok {
				letters[c] = true
			}
		}
	}
	return len(letters) == 26
}
