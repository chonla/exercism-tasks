/*
Package gigasecond provide a simple method to calculate
the moment from given time with a gigasecond (10^9 seconds).
*/
package gigasecond

import "time"

func AddGigasecond(t time.Time) time.Time {
	d, _ := time.ParseDuration("1000000000s")
	t = t.Add(d)
	return t
}
