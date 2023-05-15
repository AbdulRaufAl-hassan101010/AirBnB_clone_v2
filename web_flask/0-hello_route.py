# Import Flask module
from flask import Flask

# Create an instance of the Flask class
app = Flask(__name__)

# Define a route and its corresponding view function
@app.route('/airbnb-onepage/', strict_slashes=False)
def hello():
    return 'Hello HBNB!'

# Run the Flask application
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
