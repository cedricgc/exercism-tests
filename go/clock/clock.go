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

type Clock struct {
	hour, minute int
}

func Time(hour, minute int) Clock {
	minutestoadd := HOUR*hour + minute
	return Clock{hour: 0, minute: 0}.Add(minutestoadd)
}

func (c Clock) String() string {
	return fmt.Sprintf("%.2d:%.2d", c.hour, c.minute)
}

func (c Clock) Add(minutes int) Clock {
	total := HOUR*c.hour + c.minute
	total = total + minutes
	if total < 0 {
		total = DAY - (-total)
	}

	hour := int(total / HOUR)
	hour = hour % DAYHOURS
	if hour < 0 {
		hour = DAYHOURS + hour
	}

	minute := total % HOUR
	if minute < 0 {
		minute = HOUR + minute
		hour = hour - 1
	}

	return Clock{hour: hour, minute: minute}
}
