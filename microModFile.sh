#!/bin/sh
#Requires two args: First is the name of the file to read from, second is the name of the new file.
#Don't pass a .tmp extension as $2 or it will be deleted.
#What this script does is basically keep only a HH:MM:SS timestamp, cuts anything else on each line.
#The only thing is that you have to make sure there's a : after the timestamp for this script to work.
#Ex: 01:37:42:adfkjoafsdjkjal --> 01:37:42
if [ $# -eq 2 ]; then
    cp $1 tempfile.txt.tmp #copies contents of $1 to a temp file.
    cat tempfile.txt.tmp | cut -f1,2,3 -d':' | awk '!seen[$0]++' > anothertemp.txt.tmp
    cat anothertemp.txt.tmp | tr -d " \t\r" > $2
    sed '/^$/d' $2 > temp3.txt.tmp #removes blank lines.
    cp temp3.txt.tmp $2
    rm *.tmp
else
    echo "Command line arguments are $# not 2, command requires the original file, then a name for the new file"
    exit 1
fi
