#!/bin/bash
# 将执行脚本移动到可执行目录并授权
mv -fv run_samba /usr/bin/
chmod -v u+x /usr/bin/run_samba

# 汉化安装中文字体
apk add --no-cache font-noto-cjk font-wqy-zenhei

# 写入汉化配置环境
cat << SMALLFLOWERCAT1995 | tee -a /etc/environment
LANG=zh_CN.UTF-8
LC_CTYPE="zh_CN.UTF-8"
LC_NUMERIC="zh_CN.UTF-8"
LC_TIME="zh_CN.UTF-8"
LC_COLLATE="zh_CN.UTF-8"
LC_MONETARY="zh_CN.UTF-8"
LC_MESSAGES="zh_CN.UTF-8"
LC_PAPER="zh_CN.UTF-8"
LC_NAME="zh_CN.UTF-8"
LC_ADDRESS="zh_CN.UTF-8"
LC_TELEPHONE="zh_CN.UTF-8"
LC_MEASUREMENT="zh_CN.UTF-8"
LC_IDENTIFICATION="zh_CN.UTF-8"
LC_ALL=
SMALLFLOWERCAT1995

# 安装 samba
apk add --no-cache samba sudo

# 复制配置文件，默认密码 123456
chmod -v 0777 /sharedir
cp -rfv samba /etc/samba.bak ; rm -rfv samba
