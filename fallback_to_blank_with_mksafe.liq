#!/usr/bin/env liquidsoap
s = input.http("https://icecast.radiofrance.fr/fip-hifi.aac")
s = mksafe(s)

output(s)
