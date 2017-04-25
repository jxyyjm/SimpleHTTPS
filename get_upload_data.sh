#!/bin/sh
## 判断 是否有在执行
run_ID=$(ps -aux | grep SimpleHTTPServerWithUpload | grep -v grep | awk -F ' ' '{print $2}')
echo $run_ID

if [ $run_ID -gt 1 ]
then
	echo 'greater than 1 SimpleHTTPServerWithUpload.py is running'
else
	nohup python SimpleHTTPServerWithUpload.py &
	echo 'python SimpleHTTPServerWithUpload.py starts here again'
fi

## 判断上传的文件 ##
dest_file='./ask.data'
if [ -f $dest_file ]
then
	mv $dest_file ../conf/ask.data
	rm -rf ./ask.data*
else
	echo 'do nothing'
fi

