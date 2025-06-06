#!/bin/bash

# Obtener token (ajustar el campo 'access_token' según la respuesta real)
TOKEN=$(curl -s -X POST -u admin:secret https://localhost:5000/login-oauth -k | jq -r '.access_token')

echo "Token obtenido: $TOKEN"

# Acceder a ruta protegida con token
curl -k -H "Authorization: Bearer $TOKEN" https://localhost:5000/api/segura | jq .

# Intentar sin token (debe fallar)
curl -k https://localhost:5000/api/segura | jq .
