#!/usr/bin/env bash
set -e
top="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"/../../

# web is served by GitHub on the gh-pages branch
web="${top}"/web
cd "${web}" || exit 1

# remove any old versions in web (our CWD)
rm -fr version*

# copy all versions we find to web (our CWD)
for x in "${top}"/version*; do
    cp -a "${x}" .
done

# build each version
for x in version*; do
    cd "$x"
    for y in *.adoc; do
        asciidoctor -a stylesheet=../css/openbel-custom.css "$y"
        asciidoctor-pdf "$y"
    done
    cd ..
done

