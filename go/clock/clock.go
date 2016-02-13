package clock

import (
	"fmt"
)

const (
	HOUR     = 60
	DAY      = 1440
	DAYHOURS = 24
)

const TestVersion = 2

type Clock uint64

func Time(hour, minute int) Clock {
	minutestoadd := (HOUR*hour + minute) % DAY
	if minutestoadd < 0 {
		minutestoadd += DAY
	}
	return Clock(minutestoadd)
}

func (c Clock) String() string {
	return fmt.Sprintf("%.2d:%.2d", c/60, c%60)
}

func (c Clock) Add(minutes int) Clock {
	if minutes < 0 {
		minutes = (minutes%DAY + DAY)
	}
	return (c + Clock(minutes)) % Clock(DAY)
}
