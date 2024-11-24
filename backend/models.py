from flask_sqlalchemy import SQLAlchemy
from flask_marshmallow import Marshmallow

# Initialize extensions
db = SQLAlchemy()
ma = Marshmallow()

# Models
class User(db.Model):
    __tablename__ = 'users'

    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String, unique=True, nullable=False)
    firstname = db.Column(db.String, nullable=False)
    lastname = db.Column(db.String, nullable=False)
    password = db.Column(db.String, nullable=False)
    emailaddress = db.Column(db.String, unique=True, nullable=False)  # Fixed typo
    api_key = db.Column(db.String, unique=True, nullable=False)

    tasks = db.relationship('Task', backref='user', lazy=True)  # Define relationship

    def __repr__(self):
        return f"<User id={self.id} username={self.username}>"
    
    def serialize(self):
        return {
            'api_key' : self.api_key,
            'id' : self.id,
            'username' : self.username,
            'firstname' : self.firstname,
            'lastname' : self.lastname,
            'password' : self.password,
            'emailaddress' : self.emailaddress,
        }


class Task(db.Model):
    __tablename__ = 'tasks'

    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('users.id'), nullable=False)
    title = db.Column(db.String, nullable=False)
    note = db.Column(db.String)
    completed = db.Column(db.Boolean, default=False, nullable=False)
    repeats = db.Column(db.String)
    deadline = db.Column(db.String)
    reminders = db.Column(db.String)

    def __repr__(self):
        return f"<Task id={self.id} title={self.title} user_id={self.user_id}>"