# run gf-patterns on $path and store at a proper location

#mkdir -p opPath
list=$(gf -list)
# echo $list

basePath=$1
ipfilename=$2

if [ -z basePath ] || [ -z ipfilename ]
then
	echo "path to file has some errors"
	exit 1
fi


for type in $list
do
        echo $type
	gf $type $basePath$ipfilename | uniq > $basePath$type$".txt"
done


# store these at a proper location and merge with the original subdomains (anew/uniq)
echo "[] Grathering subdomains"
cat $path | cut -d'/' -f3 | cut -d':' -f1 | sed 's/^\(\|s\):\/\///g' | uniq > /home/neel/waybackOP/subDomains.txt

echo
echo "[] Grathering paths for directory brute-force"

cat $path | rev | cut -d '/' -f 1 | rev | sed 's/^\(\|s\):\/\///g' | sed '/=\|.js\|.gif\|.css\|.jpeg\|.png\|:\|%/d' | uniq > /home/neel/waybackOP/wordlist.txt
