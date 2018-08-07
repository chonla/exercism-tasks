package listops

// binFunc is function doing binary operation
type binFunc func(int, int) int

// unaryFunc is function doing unary operation
type unaryFunc func(int) int

// predFunc is function doing predicate operation
type predFunc func(int) bool

// IntList is array of integer
type IntList []int

// Foldr does fold recursively from right to left
func (l IntList) Foldr(fn binFunc, init int) int {
	if len(l) == 0 {
		return init
	}
	return fn(l[0], l[1:].Foldr(fn, init))
}

// Foldl does fold recursively from left to right
func (l IntList) Foldl(fn binFunc, init int) int {
	if len(l) == 0 {
		return init
	}
	sz := len(l)
	return fn(l[0:sz-1].Foldl(fn, init), l[sz-1])
}

// Filter does filter an array of int by given predicate function
func (l IntList) Filter(fn predFunc) IntList {
	out := IntList{}
	for _, v := range l {
		if fn(v) {
			out = append(out, v)
		}
	}
	return out
}

// Length returns number of element in list
func (l IntList) Length() int {
	return len(l)
}

// Map does apply a given function to each element
func (l IntList) Map(fn unaryFunc) IntList {
	out := IntList{}
	for _, v := range l {
		out = append(out, fn(v))
	}
	return out
}

// Reverse returns reversed version of original array
func (l IntList) Reverse() IntList {
	out := IntList{}
	for _, v := range l {
		out = IntList([]int{v}).Append(out)
	}
	return out
}

// Append appends each elements into list and returns extended version of original array
func (l IntList) Append(a IntList) IntList {
	return append(l, a...)
}

// Concat does concatenate each list in given parameters to the original list
func (l IntList) Concat(a []IntList) IntList {
	for _, v := range a {
		l = l.Append(v)
	}
	return l
}
