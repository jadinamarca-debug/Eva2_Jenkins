from flask import Flask, render_template, request

# ESTA ES LA LÍNEA QUE FALTA O ESTÁ MAL:
app = Flask(__name__)

@app.route("/")
def main():
    return render_template("index.html")

if __name__ == "__main__":
    # threaded=False obliga a Flask a usar el hilo principal para todo
    app.run(host="0.0.0.0", port=8080, threaded=False)
