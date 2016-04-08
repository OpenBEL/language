#!/usr/bin/env bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"/../../

asciidoctor version_1.0/bel_specification_version_1.0.adoc
EXIT_CODE=$?
if [ $EXIT_CODE -ne 0 ]; then
    # error with v1.0
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo "| Error rendering HTML for BEL v1.0 specification! |"
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
fi

asciidoctor version_2.0/bel_specification_version_2.0.adoc
EXIT_CODE=$?
if [ $EXIT_CODE -ne 0 ]; then
    # error with v2.0
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo "| Error rendering HTML for BEL v2.0 specification! |"
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
fi
exit $EXIT_CODE

# asciidoc.py version
#
# "$DIR"/tools/asciidoc/asciidoc.py -b html5 -a toc2 -a theme=flask \
#     version_1.0/bel_specification_version_1.0.adoc

# EXIT_CODE=$?
# if [ $EXIT_CODE -ne 0 ]; then
#     # error with v1.0
#     echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
#     echo "| Error rendering HTML for BEL v1.0 specification! |"
#     echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
#     echo "The asciidoc file for BEL v1.0 was:\n"
#     cat version_1.0/bel_specification_version_1.0.adoc
# fi

# "$DIR"/tools/asciidoc/asciidoc.py -b html5 -a toc2 -a theme=flask \
#     version_2.0/bel_specification_version_2.0.adoc
# EXIT_CODE=$?
# if [ $EXIT_CODE -ne 0 ]; then
#     # error with v2.0
#     echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
#     echo "| Error rendering HTML for BEL v2.0 specification! |"
#     echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
#     echo "The asciidoc file for BEL v2.0 was:\n"
#     cat version_2.0/bel_specification_version_2.0.adoc
# fi

# exit $EXIT_CODE
