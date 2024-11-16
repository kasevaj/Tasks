import os
import sys  # for accessing environment variables
os.environ['PATH'] = r'C:\Program Files\PostgreSQL\17\bin;' + os.environ['PATH']

from flask import Blueprint
from flask_restx import Api
from resources.register import Register
from resources.signin import Signin
from resources.task import Tasks


api_bp = Blueprint('api', __name__)
api = Api(api_bp)

# Route
api.add_resource(Register, '/register')

api.add_resource(Signin, '/signin')

api.add_resource(Tasks, '/tasks')