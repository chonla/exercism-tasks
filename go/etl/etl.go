/*
Package provides methods to do ETL on scrabble scoring data.
*/
package etl

import "strings"

// Transform transforms letter scoring map based on score to map based on letter.
func Transform(input map[int][]string) map[string]int {
	out := map[string]int{}
	for score, letters := range input {
		for _, letter := range letters {
			out[strings.ToLower(letter)] = score
		}
	}
	return out
}
