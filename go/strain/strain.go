/*
Package strain provides methods to do filtering to list.
*/
package strain

// Ints is array of int
type Ints []int

// Keep is filter function keeping element that satisfies predicate.
func (l Ints) Keep(pred func(int) bool) Ints {
	if l == nil {
		return nil
	}
	out := Ints{}
	for _, v := range l {
		if pred(v) {
			out = append(out, v)
		}
	}
	return out
}

// Discard is filtter function keeping element that does not satisfy predicate.
func (l Ints) Discard(pred func(int) bool) Ints {
	if l == nil {
		return nil
	}
	out := Ints{}
	for _, v := range l {
		if !pred(v) {
			out = append(out, v)
		}
	}
	return out
}

// Strings is array of string
type Strings []string

// Keep is filter function keeping element that satisfies predicate.
func (l Strings) Keep(pred func(string) bool) Strings {
	if l == nil {
		return nil
	}
	out := Strings{}
	for _, v := range l {
		if pred(v) {
			out = append(out, v)
		}
	}
	return out
}

// Lists is array of list of int
type Lists [][]int

// Keep is filter function keeping element that satisfies predicate.
func (l Lists) Keep(pred func([]int) bool) Lists {
	if l == nil {
		return nil
	}
	out := Lists{}
	for _, v := range l {
		if pred(v) {
			out = append(out, v)
		}
	}
	return out
}
