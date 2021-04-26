from typing import List
from constants import db
from bson import ObjectId
from pymongo.results import InsertOneResult, InsertManyResult
from flask_pymongo.wrappers import Collection, Database
from datetime import datetime

from models.product import Product

receipt_col: Collection = db['receipt']
_cart_col: Collection = db['cart']


class Cart:
    __instance = None

    @staticmethod
    def get_instance():
        """ Static access method. """
        if Cart.__instance is None:
            Cart()
        return Cart.__instance

    def __init__(self):
        if Cart.__instance is not None:
            raise Exception("This class is a singleton!")
        else:
            self.items: List[ObjectId] = []
            Cart.__instance = self

    def add_to_cart(self, oid: str):
        self.items.append(ObjectId(oid))
        return _cart_col.insert_one({'item': Product.get_one_document(oid)})

    def delete_from_cart(self, oid: str):
        try:
            self.items.remove(ObjectId(oid))
            return _cart_col.delete_one({'item._id': ObjectId(oid)})
        except:
            pass

    def save_to_db(self) -> InsertManyResult:
        items_set = set(self.items)
        timestamp = datetime.now()
        result = receipt_col.insert_many([
            {
                'timestamp': timestamp,
                'item': item
            } for item in items_set
        ], ordered=False)
        self.clear_cart()
        return result

    def clear_cart(self):
        self.items.clear()
        _cart_col.drop()
