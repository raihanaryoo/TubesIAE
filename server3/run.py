from flask import Flask, request, jsonify, make_response
import requests
import json
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

server1 = "http://127.0.0.1:5001"
server2 = "http://127.0.0.1:5002"

@app.route("/", methods=["GET"])
def index():
    return "welcome to TokoKu server 3"

@app.route("/order", methods=["POST"])
def order():
    data_post = request.form.to_dict()
    data_allowed = [
        "id_produk",
        "jumlah_pembelian",
        "id_kota",
        "kurir",
        "paket_pengiriman"
    ]
    data_post_empty = list()
    data_post_valid = dict()
    for key in data_allowed:
        if key in data_post:
            if data_post[key] == "":
                data_post_empty.append(key)
            else:
                data_post_valid[key] = data_post[key]
        else:
            data_post_empty.append(key)
    
    if len(data_post_empty) != 0:
        return make_response(
            jsonify({
                "status": 400,
                "message": "beberapa form data belum diisi",
                "empty_form": data_post_empty
            })
        )
    
    # Request product data from server2
    data_produk = requests.get(f"{server2}/produk/{data_post_valid['id_produk']}")
    if data_produk.status_code != 200:
        return make_response(jsonify({"status": data_produk.status_code, "message": data_produk.text}), data_produk.status_code)
    data_produk = data_produk.json()["result"]

    # Request seller's city from server2
    data_kota = requests.get(f"{server2}/penjual/{data_produk['id_penjual']}")
    if data_kota.status_code != 200:
        return make_response(jsonify({"status": data_kota.status_code, "message": data_kota.text}), data_kota.status_code)
    data_produk["id_kota_penjual"] = data_kota.json()["result"]["id_kota"]

    # Request shipping cost from server1
    data_ongkir = requests.post(
        f"{server1}/ongkir",
        data={
            "origin": data_produk["id_kota_penjual"],
            "destination": data_post_valid["id_kota"],
            "weight": data_produk["berat"],
            "courier": data_post_valid["kurir"],
            "service": data_post_valid["paket_pengiriman"]
        }
    )
    if data_ongkir.status_code != 200:
        return make_response(jsonify({"status": data_ongkir.status_code, "message": data_ongkir.text}), data_ongkir.status_code)
    data_ongkir = data_ongkir.json()["result"]

    # Find the correct service in the data_ongkir list
    service_found = None
    for service in data_ongkir:
        if service["service"].lower() == data_post_valid["paket_pengiriman"].lower():
            service_found = service
            break

    if not service_found:
        return make_response(
            jsonify({
                "status": 404,
                "message": "Service not found in shipping cost data"
            })
        )

    total_harga = service_found["cost"][0]["value"] + (int(data_produk["harga"]) * int(data_post_valid["jumlah_pembelian"]) * 1000.0)
    return make_response(
        jsonify({
            "status": 200,
            "result": {
                "total_harga": total_harga,
                "jumlah_pembelian": data_post_valid["jumlah_pembelian"],
                "detail": {
                    "produk": data_produk,
                    "ongkos kirim": {
                        "kurir": data_post_valid["kurir"],
                        "paket_pengiriman": service_found["service"],
                        "cost": service_found["cost"]
                    }
                }
            }
        })
    )

    
if __name__ == "__main__":
    app.run(port=5003, debug=True)
