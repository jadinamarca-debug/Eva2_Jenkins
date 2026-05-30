FROM python:3.9-slim

# Forzamos modo silencioso y sin hilos desde las variables de entorno
ENV PIP_NO_CACHE_DIR=1
ENV PIP_PROGRESS_BAR=off
ENV PIP_DISABLE_PIP_VERSION_CHECK=1

# Usamos --quiet (o -q) para que pip no intente dibujar nada
RUN pip install -q flask

COPY ./static /home/myapp/static/
COPY ./templates /home/myapp/templates/
COPY sample_app.py /home/myapp/
EXPOSE 8080
CMD ["python3", "/home/myapp/sample_app.py"]
