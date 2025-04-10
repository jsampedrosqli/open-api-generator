#!/bin/bash

filePath='./target/yaml-specs/src/specs/hybris/*/specification-v2.yaml'

for file in $filePath; do
    # Extract the file name without extension for apiSpec property
    apiSpec=$(basename "$file")
    #apiSpec="${apiSpec%.*}"
    relativeApiPath="${file#./target/yaml-specs/}"

    echo "Processing: $relativeApiPath"

    # Extract the wildcard directory name (the part replacing "*")
    wildcardName=$(basename "$(dirname "$file")")


    mvn generate-sources -P generate-openapi -DrelativeApiPath=$relativeApiPath -Ddomain=$wildcardName
done
