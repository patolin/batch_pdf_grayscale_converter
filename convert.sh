#!/bin/bash
#convierte lote de archivos
#uso: ./convierte.sh ./ruta_pdfs
find $1 -name "*.pdf" > listapdf.txt
mkdir pdfgris
base_out="pdfgris"
for file in $( < listapdf.txt)
do
        gs -sOutputFile=pdfgris.pdf -sDEVICE=pdfwrite -sColorConversionStrategy=Gray -dProcessColorModel=/DeviceGray -dCompatibiltyLevel=1.4 -dNOPAUSE -dBATCH "$file"
        dir_structure=$(dirname "$file")
        newdir="$base_out"/"$dir_structure"
        mkdir -p "$newdir"
        mv pdfgris.pdf ./pdfgris/"$file"
done
rm listapdf.txt
