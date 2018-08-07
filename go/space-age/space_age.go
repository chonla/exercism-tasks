/*
Package space provides a method to calculate age on different planet based on earth.
*/
package space

// Planet represents planet name
type Planet string

const earthYearInSeconds = 31557600.0

var planetTimeProportion = map[Planet]float64{
	"Earth":   1.0,
	"Mercury": 0.2408467,
	"Venus":   0.61519726,
	"Mars":    1.8808158,
	"Jupiter": 11.862615,
	"Saturn":  29.447498,
	"Uranus":  84.016846,
	"Neptune": 164.79132,
}

// Age calculate age on given planet from given age in second base on earth time.
func Age(seconds float64, planet Planet) float64 {
	return seconds / (earthYearInSeconds * planetTimeProportion[planet])
}
