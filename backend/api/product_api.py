from flask import Blueprint, jsonify, request, Response
from flask_cors import CORS
from models.product import Product
from bson import json_util
from json import dumps
from pymongo.errors import DuplicateKeyError

product_api = Blueprint(
    'product_api', 'product_api', url_prefix='/api/product')

# product_api
CORS(product_api)


@product_api.route('/get_all', methods=['GET'])
def get_all():
    return Response(dumps(Product.get_all(),
                          default=json_util.default),
                    200,
                    mimetype='application/json'
                    )


@product_api.route('/update', methods=['POST', 'PUT'])
def update():
    args: dict = request.args.to_dict()
    args.update(request.form.to_dict())
    oid = args.pop('oid')
    # single_product = Product.get_one_document(args.get('oid')).next()

    return jsonify(Product.find_and_update(oid, args))


@product_api.route('/remove', methods=['delete', 'purge'])
def remove():
    args: dict = request.args.to_dict()
    args.update(request.form.to_dict())
    # oid = args.pop('oid')
    result = Product.find_and_delete(args.get('oid'))
    return jsonify(result)


@product_api.route('/create', methods=['POST'])
def create():
    args: dict = request.args.to_dict()
    args.update(request.form.to_dict())
    if len(args) != 4:
        return jsonify({'error': 'missing values'}), 403
    try:
        _item = Product(
            title=args['title'],
            description=args['description'],
            image=args['image'],
            price=args['price'],
        )
        result = _item.create_new(_item.__dict__)

        return Response(dumps(result.__dict__,
                              default=json_util.default),
                        200,
                        mimetype='application/json'
                        )
    except DuplicateKeyError as e:
        return jsonify({"error": e.details})


@product_api.route("/get_data_about_product")
def get_data_about_product():
    args: dict = request.args.to_dict()
    args.update(request.form.to_dict())

    return Response(
        dumps(Product.get_one_document(args.get('oid')),
              default=json_util.default),
        200,
        mimetype='application/json'
    )
