
#提取
tiqu()
{
#提取bundle
cd /var/mobile/Documents/a/
bundle=`plutil -show /var/mobile/Documents/a/Payload/*.app/Info.plist 2>&1 | grep CFBundleIdentifier`
#提取名字
name=`plutil -show /var/mobile/Documents/a/Payload/*.app/Info.plist 2>&1 | grep CFBundleDisplayName`
#提取版本号
version=`plutil -show /var/mobile/Documents/a/Payload/*.app/Info.plist 2>&1 | grep CFBundleShortVersionString`
d=`date`
#ARR=($STR)
########## echo "${ARR[0]}:${ARR[1]}:${ARR[2]}
dae=`date`
size=`du /var/mobile/Documents/a/*.ipa` 
nam=($name)
bun=($bundle)
siz=($size)
dat=($dae)
ver=($version)
} 



#替换修改
xiugai()
{
cd /var/mobile/Documents/a/
sed -i "$d" /var/mobile/Documents/a/repo.json
sed -i "" "s/ppp/$photo/g" /var/mobile/Documents/a/repo_table
sed -i "" "s/nnn/${nam[2]%?}/g" /var/mobile/Documents/a/repo_table
sed -i "" "s/bbb/${bun[2]}/g" /var/mobile/Documents/a/repo_table
sed -i "" "s/ddd/${dat[2]}/g" /var/mobile/Documents/a/repo_table
sed -i "" "s/aaa/$appweb/g" /var/mobile/Documents/a/repo_table
sed -i "" "s/ppp/$photo/g" /var/mobile/Documents/a/repo_table
sed -i "" "s/mmm/$miaoshu/g" /var/mobile/Documents/a/repo_table
sed -i "" "s/sss/${siz[0]}/g" /var/mobile/Documents/a/repo_table
cat repo_table >> repo.json
rm repo_table
echo "]}" >> repo.json
}
#解压包
unzip -q *.ipa -d ./
cp /var/mobile/Documents/repo_table /var/mobile/Documents/a/
#提取
tiqu
#修改
xiugai
rm -rf Payload




