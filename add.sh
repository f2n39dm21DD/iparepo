touch 1.txt
ls -1 | grep ".ipa$" > 1.txt
for line in $(cat 1.txt)
do
unzip -q $line -d ./
done
rm 1.txt