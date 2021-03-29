from flask import Flask
from flask_mongoengine import MongoEngine
# from .models.product import Product
app = Flask(__name__)

app.config['MONGODB_SETTINGS'] = {
    'db': 'e_comm',
    'host': 'localhost',
    'port': 27017
}
db = MongoEngine(app)

if __name__ == "__main__":
    app.run(debug=True)
