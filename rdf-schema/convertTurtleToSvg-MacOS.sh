#!/usr/bin/env bash
set -e  # exit on any errors

rapper -i turtle -o dot belRdfSchema-1.0.ttl | sed 's#(Unknown)#BEL 1.0 Schema#' | sed "s#}#labelloc=\"t\"; labeljust=\"l\";}#" | dot -Tsvg | sed "s#<title>%3</title>#<title>BEL 1.0</title>#" > bel1-schema.svg
open -a '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome' bel1-schema.svg

rapper -i turtle -o dot belRdfSchema-2.0.ttl | sed 's#(Unknown)#BEL 2.0 Schema#' | sed "s#}#labelloc=\"t\"; labeljust=\"l\";}#" | dot -Tsvg | sed "s#<title>%3</title>#<title>BEL 2.0</title>#" > bel2-schema.svg
open -a '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome' bel2-schema.svg
