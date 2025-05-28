#!/bin/bash

# Obtener una clave del servidor
get_key() {
    curl -s "https://www.diosdelared.com/retos/directives/index.php?id=DDLR--KEY" | 
    grep -oE "new random key: [a-zA-Z0-9]{10}" | 
    cut -d' ' -f4
}

# Extraer las letras clave (1,5,8)
extract_flag() {
    local key=$1
    echo "Clave generada: $key"
    echo -n "Flag encontrada: CTF{"
    echo -n "${key:0:1}${key:4:1}${key:7:1}"
    echo "}"
}

# Proceso principal
key=$(get_key)
extract_flag "$key"
