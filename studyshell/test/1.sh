
#提取
tiqu()
{
#提取bundle
cd/Users/bismihdyr/Desktop/a/
bundle=`plutil -show/Users/bismihdyr/Desktop/a/Payload/*.app/Info.plist 2>&1 | grep CFBundleIdentifier`
#提取名字
name=`plutil -show/Users/bismihdyr/Desktop/a/Payload/*.app/Info.plist 2>&1 | grep CFBundleDisplayName`
#提取版本号
version=`plutil -show/Users/bismihdyr/Desktop/a/Payload/*.app/Info.plist 2>&1 | grep CFBundleShortVersionString`
d=`date`
#ARR=($STR)
########## echo "${ARR[0]}:${ARR[1]}:${ARR[2]}
dae=`date`
size=`du/Users/bismihdyr/Desktop/a/*.ipa` 
nam=($name)
bun=($bundle)
siz=($size)
dat=($dae)
ver=($version)
uuu=${bun[2]}
} 



#替换修改
xiugai()
{
echo 1
}
#解压包
unzip -q *.ipa -d ./
#提取
cd/Users/bismihdyr/Desktop/a/
bundle=`plutil -show/Users/bismihdyr/Desktop/a/Payload/*.app/Info.plist 2>&1 | grep CFBundleIdentifier`
#提取名字
name=`plutil -show/Users/bismihdyr/Desktop/a/Payload/*.app/Info.plist 2>&1 | grep CFBundleDisplayName`
#提取版本号
version=`plutil -show/Users/bismihdyr/Desktop/a/Payload/*.app/Info.plist 2>&1 | grep CFBundleShortVersionString`
d=`date`
#ARR=($STR)
########## echo "${ARR[0]}:${ARR[1]}:${ARR[2]}
dae=`date`
size=`du/Users/bismihdyr/Desktop/a/*.ipa` 
nam=($name)
bun=($bundle)
siz=($size)
dat=($dae)
ver=($version)
uuu=${bun[2]}
#修改
cd/Users/bismihdyr/Desktop/a/
##   ##
sed -i "" "$d"/Users/bismihdyr/Desktop/a/repo.json
sed -i "" 's#ppp#$photo#g'/Users/bismihdyr/Desktop/a/repo.json
sed -i "" 's#nnn#${nam[2]%?}#g'/Users/bismihdyr/Desktop/a/repo.json
sed -i "" 's#bbb#$uuu#'/Users/bismihdyr/Desktop/a/repo.json
sed -i "" 's#ddd#${dat[2]}#g'/Users/bismihdyr/Desktop/a/repo.json
sed -i "" 's#aaa#$appweb#g'/Users/bismihdyr/Desktop/a/repo.json
sed -i "" 's#ppp#$photo#g'/Users/bismihdyr/Desktop/a/repo.json
sed -i "" 's#mmm#$miaoshu#g'/Users/bismihdyr/Desktop/a/repo.json
sed -i "" 's#sss#${siz[0]}#g'/Users/bismihdyr/Desktop/a/repo.json
cat repo.json >> repo
echo "]}" >> repo
rm -rf Payload




