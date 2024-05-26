###### 1、Tomcat 的缺省端口是多少，怎么修改？
1）找到 Tomcat 目录下的conf 文件夹  
2）进入 conf 文件夹里面找到 server.xml 文件  
3）打开 server.xml 文件  
4）在 server.xml 文件里面找到下列信息 port="8080"改成你想要的端口  

###### 2、tomcat 有哪几种 Connector 运行模式(优化)？
bio：传统的Java I/O操作，同步且阻塞IO。  
nio：JDK1.4开始支持，同步阻塞或同步非阻塞IO。  


###### 3、Tomcat 有几种部署方式？
1）直接把 Web 项目放在webapps 下，Tomcat 会自动将其部署   
2）在 server.xml 文件上配置<Context>节点，设置相关的属性即可   
3）通过 Catalina 来进行配置:进入到 conf\Catalina\localhost 文件下，创建一个 xml 文件，该文件的名字就是站点的名字。
编写 XML 的方式来进行设置。

 

###### 4、tomcat 容器是如何创建 servlet 类实例？用到了什么原理？
当容器启动时，会读取在webapps 目录下所有的 web 应用中的 web.xml文 件，然后对 xml 文件进行解析，  
并读取 servlet 注册信息。然后，将每个应用中注册的 servlet 类都进行加载， 并通过反射的方式实例化。  
（有时候也是在第一次请求时实例化）在 servlet 注册时加上如果为正数，则在 一开始就实例化，  
如果不写或为负数，则第一次请求实例化   