#!/usr/bin/env bash
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"/../../

"$DIR"/tools/asciidoc/asciidoc.py -b html5 -a toc2 -a theme=flask \
    version_1.0/bel_specification_version_1.0.adoc
