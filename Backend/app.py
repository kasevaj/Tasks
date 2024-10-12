import sys
import os

sys.path.append(os.path.abspath(os.path.dirname(__file__)))
from flask import Blueprint
from flask_restx import Api
from resources.User import User

api_bp = Blueprint('api', __name__)
api = Api(api_bp)

# Route
api.add_resource(User, '/User')