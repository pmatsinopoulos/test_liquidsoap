#!/usr/bin/env liquidsoap

day = playlist("./sample_playlist/day")
night = playlist("./sample_playlist/night")
radio = switch([({8h-20h}, day), ({20h-8h}, night)])
# Add crossfading
radio = crossfade(fade_out=3., fade_in=3., duration=5., radio)
# Add some audio effects
radio = nrj(normalize(radio))
# Just in case, a fallback
radio = fallback([radio, single("./sample_playlist/Calm.mp3")])
# Output to icecast both in mp3 and aac
output.icecast(%mp3, host="localhost", port=8000, password="panos", mount="my-radio.mp3", radio)
output.icecast(%fdkaac, host="localhost", port=8000, password="panos", mount="my-radio.aac", radio)
