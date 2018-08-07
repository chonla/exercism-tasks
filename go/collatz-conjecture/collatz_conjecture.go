/*
Package collatzconjecture provides a method to find the step count to do Collatz Conjecture.
*/
package collatzconjecture

import (
	"errors"
)

// CollatzConjecture returns the number of steps taken from
// starting positive number until it becomes 1 and error if any.
func CollatzConjecture(num int) (int, error) {
	steps := 0
	if num <= 0 {
		return num, errors.New("number should be positive integer")
	}
	for num > 1 {
		if num&1 == 1 {
			num = 3*num + 1
		} else {
			num = num >> 1
		}
		steps++
	}
	return steps, nil
}
