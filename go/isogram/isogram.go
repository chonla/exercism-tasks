/*
Package isogram provides a method to determine if a given text is isogram or not.
*/
package isogram

import (
	"regexp"
	"strings"
)

// IsIsogram checks if text is isogram and returns true if it is isogram, otherwise returns false.
func IsIsogram(text string) bool {
	// Clean up
	text = strings.ToLower(text)
	s := regexp.MustCompile("[^a-z]").Split(text, -1)
	text = strings.Join(s, "")

	// Check
	pool := map[byte]int{}
	for i := range text {
		if _, ok := pool[text[i]]; ok {
			return false
		}
		pool[text[i]] = 1
	}

	return true
}
