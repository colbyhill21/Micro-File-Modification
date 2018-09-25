#!/bin/sh
if [ $# -eq 2 ]; then
        tail -2 $1 > temporaryfilename.txt #saves last line of the file.
        cp $1 temp.txt.tmp
        sed '$ d' temp.txt.tmp > tempfile.txt.tmp
        rm -f temp.txt.tmp
	    cat tempfile.txt.tmp | cut -f1,2,3 -d':' | awk '!seen[$0]++' > anothertemp.txt
        tail -1 temporaryfilename.txt >> anothertemp.txt #adds last line back
	    cat anothertemp.txt | tr -d " \t\r" > $2
        sed '/^$/d' $2 > temp3.txt #removes blank lines.
        cp temp3.txt $2
        rm temporaryfilename.txt
        rm tempfile.txt.tmp
        rm temp3.txt
	rm anothertemp.txt
else
        echo "Command line arguments are $# not 2, command requires the original file, then a name for the new file"
        exit 1
fi

