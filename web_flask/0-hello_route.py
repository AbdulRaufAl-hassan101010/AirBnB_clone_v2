#!/usr/bin/python3
"""
starts a Flask web application
"""

from your_flask_app import create_app

app = create_app()

@app.route('/', strict_slashes=False)
def index():
    """returns Hello HBNB!"""
    return 'Hello HBNB!'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port='5000')
