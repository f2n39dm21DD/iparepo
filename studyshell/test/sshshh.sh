#!/bin/bash
##注入
inject()
{ 
mv /Users/long/Desktop/inject/*.ipa /Users/long/Documents/ && cd /Users/long/Desktop/inject/ && ls *.deb |xargs -I name dpkg -x name ./ && ls /Users/long/Desktop/inject/Library/MobileSubstrate/DynamicLibraries/*.dylib |xargs -n 2 -I name install_name_tool -change /Library/Frameworks/CydiaSubstrate.framework/CydiaSubstrate @loader_path/libsubstrate.dylib name && ls /Users/long/Desktop/inject/Library/MobileSubstrate/DynamicLibraries/*.dylib |xargs -I name sh -c 'mv /Users/long/Documents/*.ipa /Users/long/Documents/1.ipa; injectapp /Users/long/Documents/1.ipa name;rm /Users/long/Documents/1.ipa' && rm -rf /Users/long/Desktop/inject/Library /Users/long/Desktop/inject/*.deb
}
#上传onedrive
upload()
{
    cp /Users/long/Desktop/inject/*.ipa  /Users/long/OneDrive\ -\ for\ personal/app/
    cp /Users/long/Desktop/inject/*.png  /Users/long/OneDrive\ -\ for\ personal/icon/
}
##提取info
getinfo()
{
cd /Users/long/Desktop/inject/
ls -1 | grep ".ipa$" > 1.txt
for line in $(cat 1.txt)
do
unzip $line -d ./	
cd /Users/long/Desktop/inject/
cat Payload/*.app/info.plist |grep -A 1 -i "CFBundleName" |grep -v CFBundleName | xargs -I {} sed -i "" "s#CFBundleName#{}#g" $line.txt   
cat Payload/*.app/info.plist |grep -A 1 -i "CFBundleIdentifier" |grep -v CFBundleIdentifier |xargs -I {} sed -i "" "s#CFBundleIdentifier#{}#g" $line.txt 
cat Payload/*.app/info.plist |grep -A 1 -i "CFBundleShortVersionString" |grep -v CFBundleShortVersionString |xargs -I {} sed -i "" "s#CFBundleShortVersionString#{}#g" $line.txt 
sed -i "" 's#<string>##g' $line.txt;sed -i "" 's#</string>##g' $line.txt
rm -rf Payload 
done
rm 1.txt
}

##提取图标
icon()
{
cd /Users/long/Desktop/inject/ && unzip $line -d ./   && mv /Users/long/Desktop/inject/Payload/*.app/AppIcon60x60@2x.png /Users/long/Desktop/index/$line.png 
}


read -n 1 -p $'需要执行的步骤\n1:inject\n2:upload_onedrive\n3:getinfo\n4:geticon\n' choose
if [ $choose = "1" ]
then
    inject
fi
if [ $choose = "2" ]
then
    upload
fi
if [ $choose = "3" ]
then
    getinfo
fi
if [ $choose = "4" ]
then
    icon
fi