#!/bin/bash

# Format filename: [date YYYYMMDD]-[title_name]-[author_name].[file type]
# ex: 20150730-Installing_Oracle_XE_on_Linux-MFH.txt

main() {
    # get user's input
    read -ep "Enter content's title: " filetitle
    filetitle=${filetitle// /_}

    read -ep "Enter content's author: " fileauthor
    fileauthor=${fileauthor// /_}

    read -ep "Enter content's type: " filetype
    filetype=${filetype// /_}

    read -ep "Enter content's date (YYYYMMDD): " filedate
    if [ -z "$filedate"]; then
        filedate=$(date +%Y\%m\%d)
    fi

    # call vim to edit file
    filename="$filedate"-"$filetitle"-"$fileauthor"."$filetype"
    echo "Add and edit file: $filename"
    vim contents/"$filename"
}

main $@
