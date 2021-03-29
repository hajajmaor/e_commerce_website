from datetime import datetime
from .product import Product
from app import app
from flask_mongoengine import MongoEngine
db = MongoEngine(app)


class Receipt(db.Document):
    """

    Args:
        timestamp = db.DateTimeField(required=True)
        items = db.EmbeddedDocumentListField(Product, required=True)
    """
    timestamp = db.DateTimeField(required=True, default=datetime.now())
    items = db.ListField(db.ReferenceField(
        Product), required=True)
    meta = {
        "indexes": [
            {'fields': ['timestamp', 'items'], 'unique': True}
        ]
    }
