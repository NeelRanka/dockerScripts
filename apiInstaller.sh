#!/usr/bin/bash

echo "updating repos"
apt update

#echo "installing apt-utils"
#apt install -y apt-utils
echo "installing git"
apt install --no-install-recommends  --no-install-suggests -y git
echo "installing pip3"
apt install --no-install-recommends  --no-install-suggests -y python3-pip
echo "installing nginx"
apt install --no-install-recommends  --no-install-suggests -y nginx

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
apt install --no-install-recommends  --no-install-suggests -y libpcap-dev
go install github.com/projectdiscovery/naabu/v2/cmd/naabu@latest


#waybackurl
echo "[+]installing waybackurl"
go install github.com/tomnomnom/waybackurls@latest

echo "[+]installing anew"
go install -v github.com/tomnomnom/anew@latest

#webscreenshot
#phantomjs
# echo "[+]installing webscreenshot"
# apt install -y phantomjs
# pip3 install webscreenshot


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

#installing node and dependencies
echo "[+] Installing Nodejs"
curl -sL https://deb.nodesource.com/setup_current.x | bash
apt install --no-install-recommends --no-install-suggests -y nodejs
echo "[+] NodeJS Version"
node --version 
echo "[+] Upgrading npm"
npm install -g npm@9.6.5
echo "[+] Installing puppeteer@2.1.1 wappalyzer and screenshoteer"
npm install -g puppeteer@2.1.1 wappalyzer screenshoteer
echo "[+] Installing Chromium"
apt install --no-install-recommends --no-install-suggests chromium
echo "[+] NodeJS part complete"


git clone https://github.com/NeelRanka/AF1_1_API.git
echo "Done cloning AF1_1_API"

echo $PWD

#Entering Tools
cd ./AF1_1_API/Tools/

#wafw00f install  => sets to path by default
echo "https://github.com/EnableSecurity/wafw00f.git[+] installing WafW00f"
git clone https://github.com/EnableSecurity/wafw00f.git
cd wafw00f
python3 setup.py install
cd ..  #back in Tools

#secretFinder install  => needs to be called by directory
echo "[+] installing SecretFinder"
git clone https://github.com/m4ll0k/SecretFinder.git
cd ./SecretFinder/
pip3 install -r requirements.txt
cd .. #back in Tools

#installed waybackFilter
curl https://raw.githubusercontent.com/NeelRanka/dockerScripts/main/waybackFilter.sh > ./waybackFilter.sh

#exiting Tools
cd ../


#exiting AF1_1
cd ../
echo $PWD

echo "importing starter script"
curl https://raw.githubusercontent.com/NeelRanka/dockerScripts/main/start.sh > $MAINDIR/start.sh
echo "imported the start script start.sh"
