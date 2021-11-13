#提取
tiqu()
{
#提取bundle
cd /var/mobile/iparepo/
bundle=`plutil -show /var/mobile/iparepo/Payload/*.app/Info.plist 2>&1 | grep CFBundleIdentifier`
#提取名字
name=`plutil -show /var/mobile/iparepo/Payload/*.app/Info.plist 2>&1 | grep CFBundleDisplayName`
#提取版本号
version=`plutil -show /var/mobile/iparepo/Payload/*.app/Info.plist 2>&1 | grep CFBundleShortVersionString`
dae=`date`
size=`du /var/mobile/iparepo/*.ipa`
nam=($name)
bun=($bundle)
siz=($size)
dat=`date`
ver=($version)
}
#替换修改
xiugai()
{
sed -i '$d' repo.json
echo "        {
            "name": '${nam[2]%?}',
            "bundleIdentifier": '${bun[2]}',
            "version": "${ver[2]}",
"versionDate": "$dat",
            "downloadURL": "1",
            "iconURL": "1":
            "localizedDescription": "1",
            "tintColor": "018084",
            "size": ${siz[0]}
        }," >> app.txt
sed -i "s#'##g" /var/mobile/iparepo/app.txt
sed -i "s#;##g" /var/mobile/iparepo/app.txt
cat app.txt >> repo.json
echo "]}" >> repo.json
}
#解压包
rm app.txt
unzip -q *.ipa -d ./
tiqu
xiugai
rm -rf Payload
