echo "starting nginx service"
service nginx start
echo "started NGINX service"
service nginx status

cd ./AF1_1

(python3 server.py) & (python3 -m http.server -d ./Websites/)
