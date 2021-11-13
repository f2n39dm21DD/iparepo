app_repo()
{
cd /Users/bismihdyr/Desktop/
rm -rf Payload 1.txt  tmp
ls -1 | grep ".ipa$" > 1.txt
sed -i "" '$d' repo
touch tmp
for line in $(cat 1.txt)
do
unzip $line -d ./
##标识
a=`defaults read ./info.plist Bundle\ identifier` && echo $a

a=`defaults read /Users/bismihdyr/Desktop/Payload/*.app/info.plist Bundle\ identifier`
if [ "$a" = "" ]; then
a=`defaults read /Users/bismihdyr/Desktop/Payload/*.app/info.plist CFBundleIdentifier` |echo $a
fi
##名字
b=`defaults read /Users/bismihdyr/Desktop/Payload/*.app/Info.plist Bundle` | echo $b

##大小
size=`du $line`; arr=($size) ;echo "$arr" |  echo $arr 
echo "{
"name": ""$b"",
"bundleIdentifier": ""$a"",
"version": "1.1",
"versionDate": "2020-10-17",
"downloadURL": "downloadurl",
"iconURL": "iconurl",
"localizedDescription": "无",
"size": ""$arr""
}," >> tmp
rm -rf Payload
done
}
#cat tmp >> repo && echo "]}" >> repo
rm -rf Payload 1.txt  tmp


















echo "功能"
echo "1----添加软件至软件源"
read -p "" choose
case $choose in
1)
app_repo
;;
*)
echo 2
;;
esac