#!/usr/bin/env bash

set -e

TOP="$(pwd)"

cp -r version_1.0/* web
cp version_2.0/bel_specification_version_2.0.adoc web

cd $TOP/web
asciidoctor -a stylesheet=openbel-custom.css bel_specification_version_1.0.adoc
asciidoctor-pdf bel_specification_version_1.0.adoc

asciidoctor -a stylesheet=openbel-custom.css bel_specification_version_2.0.adoc
asciidoctor-pdf bel_specification_version_2.0.adoc

for x in *.pdf *.html *.css *.ico *.jpg *.png; do cp "$x" $TOP; done
