package gigasecond

import (
	"time"
)

const TestVersion = 3

const (
	Gigasecond = time.Duration(1000000000) * time.Second
)

func AddGigasecond(t time.Time) time.Time {
	return t.Add(Gigasecond)
}
