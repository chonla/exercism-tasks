/*
Package reverse provide method to revert string.
*/
package reverse

// String reverts input sequence
func String(input string) string {
	out := ""
	for _, c := range input {
		out = string(c) + out
	}
	return out
}
