#!/usr/bin/env liquidsoap
s = input.http("https://icecast.radiofrance.fr/fip-hifi.aac")
emergency = single('./sample_playlist/fog.mp3')
s = fallback(track_sensitive=false, [s, emergency])
output.pulseaudio(s)
