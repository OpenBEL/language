#!/usr/bin/env bash
XSDs=($(find xml-schema/ -name "*.xsd"))
failure=0
tmpfile=$(mktemp)
for xsd in "${XSDs[@]}"; do
    echo -n "Validating $xsd... "
    xmllint --noout "$xsd" >$tmpfile 2>&1
    ec=$?
    if [ $ec -ne 0 ]; then
        echo FAILED
        failure=1
        cat $tmpfile >&2
        echo
        continue
    fi
    echo "okay."
done

rm -f "$tmpfile"
if [ $failure -eq 1 ]; then
    exit 1
fi

