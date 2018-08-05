/*
Package scale provides a method to generate musical scale starting with the tonic with interval pattern.
*/
package scale

import (
	"strings"
)

var flat = []string{"A", "Bb", "B", "C", "Db", "D", "Eb", "E", "F", "Gb", "G", "Ab"}
var sharp = []string{"A", "A#", "B", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#"}
var interval = map[byte]int{
	'A': 3,
	'M': 2,
	'm': 1,
}

// Scale generates a sequence of musical notes (scale) corresponding to given tonic and interval pattern.
func Scale(tonic, intervalPattern string) []string {
	output := []string{}
	if intervalPattern == "" {
		intervalPattern = "mmmmmmmmmmmm"
	}
	var scale []string
	if flatScale(tonic) {
		scale = append(flat, flat...)
	} else {
		scale = append(sharp, sharp...)
	}

	start := indexOf(tonic, scale)

	for i, n, cursor := 0, len(intervalPattern), start; i < n; i++ {
		output = append(output, scale[cursor])
		cursor += interval[intervalPattern[i]]
	}

	return output
}

func indexOf(tonic string, scale []string) int {
	tonic = strings.ToUpper(tonic[0:1]) + tonic[1:]
	for i, v := range scale {
		if v == tonic {
			return i
		}
	}
	return -1
}

func flatScale(tonic string) bool {
	flatNotes := []string{"F", "Bb", "Eb", "Ab", "Db", "Gb major", "d", "g", "c", "f", "bb", "eb minor"}
	for _, v := range flatNotes {
		if tonic == v {
			return true
		}
	}
	return false
}
