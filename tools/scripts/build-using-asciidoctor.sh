#!/usr/bin/env bash

asciidoctor -a stylesheet=../tools/asciidoctor-stylesheets/foundation.css version_1.0/bel_specification_version_1.0.adoc
EXIT_CODE=$?
if [ $EXIT_CODE -ne 0 ]; then
    # error with v1.0
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo "| Error rendering HTML for BEL v1.0 specification! |"
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
fi


EXIT_CODE=$?
if [ $EXIT_CODE -ne 0 ]; then
    # error with v2.0
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo "| Error rendering HTML for BEL v2.0 specification! |"
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
fi

asciidoctor-pdf version_1.0/bel_specification_version_1.0.adoc
EXIT_CODE=$?
if [ $EXIT_CODE -ne 0 ]; then
    # error with pdf for v1.0
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo "| Error rendering PDF for BEL v1.0 specification! |"
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
fi

asciidoctor-pdf version_2.0/bel_specification_version_2.0.adoc
EXIT_CODE=$?
if [ $EXIT_CODE -ne 0 ]; then
    # error with pdf for v1.0
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo "| Error rendering PDF for BEL v2.0 specification! |"
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
fi

exit $EXIT_CODE



# New code to convert to html: 
# asciidoctor -a stylesheet=openbel-custom.css -a stylesdir=. bel_specification_version_2.0.adoc 
