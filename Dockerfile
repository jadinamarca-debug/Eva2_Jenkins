FROM python:3.9-slim
# El parámetro --progress-bar off es la clave para evitar el error de hilos
RUN pip install --no-cache-dir --progress-bar off flask
COPY ./static /home/myapp/static/
COPY ./templates /home/myapp/templates/
COPY sample_app.py /home/myapp/
EXPOSE 8080
CMD ["python3", "/home/myapp/sample_app.py"]
