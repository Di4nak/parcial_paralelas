@echo off
setlocal EnableDelayedExpansion
REM Este script se encarga de invocar los tres programas que permiten la 
REM conversión de un JPG a secuencia de píxeles, se procesan esos píxeles y
REM posteriormente se convierte esa secuencia de píxeles a un archivo en formato
REM JPG

REM Procesar todas las imágenes JPG en la carpeta actual
for %%I in (*.jpg) do (
    set "INPUT_JPG=%%I"
    set "TEMP_FILE=%%~nI.bin"
    
    python3 fromJPG2Bin.py "!INPUT_JPG!"
    main.exe "!TEMP_FILE!"
    python3 fromBin2JPG.py "!TEMP_FILE!.new"
)