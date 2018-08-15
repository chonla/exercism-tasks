/*
Package luhn provides method to validate if given sequence of number is a valid string based on Luhn algorithm.
*/
package luhn

import (
	"fmt"
	"strings"
)

// Valid return true if num is a valid string using Luhn algorithm, otherwise return false.
func Valid(num string) bool {
	num = strings.Replace(num, " ", "", -1)

	n := len(num)
	if n <= 1 {
		return false
	}

	crc := 0
	if n%2 == 1 {
		num = fmt.Sprintf("0%s", num)
		n = len(num)
	}
	for i := 0; i < n; i++ {
		if '0' <= num[i] && num[i] <= '9' {
			if i%2 == 1 {
				crc += int(num[i] - '0')
			} else {
				s := int(num[i]-'0') * 2
				if s > 9 {
					s -= 9
				}
				crc += s
			}
		} else {
			return false
		}
	}

	return crc%10 == 0
}
