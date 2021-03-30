from flask import Flask
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

from api.product_api import product_api
from api.cart_api import cart_api
app.register_blueprint(product_api)
app.register_blueprint(cart_api)


@app.route("/")
def hello_world():
    return "hello world"


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
