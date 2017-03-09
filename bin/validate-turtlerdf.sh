#!/usr/bin/env bash

set -e

TOP="$(pwd)"

cd $TOP/rdf-schema

echo "#################################################"
echo "##  Validating RDF Turtle files                ##"
echo "#################################################"
for x in *.ttl; do rapper -i turtle -o ntriples "$x" > /dev/null; echo $?; done
