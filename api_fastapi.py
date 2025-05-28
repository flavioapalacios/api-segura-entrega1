from fastapi import FastAPI, HTTPException, Depends, Header
from fastapi.security import HTTPBasic, HTTPBasicCredentials
import jwt
import datetime

app = FastAPI(title="API Segura con FastAPI")
security = HTTPBasic()

SECRET_KEY = "my_secret_key_123456"
ALGORITHM = "HS256"
API_KEY = "my_secure_api_key_123"
ALLOWED_IPS = ["127.0.0.1"]

def verificar_ip(x_forwarded_for: str = Header(None, alias="X-Forwarded-For")):
    client_ip = x_forwarded_for or "127.0.0.1"
    if client_ip not in ALLOWED_IPS:
        raise HTTPException(status_code=403, detail="Acceso denegado: IP no autorizada")
    return client_ip

def verificar_api_key(x_api_key: str = Header(...)):
    if x_api_key != API_KEY:
        raise HTTPException(status_code=401, detail="Clave API inválida")
    return x_api_key

def verificar_credenciales(credenciales: HTTPBasicCredentials = Depends(security)):
    if credenciales.username != "admin" or credenciales.password != "secret":
        raise HTTPException(status_code=401, detail="Credenciales inválidas")
    return credenciales.username

@app.get("/api/protegida")
async def ruta_protegida(usuario: str = Depends(verificar_credenciales), api_key: str = Depends(verificar_api_key), ip: str = Depends(verificar_ip)):
    return {"mensaje": f"Acceso autorizado para {usuario} desde IP {ip}!"}

@app.post("/api/login")
async def login(credenciales: HTTPBasicCredentials = Depends(security)):
    username = verificar_credenciales(credenciales)
    token = jwt.encode({"sub": username, "exp": datetime.datetime.utcnow() + datetime.timedelta(minutes=30)}, SECRET_KEY, algorithm=ALGORITHM)
    return {"token": token}

@app.get("/api/jwt_protegida")
async def ruta_jwt_protegida(token: str = Depends(lambda x: x.headers.get("token"))):
    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
        if not payload.get("sub"):
            raise HTTPException(status_code=401, detail="Token inválido")
        return {"mensaje": f"Acceso autorizado para {payload['sub']} con JWT!"}
    except jwt.PyJWTError:
        raise HTTPException(status_code=401, detail="Token inválido o expirado")
