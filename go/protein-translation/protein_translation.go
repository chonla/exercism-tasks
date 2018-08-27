/*
Package protein provides methods to translate RNA into polypeptide.
*/
package protein

import "errors"

// STOP is stop signal
var STOP = errors.New("stop signal")

// ErrInvalidBase is invalid base error
var ErrInvalidBase = errors.New("invalid base")

// FromCodon returns a name from given amino acid name
func FromCodon(input string) (string, error) {
	codon := map[string]string{
		"AUG": "Methionine",
		"UUU": "Phenylalanine",
		"UUC": "Phenylalanine",
		"UUA": "Leucine",
		"UUG": "Leucine",
		"UCG": "Serine",
		"UCU": "Serine",
		"UAU": "Tyrosine",
		"UAC": "Tyrosine",
		"UGU": "Cysteine",
		"UGG": "Tryptophan",
	}
	if input == "UAA" || input == "UAG" || input == "UGA" {
		return "", STOP
	}
	if name, ok := codon[input]; ok {
		return name, nil
	}
	return "", ErrInvalidBase
}

// FromRNA returns a polypeptide from given RNA
func FromRNA(input string) ([]string, error) {
	out := []string{}
	for i, n := 0, len(input); i < n; i += 3 {
		name, err := FromCodon(input[i : i+3])
		if err == STOP {
			return out, nil
		}
		if err != nil {
			return out, err
		}
		out = append(out, name)
	}
	return out, nil
}
