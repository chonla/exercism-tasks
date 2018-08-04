/*
Package bob provides a Hey method to give a response from bob to a message.
*/
package bob

import (
	"regexp"
	"strings"
)

// Hey returns a response from bob.
func Hey(remark string) string {
	remark = strings.TrimSpace(remark)
	if remark == "" {
		return "Fine. Be that way!"
	}
	if allCaps(remark) && question(remark) {
		return "Calm down, I know what I'm doing!"
	}
	if allCaps(remark) {
		return "Whoa, chill out!"
	}
	if question(remark) {
		return "Sure."
	}
	return "Whatever."
}

// allCaps determines if remark is a yelling.
func allCaps(remark string) bool {
	m, _ := regexp.Match("[a-z]", []byte(remark))
	M, _ := regexp.Match("[A-Z]", []byte(remark))
	return !m && M
}

// allCaps determines if remark is a question.
func question(remark string) bool {
	return remark[len(remark)-1] == '?'
}
