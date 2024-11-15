from flask_restx import Resource


class User(Resource):
    def get(self):
        return {"message": "Hello, World!"}
    