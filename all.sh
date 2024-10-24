#!/usr/bin/env bash
#
# Este script se encarga de invocar los tres programas que permiten la 
# conversion de un PNG a secuencia de pixeles, se procesan esos pixeles y
# posteriormente se convierte esa secuencia de pixeles a un archivo en formato
# PNG
#
# Autor: John Sanabria - john.sanabria@correounivalle.edu.co
# Fecha: 2024-08-22
#
# Definimos una matriz (array) con los nombres de las imágenes
IMAGES=("image.png" "img1.png" "img2.png" "img3.png" "img4.png" "img5.png" 
        "img6.png" "img7.png" "img8.png" "img9.png" "img10.png" "img11.png" 
        "img12.png" "img13.png" "img14.png" "img15.png" "img16.png" "img17.png" "img18.png")

# Iteramos sobre cada imagen en la matriz
for IMG in "${IMAGES[@]}"; 
do
  # Definimos el archivo temporal basado en el nombre de la imagen
  INPUT_PNG="${IMG}"
  TEMP_FILE="${INPUT_PNG%.*}.bin"  # Esto elimina la extensión (.png) y agrega .bin
  
  # Convertimos el PNG a binario
  python fromPNG2Bin.py ${INPUT_PNG}
  
  # Procesamos el archivo binario con el programa `main`
  ./main ${TEMP_FILE}
  
  # Convertimos el binario procesado nuevamente a PNG
  python fromBin2PNG.py ${TEMP_FILE}.new
done