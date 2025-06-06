# API Segura - Entrega 3: Construcción de una API Completa y Segura

Este repositorio contiene la implementación de la **Entrega 3** del Trabajo Práctico Final de Desarrollo de Software Seguro, perteneciente a la Tecnicatura Universitaria en Ciberseguridad. En esta entrega, se profundiza en los mecanismos de seguridad aplicables a APIs modernas, consolidando e integrando los conocimientos de etapas anteriores.

El proyecto incluye la construcción de una solución técnica unificada con múltiples métodos de autenticación en Flask y FastAPI, incorporando OAuth 2.0 en Flask para completar las autenticaciones solicitadas. Además, se refuerzan los controles con prácticas avanzadas de validación, manejo de errores y documentación OpenAPI. Todo el desarrollo se alinea con las prácticas promovidas por OWASP.

├── flask_api_entrega3/
│   ├── ejecutar_pruebas.sh
│   ├── flask_app.sh
│   ├── flaskrun.sh
│   ├── main.py
│   ├── openapi.yaml
│   ├── pruebaapi.sh
│   ├── pycache/
│   ├── resultados_acceso_valido.txt
│   ├── resultados_api_key.txt
│   ├── resultados_benchmark.txt
│   ├── resultados_ip_bloqueada.txt
│   └── resultados_oauth_login.txt


---

## 🚀 Características Principales

* **Autenticación en Capas**: Implementación de diversos mecanismos de autenticación, incluyendo:
    * HTTP Basic Authentication
    * API Key
    * JSON Web Tokens (JWT)
    * Filtrado por IP
    * **Nuevo en Entrega 3**: Integración de OAuth 2.0 en Flask (simulando el flujo "password grant").
* **Seguridad Avanzada**:
    * Validación estricta de entradas en Flask y FastAPI para prevenir ataques.
    * Uso de HTTPS para asegurar el transporte de datos (simulación con `flask run --cert adhoc`).
    * Manejo seguro de errores, evitando la exposición de trazas del servidor o mensajes sensibles.
    * Monitoreo básico para detectar comportamientos anómalos.
* **Documentación con OpenAPI**:
    * Especificación OpenAPI para describir la API REST de forma estructurada.
    * Generación automática de documentación interactiva (Swagger UI) en FastAPI.
    * Validación del archivo `openapi.yaml` en Swagger Editor.
* **Pruebas Robustas**:
    * Pruebas funcionales y de seguridad documentadas, incluyendo obtención de token JWT, acceso a rutas protegidas con y sin token, y validación de API Key e IP bloqueada.
    * Pruebas de rendimiento utilizando Apache Bench sobre un endpoint seguro, evaluando solicitudes concurrentes y tiempo de respuesta.

---

## 🛠️ Tecnologías Utilizadas

* **Python 3.8+**
* **Flask**: Framework web para Python.
* **FastAPI**: Framework web asíncrono para Python.
* **Authlib**: Para la implementación de OAuth
