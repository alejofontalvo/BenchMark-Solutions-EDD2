#!/usr/bin/env bash

set -e

SOLUTIONS_DIR="/Benchmark Solutions/Soluciones"

# Valor esperado de la suma de los primeros 10,000 primos (si lo conocemos)
EXPECTED_SUM=":INSERTA_AQUI_EL_VALOR_CORRECTO:"

echo "Lenguaje | Tiempo (ms) | Correcto?"
echo "---------|-------------|----------"

for lang_dir in $(ls -d "$SOLUTIONS_DIR"/*/); do
  lang_name=$(basename "${lang_dir}")

  # Construir la imagen de la solución para cada lenguaje
  docker build -t "solution-${lang_name}" "${lang_dir}"

  # Ejecutar el contenedor (no imprime nada en stdout)
  # y extraer el archivo output.txt con la suma y el tiempo
  docker run --name "temp_container_${lang_name}" "solution-${lang_name}" >/dev/null 2>&1
  
  # Copiar el archivo al host
  docker cp "temp_container_${lang_name}:/app/output.txt" "/tmp/output_${lang_name}.txt"
  
  # Eliminar el contenedor temporal
  docker rm "temp_container_${lang_name}" >/dev/null

  # Leer las dos líneas de output.txt:
  #  - Primera línea: SUMA
  #  - Segunda línea: TIEMPO
  ACTUAL_SUM=$(sed -n '1p' "/tmp/output_${lang_name}.txt")
  EXECUTION_TIME=$(sed -n '2p' "/tmp/output_${lang_name}.txt")
  
  # Comparar la suma real vs la esperada
  if [ "$ACTUAL_SUM" = "$EXPECTED_SUM" ]; then
    CORRECT="Sí"
  else
    CORRECT="No (valor: $ACTUAL_SUM)"
  fi

  # Imprimir resultados en formato tabla
  echo "${lang_name} | ${EXECUTION_TIME} | ${CORRECT}"
done

