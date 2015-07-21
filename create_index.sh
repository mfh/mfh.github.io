#!/bin/bash

readonly FOLDER="contents"
readonly OUTPUT="_$FOLDER-index.html" 

main() {
    echo "List of $FOLDER:" > $OUTPUT
    echo "<ul>" >> $OUTPUT
    for filepath in `find "$FOLDER" -maxdepth 1 -type f | sort -r`; do
        filename=`basename "$filepath"`

        filedate=${filename:0:8}
        filedate=$(date -d $filedate +%d\ %b\ %Y)

        filetitle=${filename#*-}
        filetitle=${filetitle%-*}
        filetitle=${filetitle//_/ }

        fileauthor=${filename##*-}
        fileauthor=${fileauthor%.*}
        fileauthor=${fileauthor//_/ }

        echo "    <li>$filedate -- <a href=\"/$filepath\">$filetitle</a> [$fileauthor]</li>" >> $OUTPUT
    done
    echo "</ul>" >> $OUTPUT
}

main $@
