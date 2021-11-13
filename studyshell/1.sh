app()
{
    touch 1.txt
ls -1 | grep ".ipa$" > 1.txt
for line in $(cat 1.txt)
do
applist $line
done 
}







#http://cydia.akemi.ai/
unzip 归档 -d .
dpkg -i 1.deb
dpkg -i 2.deb
touch then.sh
killall SpringBoard






