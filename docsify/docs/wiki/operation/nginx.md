###### 什么是 Nginx？   
“Nginx 是一个 轻量级 / 高性能的反向代理 Web 服务器，用于 HTTP、HTTPS、SMTP、POP3 和 IMAP 协议。他实现非常高效的反向代理、负载平衡，他可以处理 2-3 万并发连接数，官方监测能支持 5 万并发，现在中国使用 nginx 网站用户有很多，例如：新浪、网易、 腾讯等。

###### Nginx 有哪些优点？   
跨平台、配置简单。    
非阻塞、高并发连接：处理 2-3 万并发连接数，官方监测能支持 5 万并发。   
内存消耗   
小：开启 10 个 Nginx 才占 150M 内存。   
成本低廉，且开源。   
稳定性高，宕机的概率非常小。   
内置的健康检查功能：如果有一个服务器宕机，会做一个健康检查，再发送的请求就不会发送到宕机的服务器了。重新将请求提交到其他的节点上

###### Nginx 应用场景？   
http 服务器。Nginx 是一个 http 服务可以独立提供 http 服务。可以做网页静态服务器。   
虚拟主机。可以实现在一台服务器虚拟出多个网站，例如个人网站使用的虚拟机。   
反向代理，负载均衡。当网站的访问量达到一定程度后，单台服务器不能满足用户的请求时，需要用多台服务器集群可以使用 nginx 做反向代理。并且多台服务器可以平均分担负载，不会应为某台服务器负载高宕机而某台服务器闲置的情况。
nginz 中也可以配置安全管理、比如可以使用 Nginx 搭建 API 接口网关, 对每个接口服务进行拦截。  

 
###### Nginx 怎么处理请求的？
server { # 第一个Server区块开始，表示一个独立的虚拟主机站点
   listen       80；# 提供服务的端口，默认80
   server_name localhost; # 提供服务的域名主机名
   location / { # 第一个location区块开始
     root   html; # 站点的根目录，相当于Nginx的安装目录
     index  index.html index.html; # 默认的首页文件，多个用空格分开
} # 第一个location区块结果      
首先，Nginx 在启动时，会解析配置文件，得到需要监听的端口与 IP 地址，然后在 Nginx 的 Master 进程里面先初始化好这个监控的 Socket(创建 S ocket，设置 addr、reuse 等选项，绑定到指定的 ip 地址端口，再 listen 监听)。
然后，再 fork(一个现有进程可以调用 fork 函数创建一个新进程。由 fork 创建的新进程被称为子进程) 出多个子进程出来。
之后，子进程会竞争 accept 新的连接。此时，客户端就可以向 nginx 发起连接了。当客户端与 nginx 进行三次握手，与 nginx 建立好一个连接后。此时，某一个子进程会 accept 成功，得到这个建立好的连接的 Socket ，然后创建 nginx 对连接的封装，即 ngx_connection_t 结构体。
接着，设置读写事件处理函数，并添加读写事件来与客户端进行数据的交换。    
最后，Nginx 或客户端来主动关掉连接，到此，一个连接就寿终正寝了。   。

###### 什么是正向代理？
“一个位于客户端和原始服务器 (origin server) 之间的服务器，为了从原始服务器取得内容，客户端向代理发送一个请求并指定目标(原始服务器)，然后代理向原始服务器转交请求并将获得的内容返回给客户端。
客户端才能使用正向代理。正向代理总结就一句话：代理端代理的是客户端。例如说：我们使用的 OpenVPN 等等。

###### 什么是反向代理？
反向代理（Reverse Proxy）方式，是指以代理服务器来接受 Internet 上的连接请求，然后将请求，发给内部网络上的服务器并将从服务器上得到的结果返回给 Internet 上请求连接的客户端，此时代理服务器对外就表现为一个反向代理服务器。   
“反向代理总结就一句话：代理端代理的是服务端。    
反向代理服务器的优点是什么?    
“反向代理服务器可以隐藏源服务器的存在和特征。它充当互联网云和 web 服务器之间的中间层。这对于安全方面来说是很好的，特别是当您使用 web 托管服务时。

######  Nginx 目录结构有哪些？
tree /usr/local/nginx   
/usr/local/nginx  
├── client_body_temp  
├── conf # Nginx所有配置文件的目录   
│ ├── fastcgi.conf # fastcgi相关参数的配置文件   
│ ├── fastcgi.conf.default         # fastcgi.conf的原始备份文件    
│ ├── fastcgi_params # fastcgi的参数文件    
│ ├── fastcgi_params.default          
│ ├── koi-utf   
│ ├── koi-win   
│ ├── mime.types # 媒体类型   
│ ├── mime.types.default   
│ ├── nginx.conf # Nginx主配置文件   
│ ├── nginx.conf.default   
│ ├── scgi_params # scgi相关参数文件   
│ ├── scgi_params.default     
│ ├── uwsgi_params # uwsgi相关参数文件   
│ ├── uwsgi_params.default   
│ └── win-utf   
├── fastcgi_temp # fastcgi临时数据目录   
├── html # Nginx默认站点目录    
│ ├── 50x.html # 错误页面优雅替代显示文件，例如当出现502错误时会调用此页面    
│ └── index.html # 默认的首页文件    
├── logs # Nginx日志目录   
│ ├── access.log # 访问日志文件   
│ ├── error.log # 错误日志文件   
│ └── nginx.pid # pid文件，Nginx进程启动后，会把所有进程的ID号写到此文件   
├── proxy_temp # 临时目录   
├── sbin # Nginx命令目录   
│ └── nginx # Nginx的启动命令   
├── scgi_temp # 临时目录   
└── uwsgi_temp # 临时目录  

 
###### cookie 和 session 区别？
共同：  
存放用户信息。存放的形式：key-value 格式 变量和变量内容键值对。  

区别：  
cookie:   
存放在客户端浏览器   
每个域名对应一个 cookie，不能跨跃域名访问其他 cookie  
用户可以查看或修改 cookie    
http 响应报文里面给你浏览器设置   
钥匙（用于打开浏览器上锁头）   

session:
存放在服务器（文件，数据库，redis）
存放敏感信息
锁头  


######   为什么 Nginx 不使用多线程？
“Apache: 创建多个进程或线程，而每个进程或线程都会为其分配 cpu 和内存（线程要比进程小的多，所以 worker 支持比 perfork 高的并发），并发过大会榨干服务器资源。      
Nginx: 采用单线程来异步非阻塞处理请求（管理员可以配置 Nginx 主进程的工作进程的数量）(epoll)，不会为每个请求分配 cpu 和内存资源，节省了大量资源，同时也减少了大量的 CPU 的上下文切换。所以才使得 Nginx 支持更高的并发。

###### nginx 和 apache 的区别
轻量级，同样起 web 服务，比 apache 占用更少的内存和资源。         
抗并发，nginx 处理请求是异步非阻塞的，而 apache 则是阻塞性的，在高并发下 nginx 能保持低资源，低消耗高性能。

高度模块化的设计，编写模块相对简单。    
最核心的区别在于 apache 是同步多进程模型，一个连接对应一个进程，nginx 是异步的，多个连接可以对应一个进程。

