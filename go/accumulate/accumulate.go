/*
Package accumulate provides a method doing mapping function to each element of slice.
*/
package accumulate

// Accumulate returns a fn-applied list.
func Accumulate(list []string, fn func(string) string) []string {
	out := []string{}

	for _, element := range list {
		out = append(out, fn(element))
	}
	return out
}
