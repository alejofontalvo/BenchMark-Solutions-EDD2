#!/bin/sh

SOLUTIONS_DIR="Soluciones"
LANGUAGES="C# GO Java JavaScript Python"

for lang in $LANGUAGES; do
    echo "==== Construyendo y ejecutando $lang ===="

    cd "$SOLUTIONS_DIR/$lang"

    # Construir la imagen
    docker build -t ${lang,,}-solution .

    # Ejecutar el contenedor y capturar salida
    # (La salida debe ser el tiempo en milisegundos)
    TIME_MS=$(docker run --rm ${lang,,}-solution)

    # Verificar output.txt (opcional: copiando con docker cp o
    # montando volumen; dependerá de cómo definiste el Dockerfile)
    # Ejemplo usando contenedor efímero:
    CID=$(docker create ${lang,,}-solution)
    docker cp $CID:/app/output.txt ./output.txt
    docker rm $CID

    # Leer el resultado
    RESULT=$(cat output.txt)

    echo "Tiempo (ms) = $TIME_MS, Resultado = $RESULT"
    cd ../../
done


