/*
Package leap provides a method to determine whether a given year is leap year or not.
*/
package leap

// IsLeapYear returns true if it is leap year, otherwise, returns false.
func IsLeapYear(year int) bool {
	return (year%4 == 0) && ((year%400 == 0) || (year%100 != 0))
}
