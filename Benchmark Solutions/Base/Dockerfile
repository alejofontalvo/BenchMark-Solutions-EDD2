# base/Dockerfile

FROM ubuntu:20.04

# Instalar dependencias básicas
RUN apt-get update && apt-get install -y \
    git \
    curl \
    ca-certificates \
    # si necesitamos docker-cli dentro del contenedor
    docker.io \
    # para medir tiempo, etc.
    time \
    # limpiar caché
    && rm -rf /var/lib/apt/lists/*

# Crear directorio de trabajo
WORKDIR /app

# Copiar script de ejecución
COPY run_benchmark.sh /app/run_benchmark.sh
RUN chmod +x /app/run_benchmark.sh

CMD ["/app/run_benchmark.sh"]
