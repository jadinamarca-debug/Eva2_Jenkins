FROM python:3.9-slim

# Definimos variables para que pip sea lo más básico y "tonto" posible
ENV PIP_NO_CACHE_DIR=1
ENV PIP_PROGRESS_BAR=off

# Instalamos flask usando la opción que evita hilos de red paralelos
RUN pip install --progress-bar off flask

COPY ./static /home/myapp/static/
COPY ./templates /home/myapp/templates/
COPY sample_app.py /home/myapp/
EXPOSE 8080
CMD ["python3", "/home/myapp/sample_app.py"]
