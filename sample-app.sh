#!/bin/bash
# Limpiar carpetas y contenedores previos
rm -rf tempdir
docker stop samplerunning || true
docker rm samplerunning || true

mkdir -p tempdir/templates
mkdir -p tempdir/static

cp sample_app.py tempdir/
cp -r templates/* tempdir/templates/
cp -r static/* tempdir/static/

# Crear el Dockerfile dentro de la carpeta temporal (o usar el de la raíz)
echo "FROM python:3.9-slim
RUN pip install flask
COPY ./static /home/myapp/static/
COPY ./templates /home/myapp/templates/
COPY sample_app.py /home/myapp/
EXPOSE 8080
CMD [\"python3\", \"/home/myapp/sample_app.py\"]" > tempdir/Dockerfile

cd tempdir
# Construir la imagen con seguridad desactivada para evitar el error de hilos
docker build --security-opt seccomp=unconfined -t sampleapp .

# Ejecutar el contenedor
docker run -d -p 9999:8080 --name samplerunning sampleapp
docker ps -a
