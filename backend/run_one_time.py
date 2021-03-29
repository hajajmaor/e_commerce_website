from random import choices
from typing import List
from .models.product import Product
from flask_mongoengine import MongoEngine
from datetime import datetime
db = MongoEngine()


def run():
    pros: List[Product] = []

    pros.append(Product(title='Milk', price=5.5,
                        description='Milk box 1 liter', image_url='https://images.theconversation.com/files/380230/original/file-20210122-19-14xvflf.jpg'))

    pros.append(Product(title='Chocolate', price=8,
                        description='Chocolate box 1 KG', image_url='http://www.bakerssupplies.pk/image/cache/Bakware%202/others/new/gcb-600x600.jpg'))

    pros.append(Product(title='6 Pack of water', price=13,
                        description='6 Pack of 2 liter water bottels',
                        image_url='https://images-na.ssl-images-amazon.com/images/I/71vOQZRq-nL._SL1000_.jpg'))

    pros.append(Product(title='Suger', price=3,
                        description='1 KG of sugar', image_url='https://www.foodbusinessnews.net/ext/resources/2020/4/WoodenSpoonSugar_Lead.jpg'))
    for item in pros:
        try:
            item.save()
        except:
            pass

    recs: List[Receipt] = []
    for _ in range(4):
        random_data = choices(pros, k=2)
        recs.append(Receipt(timestamp=datetime.now(), items=random_data))

    for rec in recs:
        try:
            rec.save()
        except:
            pass
