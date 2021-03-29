from api.product_api import product_api
from flask import Flask
from flask_mongoengine import MongoEngine
from flask_cors import CORS

app = Flask(__name__)
CORS(app)
# url_prefix='/api/product'

app.register_blueprint(product_api)
app.config['MONGODB_SETTINGS'] = {
    'db': 'e_comm',
    'host': 'localhost',
    'port': 27017
}
db = MongoEngine(app)


@app.route("/")
def hello_world():
    return "hello world"


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
