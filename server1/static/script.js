$(document).ready(function() {
    $('#loadProvinces').click(function() {
        $.ajax({
            url: 'http://127.0.0.1:5001/provinsi',
            method: 'GET',
            success: function(data) {
                var result = '<ul class="list-group">';
                data.results.forEach(function(province) {
                    result += '<li class="list-group-item">' + province.province + '</li>';
                });
                result += '</ul>';
                $('#provincesResult').html(result);
            },
            error: function(error) {
                $('#provincesResult').html('<p>Error loading provinces</p>');
            }
        });
    });

    $('#loadProduct').click(function() {
        var productId = $('#productId').val();
        $.ajax({
            url: 'http://127.0.0.1:5002/produk/' + productId,
            method: 'GET',
            success: function(data) {
                if (data.status === 200) {
                    var product = data.result;
                    var result = '<div class="card"><div class="card-body">';
                    result += '<h5 class="card-title">' + product.nama_produk + '</h5>';
                    result += '<p class="card-text">Price: ' + product.harga + '</p>';
                    result += '<p class="card-text">Weight: ' + product.berat + '</p>';
                    result += '<img src="' + product.gambar_produk + '" class="card-img-top" alt="Product Image">';
                    result += '</div></div>';
                    $('#productResult').html(result);
                } else {
                    $('#productResult').html('<p>Product not found</p>');
                }
            },
            error: function(error) {
                $('#productResult').html('<p>Error loading product</p>');
            }
        });
    });

    $('#placeOrder').click(function() {
        var formData = new FormData();
        formData.append('id_produk', $('#orderIdProduk').val());
        formData.append('jumlah_pembelian', $('#orderJumlah').val());
        formData.append('id_kota', $('#orderKota').val());
        formData.append('kurir', $('#orderKurir').val());
        formData.append('paket_pengiriman', $('#orderService').val());

        $.ajax({
            url: 'http://127.0.0.1:5003/order',
            method: 'POST',
            processData: false,
            contentType: false,
            data: formData,
            success: function(data) {
                if (data.status === 200) {
                    var result = '<p>Total Price: ' + data.result.total_harga + '</p>';
                    result += '<p>Quantity: ' + data.result.jumlah_pembelian + '</p>';
                    result += '<div><h3>Product Details:</h3>';
                    result += '<p>Name: ' + data.result.detail.produk.nama_produk + '</p>';
                    result += '<p>Price: ' + data.result.detail.produk.harga + '</p>';
                    result += '<p>Weight: ' + data.result.detail.produk.berat + '</p></div>';
                    result += '<div><h3>Shipping Details:</h3>';
                    result += '<p>Courier: ' + data.result.detail["ongkos kirim"].kurir + '</p>';
                    result += '<p>Service: ' + data.result.detail["ongkos kirim"].paket_pengiriman + '</p>';
                    result += '<p>Cost: ' + data.result.detail["ongkos kirim"].cost[0].value + '</p>';
                    result += '<p>Estimated Delivery: ' + data.result.detail["ongkos kirim"].cost[0].etd + '</p></div>';
                    $('#orderResult').html(result);
                } else {
                    $('#orderResult').html('<p>Failed to place order</p>');
                }
            },
            error: function(error) {
                $('#orderResult').html('<p>Error placing order</p>');
            }
        });
    });
});
