from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return """
    <h1>Welcome to Sahil DevOps App</h1>
    <h2>Version 2.0</h2>
    <p>Rolling Update Successful</p>
    """

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)