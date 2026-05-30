FROM python:3.9-slim

ENV PIP_NO_CACHE_DIR=1
ENV PIP_PROGRESS_BAR=off

RUN pip install -q flask

# MUY IMPORTANTE: Establecer el directorio de trabajo
WORKDIR /home/myapp

# Copiar las carpetas (asegúrate de que los nombres coincidan con tu repo)
COPY ./static /home/myapp/static
COPY ./templates /home/myapp/templates
COPY sample_app.py /home/myapp/

EXPOSE 8080

CMD ["python3", "sample_app.py"]
