from flask import Flask
from flask_migrate import Migrate

def create_app(config_filename):
    app = Flask(__name__, instance_relative_config=False)
    app.config.from_object(config_filename)
    
    from app import api_bp
    app.register_blueprint(api_bp, url_prefix='/api')

    from models import db
    db.init_app(app)
    Migrate(app, db)

    return app


if __name__ == "__main__":
    app = create_app("config")
    app.run(debug=True)