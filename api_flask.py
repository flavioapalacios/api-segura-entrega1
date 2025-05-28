from flask import Flask, jsonify, request
from functools import wraps

app = Flask(__name__)

# Clave API válida
API_KEY = "my_secure_api_key_123"

# Lista de IPs permitidas
ALLOWED_IPS = ["127.0.0.1"]

def verificar_ip(f):
    @wraps(f)
    def decorador(*args, **kwargs):
        client_ip = request.remote_addr
        if client_ip not in ALLOWED_IPS:
            return jsonify({"mensaje": "Acceso denegado: IP no autorizada"}), 403
        return f(*args, **kwargs)
    return decorador

def verificar_api_key(f):
    @wraps(f)
    def decorador(*args, **kwargs):
        api_key = request.headers.get('X-API-Key')
        if not api_key or api_key != API_KEY:
            return jsonify({"mensaje": "Clave API inválida"}), 401
        return f(*args, **kwargs)
    return decorador

def verificar_autenticacion(f):
    @wraps(f)
    def decorador(*args, **kwargs):
        auth = request.authorization
        if not auth or auth.username != "admin" or auth.password != "secret":
            return jsonify({"mensaje": "Autenticación fallida"}), 401
        return f(*args, **kwargs)
    return decorador

@app.route('/api/protegida', methods=['GET'])
@verificar_ip
@verificar_autenticacion
@verificar_api_key
def api_protegida():
    return jsonify({"mensaje": "Acceso autorizado!"})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
