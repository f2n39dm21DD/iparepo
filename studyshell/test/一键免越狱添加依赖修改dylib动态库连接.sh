#! /bin/bash
echo "准备执行命令"
cd /Users/nk8686/Desktop/
if [ -d /Users/nk8686/Desktop/ipa临时处理目录 ]; then
echo "检测要修改的ipa包"
   if [ -f /Users/nk8686/Desktop/ipa临时处理目录/*.ipa ]; then
echo "检测到要修改的ipa包  ✔✔✔"
echo "检测要修改的dylib动态库文件"
      if [ -f /Users/nk8686/Desktop/ipa临时处理目录/*.dylib ]; then
echo "检测到要修改的dylib动态库文件  ✔✔✔"
echo "开始执行命令"
echo "正在解压ipa安装包"
  mv -f /Users/nk8686/Desktop/ipa临时处理目录/*.ipa /Users/nk8686/Desktop/ipa临时处理目录/1.zip
  tar zxvf /Users/nk8686/Desktop/ipa临时处理目录/1.zip -C /Users/nk8686/Desktop/ipa临时处理目录
  rm -rf /Users/nk8686/Desktop/ipa临时处理目录/1.zip
echo "解压ipa安装包成功  ✔✔✔"
echo "添加免越狱依赖到目标文件"
  cp -f /Users/burp/libsubstrate.dylib /Users/nk8686/Desktop/ipa临时处理目录/Payload/*.app
echo "添加免越狱依赖成功  ✔✔✔"
echo "开始打包"
cd /Users/nk8686/Desktop/ipa临时处理目录
t=$(date +%M%S)
  zip -r ./$t.zip ./Payload
  mv -f /Users/nk8686/Desktop/ipa临时处理目录/*.zip /Users/nk8686/Desktop/ipa临时处理目录/$t.ipa
  rm -rf /Users/nk8686/Desktop/ipa临时处理目录/Payload
  echo "打包完成  ✔✔✔"
  echo "开始修改要注入的插件"
  mv -f /Users/nk8686/Desktop/ipa临时处理目录/*.dylib /Users/nk8686/Desktop/ipa临时处理目录/qq906331000.dylib
  install_name_tool -change /Library/Frameworks/CydiaSubstrate.framework/CydiaSubstrate @loader_path/libsubstrate.dylib /Users/nk8686/Desktop/ipa临时处理目录/qq906331000.dylib
  echo "dylib越狱转免越狱成功  ✔✔✔"
  echo "请签名时添加注入"
  echo "qq906331000.dylib 文件"
  echo "程序5秒后退出"
  sleep 5
  exit
else
  echo "没有找到要修改的 dylib动态库文件 ✘✘✘"
  echo "请放置要修改的→→→ dylib动态库文件 到"
  echo "ipa临时处理目录"
  echo "程序5秒后退出"
  sleep 5
  exit
  fi
else
  echo "没有找到要修改的 ipa包 ✘✘✘"
  echo "请放置要修改的→→→ipa包 到"
  echo "ipa临时处理目录"
  echo "程序5秒后退出"
  sleep 5
  exit
  fi
else
  echo "没有找到ipa临时处理目录 ✘✘✘"
  echo "开始创建→→→ipa临时处理目录"
  mkdir ipa临时处理目录
  echo "ipa临时处理目录 创建成功✔✔✔"
  echo "程序5秒后退出"
  sleep 5
  exit
  fi
