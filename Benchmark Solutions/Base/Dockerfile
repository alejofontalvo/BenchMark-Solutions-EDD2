# Base/Dockerfile
FROM docker:dind

# Instalar dependencias en la imagen
RUN apk update && apk add --no-cache bash git

# Crear carpeta de trabajo
WORKDIR /app

# Copiamos el script de orquestación al contenedor
COPY run_benchmark.sh /app/run_benchmark.sh
RUN chmod +x /app/run_benchmark.sh

# Al arrancar el contenedor, se ejecutará tu script
CMD ["/app/run_benchmark.sh"]
