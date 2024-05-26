###### 什么是Docker？
答：Docker是一个开源的容器化平台，它允许开发者将应用及其依赖打包到一个轻量级、可移植的容器中，从而在任何Docker运行的环境中实现一致的运行。
###### Docker容器和虚拟机的区别是什么？
答：Docker容器在操作系统级别进行虚拟化，共享宿主机的内核，而虚拟机在硬件级别进行虚拟化，拥有独立的内核。容器通常更轻量级、启动更快，资源占用更少。
###### 什么是Docker镜像？
答：Docker镜像是一个轻量级、只读的模板，用于创建Docker容器。它包含运行容器所需的代码、库、环境变量和配置文件。
###### 如何创建Docker容器？
答：可以使用docker run命令来从镜像创建容器。例如，docker run -d -p 80:80 nginx会基于nginx镜像启动一个新的容器，并将容器的80端口映射到宿主机的80端口。
###### Docker Hub是什么？
答：Docker Hub是一个公共的容器镜像仓库，可以用来存放、分享和管理Docker镜像。用户可以从Docker Hub下载公共镜像或上传自己的私有镜像。
常用命令