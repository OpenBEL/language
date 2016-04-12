#!/usr/bin/env bash

set -e

TOP="$(pwd)"

cp tools/asciidoctor-stylesheets/openbel-custom.css version_2.0
cp tools/asciidoctor-stylesheets/openbel-custom.css version_1.0

cd $TOP/version_1.0
asciidoctor -a stylesheet=openbel-custom.css bel_specification_version_1.0.adoc
asciidoctor-pdf bel_specification_version_1.0.adoc

cd $TOP/version_2.0
asciidoctor -a stylesheet=openbel-custom.css bel_specification_version_2.0.adoc
asciidoctor-pdf bel_specification_version_2.0.adoc
