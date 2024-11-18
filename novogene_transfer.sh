#!/bin/bash

## Download files
if ls *.csv 1> /dev/null 2>&1; then
    wget -i *.csv
else
    echo "Error: No CSV files found in the directory." >&2
    exit 1
fi

## Unpack tarballs
for file in *.tar; do
    if [ -f "$file" ]; then
        echo "Extracting $file..."
        tar -xf "$file"
        echo "$file extracted successfully."
    else
        echo "No .tar files found in the directory."
        exit 1
    fi
done

## Move all fq.gz files to the working directory
mv */*/*/*.fq.gz .

