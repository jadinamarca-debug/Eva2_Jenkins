#!/bin/bash
# 1. Limpiar todo lo anterior
docker stop samplerunning || true
docker rm samplerunning || true

# 2. Desactivar BuildKit para evitar hilos de construcción
export DOCKER_BUILDKIT=0

# 3. Construir la imagen directamente en la raíz (donde está tu Dockerfile)
docker build -t sampleapp .

# 4. Correr el contenedor
docker run -d -p 9999:8080 --name samplerunning sampleapp

# 5. Mostrar que quedó corriendo
docker ps -a
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
