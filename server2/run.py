from database import *
from flask import Flask, request, jsonify, make_response
import json
import pika
import threading
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

def callback(ch, method, properties, body):
    data = json.loads(body)
    print("Received data:", data)

def start_consumer():
    connection = pika.BlockingConnection(pika.ConnectionParameters('localhost'))
    channel = connection.channel()
    channel.queue_declare(queue='province_queue')
    channel.basic_consume(queue='province_queue', on_message_callback=callback, auto_ack=True)
    print('Waiting for messages...')
    channel.start_consuming()

consumer_thread = threading.Thread(target=start_consumer)
consumer_thread.start()

@app.route("/", methods=["GET"])
def index():
    return "welcome to TokoKu server 2"

@app.route("/produk/<id>", methods=["GET"])
def get_produk(id):
    sql = f"SELECT * FROM produk WHERE produk.id = {id}"
    data = get_data(query=sql)
    if data:
        return make_response(
            jsonify({
                "status": 200,
                "message": f"query berhasil, id produk {id} terdaftar",
                "result": {
                    "id_penjual": data[0][1],
                    "harga": data[0][2],
                    "berat": data[0][3],
                    "nama_produk": data[0][4],
                    "gambar_produk": data[0][5]
                }
            })
        )
    else:
        return make_response(
            jsonify({
                "status": 404,
                "message": f"query gagal, id produk {id} tidak terdaftar"
            })
        )

@app.route("/penjual/<id>", methods=["GET"])
def get_kota_penjual(id):
    sql = f"SELECT id_kota FROM penjual WHERE penjual.id = {id}"
    data = get_data(query=sql)
    if data:
        return make_response(
            jsonify({
                "status": 200,
                "message": f"query berhasil, id penjual {id} terdaftar",
                "result": {
                    "id_kota": data[0][0]
                }
            })
        )
    else:
        return make_response(
            jsonify({
                "status": 404,
                "message": f"query gagal, id penjual {id} tidak terdaftar"
            })
        )

if __name__ == "__main__":
    app.run(port=5002, debug=True)
