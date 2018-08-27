/*
Package romannumerals provides a method to convert a number to roman nuermals.
*/
package romannumerals

import (
	"errors"
	"fmt"
)

var romanSet = [][]string{
	[]string{"I", "V", "X"},
	[]string{"X", "L", "C"},
	[]string{"C", "D", "M"},
	[]string{"M", "", ""},
}

// ToRomanNumeral converts a numeral to roman.
func ToRomanNumeral(num int) (string, error) {
	if 0 < num && num <= 3000 {
		output := ""
		for pos := 1; num > 0; pos++ {
			digit := num % 10
			num = num / 10
			output = romanDigit(digit, pos) + output
		}
		return output, nil
	}
	return "", errors.New("invalid number")
}

// romanDigit converts a single digit to roman number based on its position
func romanDigit(num int, pos int) string {
	set := romanSet[pos-1]
	switch num {
	case 1:
		return fmt.Sprintf("%s", set[0])
	case 2:
		return fmt.Sprintf("%s%s", set[0], set[0])
	case 3:
		return fmt.Sprintf("%s%s%s", set[0], set[0], set[0])
	case 4:
		return fmt.Sprintf("%s%s", set[0], set[1])
	case 5:
		return fmt.Sprintf("%s", set[1])
	case 6:
		return fmt.Sprintf("%s%s", set[1], set[0])
	case 7:
		return fmt.Sprintf("%s%s%s", set[1], set[0], set[0])
	case 8:
		return fmt.Sprintf("%s%s%s%s", set[1], set[0], set[0], set[0])
	case 9:
		return fmt.Sprintf("%s%s", set[0], set[2])
	}
	return ""
}
