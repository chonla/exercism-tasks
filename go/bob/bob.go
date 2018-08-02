package bob

import (
	"regexp"
	"strings"
)

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

func allCaps(remark string) bool {
	m, _ := regexp.Match("[a-z]", []byte(remark))
	M, _ := regexp.Match("[A-Z]", []byte(remark))
	return !m && M
}

func question(remark string) bool {
	return remark[len(remark)-1] == '?'
}
