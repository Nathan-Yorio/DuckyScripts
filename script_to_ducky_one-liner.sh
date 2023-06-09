#!/bin/bash

# This script will convert an input file into an echo-able one liner that can be put into a duckyscript like so:
# STRING echo -e '#!/bin/sh\n\nsudo sysctl -w net.ipv6.conf.all.disable_ipv6=0\n > enable_ipv6.sh && chmod +x enable_ipv6.sh
# It preserves escape characters so that the one liner can be dumped into a script and then run all from duckyscript

#Accept an input script as a parameter
filename=$1
file_content=""

# Read all of the lines of the input script into a variable
while IFS= read -r line; do
  file_content+="$line\n"
done < "$filename"

# Output the variable, while also replacing all newlines with 
# an escaped newline character
echo -e "echo ${file_content//\\n/\\\\n}"
