from flask import Flask, request, jsonify
from jose import jwt, JWTError
from datetime import datetime, timedelta
from functools import wraps

app = Flask(__name__)
SECRET_KEY = "clave_secreta_oauth"

# Decoradores de validación
def validar_ip(f):
    @wraps(f)
    def wrapper(*args, **kwargs):
        ip = request.headers.get("X-Forwarded-For", "127.0.0.1")
        if ip != "127.0.0.1":
            return jsonify({"error": "IP no autorizada"}), 403
        return f(*args, **kwargs)
    return wrapper

def validar_api_key(f):
    @wraps(f)
    def wrapper(*args, **kwargs):
        if request.headers.get("X-API-Key") != "my_secure_key":
            return jsonify({"error": "API Key inválida"}), 401
        return f(*args, **kwargs)
    return wrapper

def validar_basic_auth(f):
    @wraps(f)
    def wrapper(*args, **kwargs):
        auth = request.authorization
        if not auth or auth.username != "admin" or auth.password != "secret":
            return jsonify({"error": "Credenciales básicas inválidas"}), 401
        return f(*args, **kwargs)
    return wrapper

# Ruta raíz para mostrar endpoints disponibles
@app.route("/")
def home():
    routes = {
        "available_routes": {
            "/login-oauth": ["POST"],
            "/api/segura": ["GET"],
            "/api/segura-total": ["GET"]
        }
    }
    return jsonify(routes)

# Endpoint de login OAuth (genera JWT)
@app.route("/login-oauth", methods=["POST"])
def login_oauth():
    auth = request.authorization
    if not auth or auth.username != "admin" or auth.password != "secret":
        return jsonify({"error": "Credenciales inválidas"}), 401

    token = jwt.encode({
        "sub": auth.username,
        "exp": datetime.utcnow() + timedelta(minutes=30)
    }, SECRET_KEY, algorithm="HS256")

    return jsonify({"access_token": token})

# Endpoint protegido solo por JWT
@app.route("/api/segura")
def api_segura():
    token = request.headers.get("Authorization", "").replace("Bearer ", "")
    if not token:
        return jsonify({"error": "Token requerido"}), 401
    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=["HS256"])
        return jsonify({"mensaje": "Acceso permitido", "usuario": payload["sub"]})
    except JWTError:
        return jsonify({"error": "Token inválido o expirado"}), 401

# Endpoint protegido por IP, API Key, Basic Auth y JWT
@app.route("/api/segura-total")
@validar_ip
@validar_api_key
@validar_basic_auth
def api_segura_total():
    token = request.headers.get("Authorization", "").replace("Bearer ", "")
    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=["HS256"])
        return jsonify({"mensaje": "Acceso exitoso", "usuario": payload["sub"]})
    except JWTError:
        return jsonify({"error": "Token inválido o expirado"}), 401

if __name__ == "__main__":
    app.run(ssl_context="adhoc", debug=True)
