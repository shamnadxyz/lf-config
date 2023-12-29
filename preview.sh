#!/usr/bin/env zsh
file=$1
w=$2
h=$3
x=$4
y=$5

preview() {
    kitty +kitten icat --silent --stdin no --transfer-mode file --place "${w}x${h}@${x}x${y}" "$1" < /dev/null > /dev/tty
}

filetype=$(file -Lb --mime-type "$file")

case "${filetype}" in
    image/*) preview "$file" ;;
    text/*) cat "$file" ;;
application/zip
    |application/x-tar
    |application/x-xz
    |application/rar
    |application/gzip
    |x-7z-compressed) 7zz l "$file" ;;
esac
return 1
