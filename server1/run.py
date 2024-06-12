from flask import Flask, request, jsonify, make_response, render_template
import requests
import json
import pika
from flask_cors import CORS

app = Flask(__name__, template_folder='templates', static_folder='static')
CORS(app)

rajaongkir_api_key = "34943098462755445d31e41f9fa7a8db"

def publish_message(queue, message):
    connection = pika.BlockingConnection(pika.ConnectionParameters('localhost'))
    channel = connection.channel()
    channel.queue_declare(queue=queue)
    channel.basic_publish(exchange='', routing_key=queue, body=message)
    connection.close()

@app.route("/", methods=["GET"])
def index():
    return render_template('index.html')

@app.route("/provinsi", methods=["GET"])
def get_provinsi():
    data_rajaongkir = requests.get("https://api.rajaongkir.com/starter/province", headers={"key":rajaongkir_api_key})
    data_rajaongkir = data_rajaongkir.json()
    if data_rajaongkir["rajaongkir"]["status"]["code"] != 200:
        return make_response(
            jsonify(data_rajaongkir)
        )
    else:
        message = json.dumps({"results": data_rajaongkir["rajaongkir"]["results"], "status": 200})
        publish_message('province_queue', message)
        return make_response(
            jsonify({
                "results": data_rajaongkir["rajaongkir"]["results"],
                "status": 200
            })
        )

@app.route("/ongkir", methods=["POST"])
def get_ongkir():
    data_post = request.form.to_dict()
    data_rajaongkir = requests.post(
        "https://api.rajaongkir.com/starter/cost",
        headers={"key": rajaongkir_api_key},
        data=data_post
    )
    data_rajaongkir = data_rajaongkir.json()
    if data_rajaongkir["rajaongkir"]["status"]["code"] != 200:
        return make_response(
            jsonify(data_rajaongkir)
        )
    else:
        return make_response(
            jsonify({
                "result": data_rajaongkir["rajaongkir"]["results"][0]["costs"],
                "status": 200
            })
        )

if __name__ == "__main__":
    app.run(port=5001, debug=True)
