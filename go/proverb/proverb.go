/*
Package proverb provides a method to generate proverb from given list of inputs.
*/
package proverb

import "fmt"

// Proverb returns a proverb from given rhymes.
func Proverb(rhyme []string) []string {
	endingTemplate := "And all for the want of a %s."
	template := "For want of a %s the %s was lost."
	if len(rhyme) == 0 {
		return []string{}
	}

	out := []string{}

	for i, n := 0, len(rhyme)-1; i < n; i++ {
		out = append(out, fmt.Sprintf(template, rhyme[i], rhyme[i+1]))
	}
	out = append(out, fmt.Sprintf(endingTemplate, rhyme[0]))

	return out
}
