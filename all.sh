#!/usr/bin/env bash
#
# Este script se encarga de invocar los tres programas que permiten la 
# conversion de un PNG a secuencia de pixeles, se procesan esos pixeles y
# posteriormente se convierte esa secuencia de pixeles a un archivo en formato
# PNG
#
# Autor: John Sanabria - john.sanabria@correounivalle.edu.co
# Fecha: 2024-08-22
# Procesar todas las imágenes PNG en la carpeta actual
for INPUT_JPG in *.jpg; do
    TEMP_FILE="${INPUT_JPG%.jpg}.bin"
    python3 fromJPG2Bin.py "${INPUT_JPG}"
    ./main "${TEMP_FILE}"
    python3 fromBin2JPG.py "${TEMP_FILE}.new"
done
