#!/bin/bash

if [ "$#" -ne 4 ]; then
    echo "Usage: $0 yyyy-mm-dd source number lang"
    exit 1
fi

input="./_posts/template/codingtest.md"

if [ ! -f "${input}" ]; then
    echo "There is no such file: ${input}"
    exit 1
fi

output="./_posts/$1-$2$3_$4.md"

cp "${input}" "${output}"

echo "Successfully created: ${output}"
