#!/usr/bin/env liquidsoap

s1 = sine() # 440.
s2 = sine(440. * pow(2., 3. / 12.)) # minor 3rd from root (440 * 2^3/12)
s3 = sine(440. * pow(2., 7. / 12.)) # pure 5th from root (440 * 2^7/12)
s = add([s1, s2, s3])
output(s)
