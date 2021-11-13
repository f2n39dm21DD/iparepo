cd /Users/nk8686/Desktop
rm -rf 图标.png
echo "检查→→→1.ipa文件  是否存在"
if [ -f /Users/nk8686/Desktop/1.ipa ]; then
  echo "已检测到→→→ipa✔✔✔"
  unzip 1.ipa -d app
  rm -rf 1.ipa
cd /Users/nk8686/Desktop/app/Payload/*.app
if [ -f /Users/nk8686/Desktop/app/Payload/*.app/AppIcon60x60@2x.png ]; then
mv -f /Users/nk8686/Desktop/app/Payload/*.app/AppIcon60x60@2x.png /Users/nk8686/Desktop/图标.png
cd /Users/nk8686/Desktop
rm -rf app
  echo "提取成功"
  echo "程序5秒后退出"
  sleep 5
  exit
else
  if [ -f /Users/nk8686/Desktop/app/Payload/*.app/AppIcon60x60@3x.png ]; then
  mv -f /Users/nk8686/Desktop/app/Payload/*.app/AppIcon60x60@3x.png /Users/nk8686/Desktop/图标.png
cd /Users/nk8686/Desktop
rm -rf app
  echo "提取成功"
  echo "程序5秒后退出"
  sleep 5
  exit
  else
    mv -f /Users/nk8686/Desktop/app/Payload/*.app/Icon.png /Users/nk8686/Desktop/图标.png
  cd /Users/nk8686/Desktop
  rm -rf app
    echo "提取成功"
    echo "程序5秒后退出"
    sleep 5
    exit
  fi
  fi
else
  echo "没有找到1.ipa"
  echo "请放置1.ipa到"
  echo "桌面"
  echo "程序5秒后退出"
  sleep 5
  exit
fi
