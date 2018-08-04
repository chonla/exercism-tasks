/*
Package hamming provides method to find hamming distance.
*/
package hamming

import "errors"

// Distance measures Hamming Distance of 2 strings and
// return the number of differences and nil.
// If 2 strings have different length, return -1 and non-nil error.
func Distance(a, b string) (int, error) {
	if len(a) != len(b) {
		return -1, errors.New("two strings should have identical length")
	}
	diff := 0
	for i, n := 0, len(a); i < n; i++ {
		if a[i] != b[i] {
			diff++
		}
	}
	return diff, nil
}
