from flask import Blueprint, jsonify, request, Response
from flask_cors import CORS
from pymongo.results import DeleteResult

from models.product import Product
from models.cart import Cart
from bson import json_util
from json import dumps

cart_api = Blueprint(
    'cart_api', 'cart_api', url_prefix='/api/cart')

# product_api
CORS(cart_api)
cart: Cart = Cart.get_instance()


@cart_api.route('/get_all', methods=['GET'])
def get_all():
    data = []
    for oid in cart.items:
        data.append(Product.get_one_document(str(oid)))
    return Response(dumps(data, default=json_util.default),
                    200, mimetype='application/json')


@cart_api.route('/add_to_cart', methods=['POST'])
def update():
    args: dict = request.args.to_dict()
    args.update(request.form.to_dict())
    if len(args) != 1:
        return jsonify({'error': 'object id not provided'}), 404
    try:
        oid = args.get('oid')
        # return Response(dumps(cart.add_to_cart(oid).acknowledged,
        #                       default=json_util.default),
        #                 200, mimetype='application/json')
        if cart.add_to_cart(oid).acknowledged:
            return jsonify(True), 200
        else:
            return jsonify(False), 400
    except ValueError as e:
        return jsonify(e.args), 400
    except Exception as e:
        return jsonify({'error': e.args}), 400


@cart_api.route('/remove_from_cart', methods=['delete', 'purge'])
def remove():
    args: dict = request.args.to_dict()
    args.update(request.form.to_dict())
    # oid = args.pop('oid')
    result = cart.delete_from_cart(args.get('oid'))
    if result is DeleteResult:
        return jsonify(result.deleted_count)

    return jsonify(False), 404


@cart_api.route('/buy', methods=['POST', 'get'])
def buy():
    return Response(dumps(cart.save_to_db().inserted_ids, default=json_util.default),
                    200, mimetype='application/json')


@cart_api.route("/clear_cart")
def clear_cart():
    cart.clear_cart()
    return 200
