#!/bin/bash

# Token provisto
TOKEN="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZG1pbiIsImV4cCI6MTc0OTI0Mzg3MH0.-IQeGN7hAIJ3adm60I-KYrbQcRwakBghdaPJVlfU1zs"
API_URL="https://localhost:5000"

echo "=============================================="
echo "1. Login OAuth2 (debe devolver un token JWT)"
echo "----------------------------------------------"
curl -sk -X POST $API_URL/login-oauth -u admin:secret
echo -e "\n"

echo "=============================================="
echo "2. Acceso exitoso a /api/segura-total (todo correcto)"
echo "----------------------------------------------"
curl -sk $API_URL/api/segura-total \
  -H "Authorization: Bearer $TOKEN" \
  -H "X-API-Key: my_secure_key" \
  -H "X-Forwarded-For: 127.0.0.1" \
  -u admin:secret
echo -e "\n"

echo "=============================================="
echo "3. Acceso fallido por IP NO autorizada"
echo "----------------------------------------------"
curl -sk $API_URL/api/segura-total \
  -H "Authorization: Bearer $TOKEN" \
  -H "X-API-Key: my_secure_key" \
  -H "X-Forwarded-For: 192.168.1.99" \
  -u admin:secret
echo -e "\n"

echo "=============================================="
echo "4. Acceso fallido por API Key incorrecta"
echo "----------------------------------------------"
curl -sk $API_URL/api/segura-total \
  -H "Authorization: Bearer $TOKEN" \
  -H "X-API-Key: clave_incorrecta" \
  -H "X-Forwarded-For: 127.0.0.1" \
  -u admin:secret
echo -e "\n"

echo "=============================================="
echo "5. Acceso fallido por credenciales básicas incorrectas"
echo "----------------------------------------------"
curl -sk $API_URL/api/segura-total \
  -H "Authorization: Bearer $TOKEN" \
  -H "X-API-Key: my_secure_key" \
  -H "X-Forwarded-For: 127.0.0.1" \
  -u admin:wrongpass
echo -e "\n"

echo "=============================================="
echo "6. Acceso fallido por token inválido"
echo "----------------------------------------------"
curl -sk $API_URL/api/segura-total \
  -H "Authorization: Bearer token_invalido" \
  -H "X-API-Key: my_secure_key" \
  -H "X-Forwarded-For: 127.0.0.1" \
  -u admin:secret
echo -e "\n"

echo "=============================================="
echo "7. Acceso a /api/segura con token válido"
echo "----------------------------------------------"
curl -sk $API_URL/api/segura \
  -H "Authorization: Bearer $TOKEN"
echo -e "\n"

echo "=============================================="
echo "8. Acceso a /api/segura SIN token (debe fallar)"
echo "----------------------------------------------"
curl -sk $API_URL/api/segura
echo -e "\n"

echo "=============================================="
echo "9. Mostrar rutas disponibles"
echo "----------------------------------------------"
curl -sk $API_URL/
echo -e "\n"

echo "=============================================="
echo "PRUEBAS COMPLETADAS"
echo "=============================================="
