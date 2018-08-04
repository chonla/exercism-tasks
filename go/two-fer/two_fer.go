/*
Package twofer offers a simple method for templating
a string "One for X, one for me." where X is a name
of "you".
*/
package twofer

import "fmt"

// ShareWith returns a compiled version of "One for X, one for me." template
// with given name.
func ShareWith(name string) string {
	if name == "" {
		name = "you"
	}
	return fmt.Sprintf("One for %s, one for me.", name)
}
