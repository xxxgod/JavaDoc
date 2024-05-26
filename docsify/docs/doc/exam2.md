## 项目启动数据库数据初始化到redis

1、创建一个配置类，类上添加注解@Component；
声明一个返回类型为 void 的方法；
方法添加注解 @PostConstruct；

2、实现ApplicationRunner接口
重写run方法，在run方法中设置缓存即可
据说会在项目启动成功前就会执行

3、实现CommandLineRunner接口
重写run方法，在run方法中设置缓存

## Mybatis一级缓存二级缓存

mybatis一级缓存
1、一级缓存简介
一级缓存作用域是sqlsession级别的，同一个sqlsession中执行相同的sql查询（相同的sql和参数），第一次会去查询数据库并写到缓存中，第二次从一级缓存中取。
一级缓存是基于 PerpetualCache 的 HashMap 本地缓存，默认打开一级缓存。

2、何时清空一级缓存
如果中间sqlSession去执行commit操作（执行插入、更新、删除），则会清空SqlSession中的一级缓存，这样做的目的为了让缓存中存储的是最新的信息，避免脏读。
一级缓存时执行commit，close，增删改等操作，就会清空当前的一级缓存；当对SqlSession执行更新操作（update、delete、insert）后并执行commit时，不仅清空其自身的一级缓存（执行更新操作的效果），也清空二级缓存（执行commit()的效果）。
3、一级缓存无过期时间，只有生命周期
MyBatis在开启一个数据库会话时，会创建一个新的SqlSession对象，SqlSession对象中会有一个Executor对象，Executor对象中持有一个PerpetualCache对象，见下面代码。当会话结束时，SqlSession对象及其内部的Executor对象还有PerpetualCache对象也一并释放掉。

mybatis二级缓存
1、二级缓存简介
它指的是Mybatis中SqlSessionFactory对象的缓存。由同一个SqlSessionFactory对象创建的SqlSession共享其缓存。
二级缓存是 mapper 映射级别的缓存，多个 SqlSession 去操作同一个 Mapper 映射的 sql 语句，多个SqlSession 可以共用二级缓存，二级缓存是跨 SqlSession 的。

2、二级缓存何时存入
在关闭sqlsession后(close)，才会把该sqlsession一级缓存中的数据添加到namespace的二级缓存中。
开启了二级缓存后，还需要将要缓存的pojo实现Serializable接口，为了将缓存数据取出执行反序列化操作，因为二级缓存数据存储介质多种多样，不一定只存在内存中，有可能存在硬盘中。

3、二级缓存有过期时间，但没有后台线程进行检测
需要注意的是，并不是key-value的过期时间，而是这个cache的过期时间，是flushInterval，意味着整个清空缓存cache，所以不需要后台线程去定时检测。
每当存取数据的时候，都有检测一下cache的生命时间，默认是1小时，如果这个cache存活了一个小时，那么将整个清空一下。

4、当 Mybatis 调用 Dao 层查询数据库时，先查询二级缓存，二级缓存中无对应数据，再去查询一级缓存，一级缓存中也没有，最后去数据库查找。

## mybatis 的# 与 $ 的区别

#占位符的特点

1. MyBatis处理 #{ } 占位符，使用的 JDBC 对象是PreparedStatement 对象，执行sql语句的效率更高。

2. 使用PreparedStatement 对象，能够避免 sql 注入，使得sql语句的执行更加安全。

3. #{ } 常常作为列值使用，位于sql语句中等号的右侧；#{ } 位置的值与数据类型是相关的。

$占位符的特点 

1. MyBatis处理 ${ } 占位符，使用的 JDBC 对象是 Statement 对象，执行sql语句的效率相对于 #{ } 占位符要更低。

2. ${ } 占位符的值，使用的是字符串连接的方式，有 sql 注入的风险，同时也存在代码安全的问题。

3. ${ } 占位符中的数据是原模原样的，不会区分数据类型。

4. ${ } 占位符常用作表名或列名，这里推荐在能保证数据安全的情况下使用 ${ }


## 一张层级结构部门表，写接口返回无限层级树状json

目前的解决方案主要有以下两种方案：

- 方案一：后端把所有需要的数据以一个大list返回前端，前端进行操作，把数据搞成树状结构
- 方案二： 后端在后端返回数据之前把数据搞成已经有层次结构的数据，方案二也分为两种解决方法 
  - 方法一：次性将数据查询出来，在java程序中进行树状结构的构建
  - 方法二： 第一次将最高层次的数据查询出来，然后多次循环查询数据库将子数据查询出来

```
递归查子
public JSONObject getInfo() {
    System.out.println("iiiii");
    List<Menu>    list=dao.testBigDecimal24(s1.concat(".testBigDecimal25"), null);
    System.out.println(list);
     
    //调用TreeTest工具类方法生成树形结构的List集合
    List<Menu> treeList = TreeUtil.listToTree(list);
 
    //使用fastjson对树形list件序列化转成json字符串,过滤掉属性值为null的属性
    String message = JSON.toJSONString(treeList,SerializerFeature.PrettyFormat);
    JSONObject returnData = new JSONObject();
 
    //重新将json字符串转成jsonObject对象,返回给前端
    returnData.put("message",JSON.parse(message));
    //return CommonUtil.successJson(returnData);
 
        return returnData;
         
    }
```



## spring cloud常用的组件

1、Eureka  ----- 服务发现（注册中心）



     作用：实现服务治理（服务注册与发现）
    
     简介：Spring Cloud Eureka是Spring Cloud Netflix项目下的服务治理模块。
    
                由两个组件组成：Eureka服务端和Eureka客户端。
    
                Eureka服务端用作服务注册中心。支持集群部署。
    
                Eureka客户端是一个java客户端，用来处理服务注册与发现。
    
               在应用启动时，Eureka客户端向服务端注册自己的服务信息，同时将服务端的服务信息缓存到本地。客户端会和服务端周期性的进行心跳交互，以更新服务租约和服务信息。

 2、Ribbon ----- 客服端负载均衡



         作用：主要提供客户侧的软件负载均衡算法。
    
        简介：Spring Cloud Ribbon是一个基于HTTP和TCP的客户端负载均衡工具，它基于Netflix Ribbon实现。通过Spring Cloud的封装，可以让我们轻松地将面向服务的REST模版请求自动转换成客户端负载均衡的服务调用。
    
         注意看上图，关键点就是将外界的rest调用，根据负载均衡策略转换为微服务调用。

3、Hystrix ---- 断路器

​     

       作用：断路器，保护系统，控制故障范围。
    
       简介：为了保证其高可用，单个服务通常会集群部署。由于网络原因或者自身的原因，服务并不能保证100%可用，如果单个服务出现问题，调用这个服务就会出现线程阻塞，此时若有大量的请求涌入，Servlet容器的线程资源会被消耗完毕，导致服务瘫痪。服务与服务之间的依赖性，故障会传播，会对整个微服务系统造成灾难性的严重后果，这就是服务故障的“雪崩”效应。

4、Zuul ---- 服务网关

​       

          作用：api网关，路由，负载均衡等多种作用
    
          简介：类似nginx，反向代理的功能，不过netflix自己增加了一些配合其他组件的特性。

在微服务架构中，后端服务往往不直接开放给调用端，而是通过一个API网关根据请求的url，路由到相应的服务。当添加API网关后，在第三方调用端和服务提供方之间就创建了一面墙，这面墙直接与调用方通信进行权限控制，后将请求均衡分发给后台服务端

5、Config ---- 分布式配置



        作用：配置管理
    
        简介：SpringCloud Config提供服务器端和客户端。服务器存储后端的默认实现使用git，因此它轻松支持标签版本的配置环境，以及可以访问用于管理内容的各种工具。
    
        这是静态的，动态的需要配合Spring Cloud Bus实现动态的配置更新。
## 表结构设计的几大范式



第一范式（1NF）：强调的是列的原子性，即列不能够再分成其他几列。 

第二范式（2NF）：首先是 1NF，另外包含两部分内容，一是表必须有一个主键；二是没有包含在主键中的列必须完全依赖于主键，而不能只依赖于主键的一部分。 

第三范式（3NF）：首先是 2NF，另外非主键列必须直接依赖于主键，不能存在传递依赖。即不能存在：非主键列 A 依赖于非主键列 B，非主键列 B 依赖于主键的情况。

第二范式（2NF）和第三范式（3NF）的概念很容易混淆，区分它们的关键点在于，2NF：非主键列是否完全依赖于主键，还是依赖于主键的一部分；3NF：非主键列是直接依赖于主键，还是直接依赖于非主键列。

范式的优点：

1）范式化的数据库更新起来更加快；

2）范式化之后，只有很少的重复数据，只需要修改更少的数据；

3）范式化的表更小，可以在内存中执行；

4）很少的冗余数据，在查询的时候需要更少的distinct或者group by语句。

 

范式的缺点：

1）范式化的表，在查询的时候经常需要很多的关联，因为单独一个表内不存在冗余和重复数据。这导致，稍微复杂一些的查询语句在查询范式的schema上都可能需要较多次的关联。这会增加让查询的代价，也可能使一些索引策略无效。因为范式化将列存放在不同的表中，而这些列在一个表中本可以属于同一个索引。

 

反范式的优点：

1）可以避免关联，因为所有的数据几乎都可以在一张表上显示；

2）可以设计有效的索引；

反范式的缺点：

3）表格内的冗余较多，删除数据时候会造成表有些有用的信息丢失。

所以在设计数据库时，要注意混用范式化和反范式化。

## Maven的模块化管理，多个模块用到同样的依赖

1、指定父模块与默认继承

dependencies即使在子项目中不写该依赖项，那么子项目仍然会从父项目中继承该依赖项（全部继承）

2、依赖管理

dependencyManagement里只是声明依赖，并不实现引入，因此子项目需要显式的声明需要用的依赖。如果不在子项目中声明依赖，是不会从父项目中继承下来的；只有在子项目中写了该依赖项，并且没有指定具体版本，才会从父项目中继承该项，并且version和scope都读取自父pom;另外如果子项目中指定了版本号，那么会使用子项目中指定的jar版本。



参考： [maven多模块项目依赖管理与依赖继承详解](https://www.jb51.net/article/233366.htm)

## 写接口post请求，requestBody形式传参，实体类有三十个字段，要对二十个String字段做非空校验

1.1，常规校验notblank

1.2 ，分组校验 @Valid 注解是java javax.validation 包下面 不支持 分组 spring 在其基础上扩展 了 组 校验 @Validated

1.3，一般比较复杂的校验 有可能在 web 不好处理 需要各种判断 后校验 这样可以使用 其提供的工具类 在service 层 提供校验 strigutils

1.4 嵌套校验 一般复杂的结构 嵌套了 对象嵌套了 list 对list 对应字段 校验

1.5 自定义校验，当提供的很多注解无法满足 要求时 可以考虑自定义注解 