



## 数据库引擎

面试官经常问的基础问题，就是基于MySQL数据库的这几种引擎。

· **MyISAM**：默认的MySQL插件式存储引擎，它是在Web、数据仓储和其他应用环境下最常使用的存储引擎之一。注意，通过更改STORAGE_ENGINE配置变量，能够方便地更改MySQL服务器的默认存储引擎。

· **InnoDB**：用于事务处理应用程序，具有众多特性，包括ACID事务支持。(提供行级锁)

**· BDB**：可替代InnoDB的事务引擎，支持COMMIT、ROLLBACK和其他事务特性。

**· Memory**：将所有数据保存在RAM中，在需要快速查找引用和其他类似数据的环境下，可提供极快的访问。

**· Merge**：允许MySQL DBA或开发人员将一系列等同的MyISAM表以逻辑方式组合在一起，并作为1个对象引用它们。对于诸如数据仓储等VLDB环境十分适合。

**· Archive**：为大量很少引用的历史、归档、或安全审计信息的存储和检索提供了完美的解决方案。

**· Federated**：能够将多个分离的MySQL服务器链接起来，从多个物理服务器创建一个逻辑数据库。十分适合于分布式环境或数据集市环境。

**· Cluster/NDB**：MySQL的簇式数据库引擎，尤其适合于具有高性能查找要求的应用程序，这类查找需求还要求具有最高的正常工作时间和可用性。

· **Other**：其他存储引擎包括CSV（引用由逗号隔开的用作数据库表的文件），Blackhole（用于临时禁止对数据库的应用程序输入），以及Example引擎（可为快速创建定制的插件式存储引擎提供帮助）。

*一般来说不使用事务的话，请使用MyISAM引擎，使用事务的话，一般使用InnoDB*

##### 比较常用的是MYISAM,InnoDB和Memory



#### MyISAM 和 InnoDB 的区别简单介绍区别

1、MyISAM是非事务安全的，而InnoDB是事务安全的

2、MyISAM锁的粒度是表级的，而InnoDB支持行级锁

3、MyISAM支持全文类型索引，而InnoDB不支持全文索引

4、MyISAM相对简单，效率上要优于InnoDB，小型应用可以考虑使用MyISAM

5、MyISAM表保存成文件形式，跨平台使用更加方便

**应用场景**

1、MyISAM管理非事务表，提供高速存储和检索以及全文搜索能力，如果再应用中执行大量select操作，应该选择MyISAM

2、InnoDB用于事务处理，具有ACID事务支持等特性，如果在应用中执行大量insert和update操作，应该选择InnoDB



## 应用场景
![mysql应用场景](https://xxxgod.gitee.io/javadoc/image/database/sqlScence1.png)



