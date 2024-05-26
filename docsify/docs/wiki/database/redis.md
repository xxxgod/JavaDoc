Redis 是一个开源的使用 ANSI C 语言编写、遵守 BSD 协议、支持网络、可基于内存亦可持久化的日志型、Key-Value 数据库，并提供多种语言的 API的非关系型数据库。
传统数据库遵循 ACID 规则。而 Nosql（Not Only SQL 的缩写，是对不同于传统的关系型数据库的数据库管理系统的统称） 一般为分布式而分布式一般遵循 CAP 定理。 
 
Github 源码：https://github.com/antirez/redis  
Redis 官网：https://redis.io/  


## 数据类型
##### String字符串：  
格式: set key value    
string类型是二进制安全的。意思是redis的string可以包含任何数据。比如jpg图片或者序列化的对象 。   
string类型是Redis最基本的数据类型，一个键最大能存储512MB。  


##### Hash（哈希）   
格式: hmset name  key1 value1 key2 value2    
Redis hash 是一个键值(key=>value)对集合。  
Redis hash是一个string类型的field和value的映射表，hash特别适合用于存储对象。  

 
##### List（列表） 
Redis 列表是简单的字符串列表，按照插入顺序排序。你可以添加一个元素到列表的头部（左边）或者尾部（右边）  
格式: lpush  name  value  
在 key 对应 list 的头部添加字符串元素  

格式: rpush  name  value  
在 key 对应 list 的尾部添加字符串元素  

格式: lrem name  index  
key 对应 list 中删除 count 个和 value 相同的元素  

格式: llen name    
返回 key 对应 list 的长度  


##### Set（集合） 
格式: sadd  name  value    
Redis的Set是string类型的无序集合。  
集合是通过哈希表实现的，所以添加，删除，查找的复杂度都是O(1)。  

##### zset(sorted set：有序集合)  
格式: zadd  name score value    
Redis zset 和 set 一样也是string类型元素的集合,且不允许重复的成员。   
不同的是每个元素都会关联一个double类型的分数。redis正是通过分数来为集合中的成员进行从小到大的排序。   
zset的成员是唯一的,但分数(score)却可以重复。  

## 持久化
##### 什么是Redis持久化？Redis有哪几种持久化方式？优缺点是什么？   
持久化就是把内存的数据写到磁盘中去，防止服务宕机了内存数据丢失。 
Redis 提供了两种持久化方式: RDB（默认） 和AOF    

**RDB：** 
rdb是Redis DataBase缩写   
功能核心函数rdbSave(生成RDB文件)和rdbLoad（从文件加载内存）两个函数   

**AOF:** 
Aof是Append-only file缩写  
每当执行服务器(定时)任务或者函数时flushAppendOnlyFile 函数都会被调用， 这个函数执行以下两个工作  

aof写入保存：      
WRITE：根据条件，将 aof_buf 中的缓存写入到 AOF 文件  
SAVE：根据条件，调用 fsync 或 fdatasync 函数，将 AOF 文件保存到磁盘中。  

**存储结构:**  
内容是redis通讯协议(RESP )格式的命令文本存储。  

**比较**：  
1、aof文件比rdb更新频率高，优先使用aof还原数据。  
2、aof比rdb更安全也更大   
3、rdb性能比aof好  
4、如果两个都配了优先加载AOF  



## 主从复制、哨兵、集群
详细参考：https://www.cnblogs.com/kismetv/p/9236731.html



## Redis和Memchache区别
Redis比Memchache出现晚一些，由于Redis 卓越的性能以及弥补Memchache的一些缺陷，有超过Memchache的趋势，但是两者目前都有自己的优势。下面主要从以下几个方面说明一下区别与联系；  

1、数据存储介质： Memchache缓存的数据都是存放在内存中，一旦内存失效，数据就丢失，无法恢复；Redis缓存的数据存放在内存和硬盘中，能够达到持久化存储，Redis能够利用快照和AOF把数据存放到硬盘中，当内存失效，也可以从磁盘中抽取出来，调入内存中，当物理内存使用完毕后，也可以自动的持久化的磁盘中。      

2、数据存储方式：Redis与Memchache都是以键值对的方式存储，而Redis对于值 使用比较丰富，支持Set，Hash，List，Zet（有序集合）等数据结构的存储，Memchache只支持字符串，不过Memchache也可以缓存图片、视频等非结构化数据。    

3、从架构层次：Redis支持Master-Slave（主从）模式的应用，应用在单核上， Memchache支持分布式，应用在多核上   

4、存储数据大小：对于Redis单个Value存储的数据最大为1G，而Memchache存储的最大为1MB，而存储的Value数据值大于100K时，性能会更好    

5、Redis只支持单核，而Memchache支持多核。

## 应用场景
![redis应用场景](https://xxxgod.gitee.io/javadoc/image/database/redisScene.png)