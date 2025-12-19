
"""

Script del microservicio responsable de crear los tokens JWT.

"""

from flask import Flask, jsonify
import os
import configparser
import jwt

app = Flask(__name__)

@app.route('/login', methods=['POST','GET'])
def login():
    return jsonify({'mensaje' : 'logeado'})


if __name__ == '__main__':
    cfg_path = f"config.cfg"
    config = configparser.ConfigParser()
    config.read([cfg_path])
    # Levanto el Flask con el microservicio.
    app.run(
        host= config['autenticacion']['HOST'], 
        port= config['autenticacion']['PORT'], 
        debug = config['autenticacion']['DEBUG'] == 'yes'
        )