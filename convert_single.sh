#!/bin/bash
base_out="pdf_out"
mkdir -p "$base_out"
file="$1"
file_out="$file"_tmp
gs -sOutputFile="$file_out" -sDEVICE=pdfwrite -sColorConversionStrategy=Gray -dProcessColorModel=/DeviceGray -dCompatibiltyLevel=1.4 -dNOPAUSE -dBATCH "$file"
dir_structure=$(dirname "$file")
newdir="$base_out"/"$dir_structure"
mkdir -p "$newdir"
mv "$file_out" ./"$base_out"/"$file"
echo "Converted $file"
