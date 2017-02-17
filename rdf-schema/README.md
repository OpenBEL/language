# Notes for BEL Schema generation

## Graph visualization of BEL RDF Schema

    bel rdfschema -f turtle
    rapper -i turtle bel-schema1.ttl -o dot | dot -Tpdf -obel-schema1.pdf

    bel_rdfschema.rb | rapper -i ntriples -o dot --input-uri "http://www.openbel.org/vocabulary/" - | sed 's#http://www.openbel.org/vocabulary/#bel:#g' | sed 's#http://www.w3.org/2000/01/rdf-schema#rdfschema:#g' | sed 's#http://www.w3.org/1999/02/22-rdf-syntax-ns#rdfsyntax:#g' | sed 's#http://www.w3.org/2004/02/skos/core#skos:#g' | sed 's#http://www.w3.org/2001/XMLSchem#xmlschema:#g' | dot -Tsvg > bel-schema1.svg
