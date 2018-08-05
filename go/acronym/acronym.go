/*
Package acronym provide a method to generate a cool acronym from a long name.
*/
package acronym

import (
	"regexp"
	"strings"
)

// Abbreviate returns acronym.
func Abbreviate(s string) string {
	buffer := []string{}
	re := regexp.MustCompile("[ \\-]")
	tokens := re.Split(s, -1)
	for _, token := range tokens {
		buffer = append(buffer, strings.ToUpper(token[0:1]))
	}
	return strings.Join(buffer, "")
}
