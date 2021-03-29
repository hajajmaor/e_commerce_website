from constants import db
from flask_pymongo.wrappers import Collection, Database

from bson import ObjectId

_product_col: Collection = db['product']


class Product:
    """
    Products

    Args:
        title = db.StringField(required=True, max_length=30)
        price = db.FloatField(required=True)
        description = db.StringField(required=True, max_length=300)
        image = db.StringField(required=True)
    """

    def __init__(self, title: str, price: float, description: str, image: str, oid: str = None):
        self.title = title
        self.price = price
        self.description = description
        self.image = image

    @staticmethod
    def get_all() -> list:
        return list(_product_col.find())

    @staticmethod
    def get_one_document(oid: str):
        return _product_col.find_one({'_id': ObjectId(oid)})

    @staticmethod
    def find_and_update(oid: str, data: dict):
        _product_col.find_one_and_update({'_id': ObjectId(oid)}, data)

    @staticmethod
    def find_and_delete(oid: str):
        result = _product_col.delete_one({'_id': ObjectId(oid)})
        return result

    @staticmethod
    def create_new(args: dict):
        return _product_col.insert_one(args)
