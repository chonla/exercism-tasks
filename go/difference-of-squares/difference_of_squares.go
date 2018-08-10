/*
Package diffsquares provides methods to calculate difference
of SquareOfSums and SumOfSquares.
*/
package diffsquares

// SquareOfSums calculates square of summation of list of numbers.
func SquareOfSums(num int) int {
	sum := 0
	for i := 1; i <= num; i++ {
		sum += i
	}
	return sum * sum
}

// SumOfSquares calculates summation of list of square of each number.
func SumOfSquares(num int) int {
	sum := 0
	for i := 1; i <= num; i++ {
		sum += i * i
	}
	return sum
}

// Difference calculates difference of SquareOfSums and SumOfSquares
func Difference(num int) int {
	return SquareOfSums(num) - SumOfSquares(num)
}
