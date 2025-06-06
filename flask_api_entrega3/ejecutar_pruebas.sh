#!/bin/bash

# 1. Obtener token
TOKEN=$(curl -s -X POST -k https://localhost:5000/login-oauth -u admin:secret | jq -r '.access_token')

# 2. Ejecutar pruebas
echo "=== Prueba Login OAuth ===" > resultados_oauth_login.txt
curl -X POST -k -u admin:secret https://localhost:5000/login-oauth -v >> resultados_oauth_login.txt 2>&1

echo "\n=== Prueba Acceso Válido ===" > resultados_acceso_valido.txt
curl -k -H "Authorization: Bearer $TOKEN" \
     -H "X-API-Key: my_secure_key" \
     -H "X-Forwarded-For: 127.0.0.1" \
     -u admin:secret \
     https://localhost:5000/api/segura-total -v >> resultados_acceso_valido.txt 2>&1

echo "\n=== Prueba API Key Inválida ===" > resultados_api_key.txt
curl -k -H "Authorization: Bearer $TOKEN" \
     -H "X-API-Key: key_invalida" \
     https://localhost:5000/api/segura-total -v >> resultados_api_key.txt 2>&1

echo "\n=== Prueba IP Bloqueada ===" > resultados_ip_bloqueada.txt
curl -k -H "Authorization: Bearer $TOKEN" \
     -H "X-API-Key: my_secure_key" \
     -H "X-Forwarded-For: 192.168.1.99" \
     https://localhost:5000/api/segura-total -v >> resultados_ip_bloqueada.txt 2>&1

# 3. Pruebas de rendimiento
echo "Ejecutando pruebas de rendimiento..."
ab -n 100 -c 10 -k -H "Authorization: Bearer $TOKEN" \
   -H "X-API-Key: my_secure_key" \
   -H "X-Forwarded-For: 127.0.0.1" \
   https://localhost:5000/api/segura-total > resultados_benchmark.txt

echo "Pruebas completadas. Resultados en:"
ls -l resultados_*.txt
