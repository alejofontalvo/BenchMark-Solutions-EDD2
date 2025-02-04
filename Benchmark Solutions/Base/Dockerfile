FROM ubuntu:20.04

# Instalar dependencias básicas
RUN apt-get update && apt-get install -y \
    git \
    curl \
    ca-certificates \
    docker.io \
    time \
    && rm -rf /var/lib/apt/lists/*

# Crear la carpeta destino (por si acaso)
RUN mkdir -p "/Benchmark Solutions/Soluciones"

# Copiar "Soluciones" (o como se llame en tu host) a la ruta deseada
COPY Soluciones "/Benchmark Solutions/Soluciones/"

# Crear directorio de trabajo
WORKDIR /app

# Copiar script de ejecución
COPY run_benchmark.sh /app/run_benchmark.sh
RUN chmod +x /app/run_benchmark.sh

CMD ["/app/run_benchmark.sh"]

