#!/usr/bin/bash

apt update
apt install -y git
apt install -y python3-pip
apt install -y nginx

# configure the nginx server / copy the server1 config
# copy the flask servers


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


#webscreenshot
#phantomjs
# echo "[+]installing webscreenshot"
# apt install -y phantomjs
# pip3 install webscreenshot


#gf / gf-patterns
echo "[+]installing gf/gfpatterns"
go install github.com/tomnomnom/gf@latest
rm -rf ./Gf-Patterns
rm -rf ~/.gf
git clone https://github.com/1ndianl33t/Gf-Patterns
mkdir ~/.gf
mv ./Gf-Patterns/*.json ~/.gf


#gowitness => webscreenshot for chromeheadless and in golang
#needs google-chrome to be installed
# google-chrome installation steps
#go install github.com/sensepost/gowitness@latest

#usage 
# gowitness file -f <path> -P <outputDir>



#gau 
go install github.com/lc/gau/v2/cmd/gau@latest


#start nginx server
# fetch nginx config files from github and place it in /etc/nginx/conf.d/
# service nginx start 



#start the flask server
# move the app to a particular workdir
# run the python3 - http.server in $workdir/Websites/
# now run the application
