#http://cydia.akemi.ai/
unzip 归档 -d .
dpkg -i 1.deb
dpkg -i 2.deb
touch 2.sh
echo"
touch 1.txt
ls -1 | grep ".ipa$" > 1.txt
for line in $(cat 1.txt)
do
applist $line
done 
" >> 2.sh
rm 1.sh
killall SpringBoard


