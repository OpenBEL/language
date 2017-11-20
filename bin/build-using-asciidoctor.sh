#!/usr/bin/env bash
set -e
top="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"/..
cd $top

# build each version
for x in version*; do
    cd "$x"
    for y in *.adoc; do
        echo "Building html and pdf for" $y
        asciidoctor -D $top/docs/$x -a stylesheet=$top/docs/css/openbel-custom.css "$y"
        asciidoctor-pdf -D $top/docs/$x "$y"
    done
    cd ..
done

