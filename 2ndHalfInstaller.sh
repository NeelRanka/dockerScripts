#!/usr/bin/bash

git clone https://github.com/NeelRanka/AF1_1.git
echo "Done cloning AF1_1"

echo $PWD

#Entering Tools
cd ./AF1_1/Tools/

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
