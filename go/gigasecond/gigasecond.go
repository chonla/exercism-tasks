/*
Package gigasecond provide a simple method to calculate
the moment from given time with a gigasecond (10^9 seconds).
*/
package gigasecond

import "time"

// AddGigasecond returns a moment at given time plus 10^9 seconds.
func AddGigasecond(t time.Time) time.Time {
	d, _ := time.ParseDuration("1000000000s")
	t = t.Add(d)
	return t
}
