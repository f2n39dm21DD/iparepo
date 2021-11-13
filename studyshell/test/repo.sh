cd /Users/bismihdyr/Desktop/inject/
rm tmp
ls -1 | grep ".ipa$" > 1.txt
for line in $(cat 1.txt)
do
cd /Users/bismihdyr/Desktop/inject/
unzip $line -d ./  
touch tmp.plist && echo "{
"name": "南瓜影视",
"bundleIdentifier": "com.guangyingbangongshebei.com",
"version": "1.1",
"versionDate": "2020-10-17",
"downloadURL": "https://outexp-beta.cdn.qq.com/outbeta/2020/10/17/comguangyingbangongshebeicom_2_9a5e6341-cad3-55bc-8507-7ba5333e932f.ipa",
"iconURL": "http://tiebapic.baidu.com/tieba/pic/item/203fb80e7bec54e7f5d78967ae389b504fc26a94.jpg",
"localizedDescription": "[破解应用]登录就是VIP会员最新院线影片抢先播,尝鲜体验!最新影视剧,高清极速播放体验",
"size": "17687698"
}," >> tmp
   #    a=`defaults read /Users/bismihdyr/Desktop/inject/Payload/*.app/info.plist CFBundleIdentifier` &&  sed -i  ""  "s#com.guangyingbangongshebei.com#$a#g" tmp
   a=`defaults read /Users/bismihdyr/Desktop/inject/Payload/*.app/info.plist CFBundleIdentifier`
/usr/libexec/PlistBuddy -c "Set :items:0:metadata:bundleidentifier $a" tmp.plist 
open tmp
#1、使用反引号`` (数字键1左边的键，tab键上面，英文方式输入) 如：a=`echo "hello world"`;即将命令 echo "hello world"的输出赋给变量a
#2、可以使用 $(())，如：a=$(echo "hello world")，即将命令echo "hello world"的输出赋给变量a
sed -i "" '$d' /Users/bismihdyr/Desktop/inject/repo
cat tmp >> repo && echo "]}" >> repo
done
rm -rf /Users/bismihdyr/Desktop/inject/Payload
rm 1.txt tmp

