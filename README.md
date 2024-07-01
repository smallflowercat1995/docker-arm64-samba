# docker-arm64-samba
## dockerhub
<a href="https://hub.docker.com/r/smallflowercat1995/alpine-samba" title="alpine-samba">https://hub.docker.com/r/smallflowercat1995/alpine-samba</a>  
![Watchers](https://img.shields.io/github/watchers/smallflowercat1995/docker-arm64-samba) ![Stars](https://img.shields.io/github/stars/smallflowercat1995/docker-arm64-samba) ![Forks](https://img.shields.io/github/forks/smallflowercat1995/docker-arm64-samba) ![Vistors](https://visitor-badge.laobi.icu/badge?page_id=smallflowercat1995.docker-arm64-samba) ![LICENSE](https://img.shields.io/badge/license-CC%20BY--SA%204.0-green.svg)
<a href="https://star-history.com/#smallflowercat1995/docker-arm64-samba&Date">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://api.star-history.com/svg?repos=smallflowercat1995/docker-arm64-samba&type=Date&theme=dark" />
    <source media="(prefers-color-scheme: light)" srcset="https://api.star-history.com/svg?repos=smallflowercat1995/docker-arm64-samba&type=Date" />
    <img alt="Star History Chart" src="https://api.star-history.com/svg?repos=smallflowercat1995/docker-arm64-samba&type=Date" />
  </picture>
</a>

## 描述
1.为了实现 actions workflow 自动化构建 arm64v8 镜像 ，需要添加 `GITHUB_TOKEN` 环境变量，这个是访问 GitHub API 的令牌，可以在 GitHub 主页，点击个人头像，Settings -> Developer settings -> Personal access tokens ，设置名字为 GITHUB_TOKEN 接着要勾选权限，勾选repo、admin:repo_hook和workflow即可，最后点击Generate token，如图所示  
![1](https://github.com/smallflowercat1995/docker-arm64-samba/assets/144557489/9bfcd6f3-70aa-4493-8c2e-c8ac35bbed9f)  
2.赋予 actions[bot] 读/写仓库权限 -> Settings -> Actions -> General -> Workflow Permissions -> Read and write permissions -> save，如图所示  
![2](https://github.com/smallflowercat1995/docker-arm64-samba/assets/144557489/ea6e4c8d-3161-4096-aef6-c3840858004c)  
3.添加 hub.docker.com 仓库账号 DOCKER_USERNAME 在 GitHub 仓库页 -> Settings -> Secrets -> actions -> New repository secret   
4.添加 hub.docker.com 仓库密码 DOCKER_PASSWORD 在 GitHub 仓库页 -> Settings -> Secrets -> actions -> New repository secret  
5.以上流程如图所示  
![3](https://github.com/smallflowercat1995/docker-arm64-samba/assets/144557489/39635fb7-35d0-428b-89d3-af9444e23fb9)  
6.转到 Actions  
   
    -> Clean Git Large Files 并且启动 workflow，实现自动化清理 .git 目录大文件记录  
    -> Docker Image CI 并且启动 workflow，实现自动化构建镜像并推送云端  
    -> Remove Old Workflow Runs 并且启动 workflow，实现自动化清理 workflow 并保留最后三个  
7.这是包含了 samba 的 docker 构建材料  
8.以下是思路：    
    这是一个 arm64v8 的 samba 构建材料  
    闲暇之余可以通过 arm64v8 设备上传下载文件  
    samba 是个不错的工具  
    配置文件 docker-compose.yml 这个可以自己按照需求修改  
    整个项目不难，看看配置文件，看看脚本，再看看目录结构，肯定就理解了  

    .                                            # 根目录  
    ├── docker-compose.yml                       # 这个是 docker-compose.yml 配置文件   
    ├── Dockerfile                               # 这个是 docker 构建文件  
    └── package                                  # 这个是脚本、配置文件所在目录  
        ├── install.sh                           # 这个是构建镜像的时候在容器内执行流程的脚本   
        ├── run_samba                            # 这个是启动 samba 的脚本  
        └── samba.bak                            # 这个是 samba 默认配置目录，也可以按照需求配置  
            ├── smb.conf                         # 这个是 samba 默认配置文件 默认用户名 root 
            └── smbpasswd                        # 这个是 samba 默认密码文件 默认密码 123456   

## 依赖
    arm64 设备
    docker 程序
    docker-compose python程序
    我目前能想到的必要程序就这些吧

## 构建命令
    # clone 项目
    git clone https://github.com/smallflowercat1995/docker-arm64-samba.git
    # 进入目录
    cd docker-arm64-samba
    # 无缓存构建
    docker-compose build --no-cache

## 构建完成后 后台启动
    # 自定义修改 docker-compose.yml 
    # 初始化用户名环境变量 USERS 默认 root
    # 初始化密码环境变量 PASSWORD 默认 123456
    docker-compose up -d
    
## 想要修改密码怎么办？
    # 进入目录
    cd docker-arm64-samba
    # 进入容器
    docker-compose exec alpine-samba-app bash
    # 修改密码 需输入两次 密码不会显示属于正常现象 密码配置文件会保存到 /etc/samba/smbpasswd
    smbpasswd -a $USERS
    
## 感谢
    恩山大佬 liaohcai：https://www.right.com.cn/forum/thread-8233215-1-1.html

## 参考
    分享openwrt的samba4配置文件无视luci界面：https://www.right.com.cn/forum/thread-8233215-1-1.html  
