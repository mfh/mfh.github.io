#!/bin/bash

readonly OUTPUT="_content-index.html" 
readonly FOLDER="content"

main() {
    echo "<ul>" > $OUTPUT
    for filepath in `find "$FOLDER" -maxdepth 1 -type f | sort`; do
        local filename=`basename "$filepath"`
        local title=${filename%.*}
        title=${title##*-}
        title=${title//_/ }
        local filedate=${filename%-*}
        filedate=$(date -d $filedate +%d\ %b\ %Y)
        echo "    <li>$filedate -- <a href=\"/$filepath\">$title</a></li>" >> $OUTPUT
    done
    echo "</ul>" >> $OUTPUT
}

main $@
