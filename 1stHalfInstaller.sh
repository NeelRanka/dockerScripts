#!/usr/bin/bash

echo "updating repos"
apt update

#echo "installing apt-utils"
#apt install -y apt-utils
echo "installing git"
apt install -y git
echo "installing pip3"
apt install -y python3-pip
echo "installing nginx"
apt install -y nginx

#fetch the nginx server files and store it in /etc/nginx/conf.d
echo "making nginx config"
curl https://raw.githubusercontent.com/NeelRanka/dockerScripts/main/server2.conf > /etc/nginx/conf.d/server.conf


# copy the flask servers
pip3 install flask
pip3 install uro

#assetfinder
echo "[+]installing assetfinder"
go install github.com/tomnomnom/assetfinder@latest

#subfinder
echo "[+]installing subfinder"
go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest


#httprobe
echo "[+]installing httprobe"
go install github.com/tomnomnom/httprobe@latest


#httpx




#subjs
echo "[+]installing subjs"
GO111MODULE=on go install github.com/lc/subjs@latest

#subzy
echo "[+]installing subzy"
go install github.com/lukasikic/subzy@latest

#naabu
#libpcap
echo "[+]installing naabu and dependencies"
apt install -y libpcap-dev
go install github.com/projectdiscovery/naabu/v2/cmd/naabu@latest


#waybackurl
echo "[+]installing waybackurl"
go install github.com/tomnomnom/waybackurls@latest

echo "[+]installing anew"
go install -v github.com/tomnomnom/anew@latest


#gf / gf-patterns
echo "[+]installing gf/gfpatterns"
go install github.com/tomnomnom/gf@latest
# rm -rf ./Gf-Patterns
# rm -rf ~/.gf
# git clone https://github.com/1ndianl33t/Gf-Patterns
# mkdir ~/.gf
# mv ./Gf-Patterns/*.json ~/.gf

# my extension of gf-patterns
rm -rf ./myPatterns
rm -rf ~/.gf
git clone https://github.com/NeelRanka/myPatterns.git
mkdir ~/.gf
mv ./myPatterns/*.json ~/.gf

#gau 
echo "[+] installing gau"
go install github.com/lc/gau/v2/cmd/gau@latest
