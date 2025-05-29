API Segura - Entrega nº2
Este repositorio contiene la implementación de APIs seguras para la Entrega 2 del Trabajo Práctico Final de Desarrollo de Software Seguro, Tecnicatura Universitaria en Ciberseguridad. Las APIs están desarrolladas en Flask y FastAPI, incluyendo autenticación básica, por API Key, por IP y JWT (solo en FastAPI). Este documento detalla cómo actualizar el repositorio en GitHub y ejecutar las APIs en Debian.

Requisitos
Python 3.8+
Git (sudo apt install git)
Dependencias:
Flask: pip install flask
FastAPI: pip install fastapi uvicorn python-jwt
Cuenta de GitHub con acceso al repositorio https://github.com/flavioapalacios/api-segura-entregal

Estructura del Proyecto

api_flask.py: API en Flask con autenticación básica, API Key e IP.
api_fastapi.py: API en FastAPI con autenticación básica, API Key, IP y JWT.
openapi_flask.yaml: Documentación OpenAPI para Flask.
README.md

Instrucciones para Actualizar en GitHub y Ejecutar en Debian
1. Configurar el Entorno en Debian

Actualiza paquetes e instala dependencias:sudo apt update
sudo apt install python3 python3-pip git
pip install flask fastapi uvicorn python-jwt


Configura Git (si no está configurado):git config --global user.name "Flavio Palacios"
git config --global user.email "tu.email@example.com"



2. Clonar o Navegar al Repositorio

Clona el repositorio si no lo tienes:cd /home/fap
git clone https://github.com/flavioapalacios/api-segura-entregal
cd api-segura-entregal


Si ya lo tienes (por ejemplo, en /home/fap/fastapi-api/api-segura-entregal):cd /home/fap/fastapi-api/api-segura-entregal



3. Actualizar Archivos del Proyecto

Actualiza o crea los archivos con el código de Entrega 2:
api_flask.py: Copia el código de la sección 3.3 del informe.nano api_flask.py


api_fastapi.py: Copia el código de la sección 3.4 del informe.nano api_fastapi.py


openapi_flask.yaml: Copia el código de la sección 3.6 del informe.nano openapi_flask.yaml


Guarda cada archivo (Ctrl+O, Enter, Ctrl+X en nano).



4. Confirmar Cambios en Git

Verifica los cambios:git status
Agrega los archivos:git add api_flask.py api_fastapi.py openapi_flask.yaml README.md
Crea un commit:git commit -m "Actualización para Entrega 2: autenticación por API Key, IP y JWT"



5. Subir Cambios a GitHub

Empuja los cambios:git push origin main
Si usas una rama distinta, reemplaza main por el nombre (por ejemplo, git push origin entrega2).
Verifica en https://github.com/flavioapalacios/api-segura-entregal que los archivos se actualizaron.


6. Ejecutar las APIs

Flask:python3 api_flask.py

Probar: curl -u admin:secret -H "X-API-Key: my_secure_api_key_123" http://localhost:5000/api/protegida
Esperado: {"mensaje": "Acceso autorizado!"}


FastAPI:uvicorn api_fastapi:app --host 0.0.0.0 --port 8000

Acceder a http://localhost:8000/docs para Swagger UI.
Probar: curl -u admin:secret -H "X-API-Key: my_secure_api_key_123" http://localhost:8000/api/protegida
Esperado: {"mensaje": "Acceso autorizado para admin desde IP 127.0.0.1!"}


JWT (FastAPI):
Obtener token: curl -X POST -u admin:secret http://localhost:8000/api/login
Probar ruta: curl -H "token: <token>" http://localhost:8000/api/jwt_protegida
Esperado: {"mensaje": "Acceso autorizado para admin con JWT!"}



Notas

Restricciones de IP: Las APIs solo aceptan conexiones desde 127.0.0.1. Modifica ALLOWED_IPS para otras IPs.
Clave API: Usa my_secure_api_key_123.
Credenciales: Usa admin/secret para autenticación básica.
Documentación: FastAPI genera OpenAPI en /docs; Flask usa openapi_flask.yaml.
Problemas con GitHub: Si encuentras errores de permisos, verifica tu autenticación (por ejemplo, usa un token de acceso personal).

