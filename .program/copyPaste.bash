#!/bin/bash
dt=$(xclip -o -sel clip)
# dt=${dt//$'\n'/} # Remove all newlines.
# dt=${dt%$'\n'}   # Remove a trailing newline.
dt=$(echo $dt | tr '\r\n' ' ')

#dt=$($dt//$replace/$with)
echo $dt

${parameter//pattern/string}
echo $dt | xclip -sel clip
