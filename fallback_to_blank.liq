#!/usr/bin/env liquidsoap
s = input.http("https://icecast.radiofrance.fr/fip-hifi.aac")
s = fallback(track_sensitive=false, [s, blank()])
output.pulseaudio(s)
