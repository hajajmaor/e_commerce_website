from flask import Blueprint, jsonify
from flask_cors import CORS
from models.product import Product

product_api = Blueprint(
    'product_api', 'product_api', url_prefix='/api/product')

CORS(product_api)


@product_api.route('/get_all', methods=['GET'])
def get_all():
    return jsonify(Product.objects())
