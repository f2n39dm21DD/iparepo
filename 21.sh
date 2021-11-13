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
dat=($dae)
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
            "downloadURL": '1',
            "iconURL": 'https://raw.githubusercontent.com/f2n39dm21DD/iparepo/main/icon/$ppng':
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
ls -1 | grep ".ipa$" > 1.txt
for line in $(cat 1.txt)
do
unzip -q $line -d ./
mkdir -p icon
#get icon
mv /var/mobile/iparepo/Payload/*.app/AppIcon60x60@2x.png /var/mobile/iparepo/icon/$line.png
done
ppng=$line.png
rm 1.txt
tiqu
#add info
xiugai
rm -rf Payload
