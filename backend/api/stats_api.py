from models.product import Product
from typing import Dict, List
from flask import Blueprint, jsonify, request, Response
from flask_cors import CORS
from pymongo.results import DeleteResult
from pymongo.command_cursor import CommandCursor
from bson import json_util
from json import dumps
from pymongo.errors import DuplicateKeyError
from models import receipt_collection


stats_api = Blueprint(
    'product_api', 'product_api', url_prefix='/api/product')

# product_api
CORS(stats_api)


@stats_api.route('/get_top_5', methods=['GET'])
def get_top_5():
    result: CommandCursor = receipt_collection.aggregate(
        [
            {
                '$group': {
                    '_id': '$item',
                    'count': {
                        '$sum': 1
                    }
                }
            }, {
                '$sort': {
                    'count': -1
                }
            }, {
                '$limit': 5
            }
        ]
    )
    items: List[Dict[Product, int]] = []
    for doc in result:
        items.append({Product.get_one_document(doc['_id']), doc['count']})
    return Response(
        items, 200, mimetype='application/json'
    )
