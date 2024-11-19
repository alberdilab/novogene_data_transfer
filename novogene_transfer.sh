#!/bin/bash

# Check if an argument is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <path_argument>"
    exit 1
fi

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

## Transfer data to ERDA
echo "Transferring .fq.gz files to $remote_path using SFTP..."
erda <<EOF
cd $remote_path
lcd $(pwd)
mput *.fq.gz
bye
EOF
