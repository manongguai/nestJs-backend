#!/bin/bash  
  
# 检查pm2是否已安装  
if ! command -v pm2 &> /dev/null  
then  
    echo "pm2 is not installed, installing it now..."  
    # 使用npm全局安装pm2  
    # 注意：这里假设npm已经安装在你的系统上  
    npm install -g pm2  
      
    # 安装完成后，再次检查pm2是否成功安装  
    if ! command -v pm2 &> /dev/null  
    then  
        echo "Failed to install pm2."  
        exit 1  
    else  
        echo "pm2 installed successfully."  
    fi  
else  
    echo "pm2 is already installed."  
fi  
  
# 使用pm2启动npm脚本  
# 注意：这里使用--name来给你的应用命名，你可以根据需要更改"my-app"  
# 假设你的npm脚本在package.json中定义为"start"  

if pm2 pid my-app  
then  
   pm2 restart my-app
else  
    pm2 start npm --name "my-app" -- run server:start
fi 
pm2 save

pm2 startup

  
# 脚本结束  
echo "Application started with pm2 and named 'my-app'."