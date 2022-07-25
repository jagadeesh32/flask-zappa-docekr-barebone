from flask import Flask, jsonify 


app = Flask(__name__) 

@app.route('/') 
def index(): 
    data = {
        "name": "hello world"
    }
    return jsonify(data)

@app.route('/test') 
def test(): 
    data = {
        "name": "hello text"
    }
    return jsonify(data)


# We only need this for local development. 
if __name__ == '__main__': 
    app.run()

