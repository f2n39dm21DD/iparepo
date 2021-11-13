cd /var/mobile/Documents/a/app_logo
git add .
a=`date` && git commit -m "$a"
git config --global  user.email "bismih@163.com"
git config --global  user.name "bismih"
git push origin master