from flask_pymongo import PyMongo
from flask_pymongo.wrappers import Database
from app import app

# connection_string = "mongodb://database:27017/e_comm"
connection_string = "mongodb://localhost:27017/e_comm"
db: Database = PyMongo(app, uri=connection_string).db
