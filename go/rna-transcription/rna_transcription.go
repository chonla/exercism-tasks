/*
Package strand provides a method to generate RNA strand from DNA strand.
*/
package strand

// ToRNA return RNA strand from DNA strand.
func ToRNA(dna string) string {
	buffer := ""
	dnaToRnaMap := map[byte]string{
		'G': "C",
		'C': "G",
		'T': "A",
		'A': "U",
	}
	for i := range dna {
		buffer += dnaToRnaMap[dna[i]]
	}
	return buffer
}
