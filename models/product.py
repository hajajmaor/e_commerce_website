# from ..app import app
from flask_mongoengine import MongoEngine


# from mongoengine import *
db = MongoEngine()


class Product(db.Document):
    """
    Products

    Args:
        title = db.StringField(required=True, max_length=30)
        price = db.FloatField(required=True)
        description = db.StringField(required=True, max_length=300)
        image = db.StringField(required=True)
    """
    title = db.StringField(required=True, max_length=30)
    price = db.FloatField(required=True)
    description = db.StringField(required=True, max_length=300)
    image_url = db.URLField(required=True)
    meta = {
        "indexes": [
           {'fields': ['title', 'price'], 'unique': True}
        ]
    }


# Product(title='Miao', price=2.56,
#         description="fiosahnjfdlasoknlod", image='https://nionaisk')
