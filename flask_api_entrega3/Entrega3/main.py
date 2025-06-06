from flask import Flask, request, jsonify
from jose import jwt, JWTError
from datetime import datetime, timedelta
from functools import wraps

app = Flask(__name__)
SECRET_KEY = "clave_secreta_oauth"

# Ruta raíz que muestra endpoints disponibles
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

# Endpoint de login
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

# Endpoint protegido básico
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

if __name__ == "__main__":
    app.run(ssl_context="adhoc", debug=True)
