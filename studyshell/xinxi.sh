cat /Users/bismihdyr/Desktop/Info.plist |grep -A 1 -i "CFBundleName" |grep -v CFBundleName | xargs -I {}  sed -i "" "s#CFBundleName#{}#g" /Users/bismihdyr/Desktop/1.txt
cat /Users/bismihdyr/Desktop/Info.plist |grep -A 1 -i "CFBundleIdentifier" |grep -v CFBundleIdentifier |xargs -I {} sed -i "" "s#CFBundleIdentifier#{}#g" /Users/bismihdyr/Desktop/1.txt 
cat /Users/bismihdyr/Desktop/Info.plist |grep -A 1 -i "CFBundleShortVersionString" |grep -v CFBundleShortVersionString |xargs -I {} sed -i "" "s#CFBundleShortVersionString#{}#g" /Users/bismihdyr/Desktop/1.txt 
##cat /Users/bismihdyr/Desktop/Info.plist |grep -A 1 -i "CFBundleName" |grep -v CFBundleName | xargs -I {} echo {}

