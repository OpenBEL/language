#!/usr/bin/env bash

cd ../..

./node_modules/.bin/ttl rdf-schema/belRdfSchema-1.0.ttl
EXIT_CODE = $?

./node_modules/.bin/ttl rdf-schema/belRdfSchema-2.0.ttl

EXIT_CODE = $?
if [ $EXIT_CODE -ne 0 ]; then
    echo "Error for BEL 2.0 Turtle RDF"
fi
