## Linux常用命令

- pwd:打印出当前目录路径

  

- ls:(list简写) 用来显示目标列表；参数选项：-a 列出全部档案，包括隐藏的；-l 显示档案详情；-d 仅显示指定目录，如ls -d temp/test 则只列出test目录，如果不加则会列出test目录下所有文件；--color=never/always/auto never即不要显示颜色，always 即总显示颜色，auto 是由系统自行判断。在Redhat/CentOS 系统中，默认是带颜色的，因为我们平时用的ls已经alias成了ls –color=tty 所以目录的颜色是蓝色的，而可执行文件的颜色是绿色。这样有助于帮我们区分文件的格式。**

  

- mkdir:(make directory的缩写) 创建一个目录；例如：mkdir temp/test/123;但如若temp或test目录本身不存在，则需要加上-p(递归创建目录)，即使目录存在时也可能报错找不到，也可以使用-p解决！

  

- rmdir:(rmove directory的缩写) 删除一个目录；

  

- man: 查阅一些命令的帮助信息;进入帮助信息显示页面后，可以用q来退出到原命令输入页面。

  

- rm: 删除目录或文件；该命令也有几个执行参数，如：-f 强制的意思，如果不加这个选项，当删除一个不存在的文件时会报错;-i 这个选项的作用是，当用户删除一个文件时会提示用户是否真的删除; -r 当删除目录时，加该选项，如果不加这个选项会报错。rm是可以删除不为空的目录的。



- 7.vi: 创建文件；如：temp/test/haha.txt;输入后会进入文件编辑显示页面，然后可进行文件内容的编辑。编辑完成后按ESC键，再输入：wq 保存并退出；q退出；q!强制退出，从而回到命令行界面。

  

- 8.which: 查询命令路径；如:which ls。

  

- echo $PATH: 查看环境变量PATH的配置。PATH=”$PATH”:/root 可以将root路径添加到PATH中



- cp : copy的简写，即拷贝。格式为 cp [选项] [ 来源文件 ] [目的文件] ，例如我想把test1 拷贝成test2 ，这样即可 cp temp/test/jaja.txt test2,那么此时根目录下则会出现一个test2文件，内容和jaja.txt内容一致。所以如果需要复制到同一文件夹下，需带上路径。-d 这里涉及到一个“连接”的概念。连接分为软连接和硬连接，如果不加这个-d 则拷贝软连接时会把软连接的目标文件拷贝过去，而加上后，其实只是拷贝了一个连接文件（即快捷方式）; -r 如果你要拷贝一个目录，必须要加-r选项，否则你是拷贝不了目录的；-i 如果遇到一个存在的文件，会问是否覆盖;-u 该选项仅当目标文件存在时才会生效，如果源文件比目标文件新才会拷贝，否则不做任何动作。



- touch: 如果一个文件存在时则更改其最新访问时间，如果不存在则创建一个；如：touch temp/ttt 如果ttt不存在则会创建。

  

- mv: (move的简写)即移动；其-i -u用法与上面的cp中的选项用法一致。语法：mv test1 test2前者test1为源文件，test2位目标文件。如果test2不存在，则会将test1改为test2生成；如果test2为目录且存在，则会将test1移动到test2中。这个命令也可以用作于window中的重命名的作用。

  

- cat: 查看一个文件的内容。如：cat temp/test/hello 则会显示hello文件中的内容。-n 会显示内容的行号；-A 会打印所有的内容，包括特殊符号；而tac命令则恰好与cat相反，其作用也是将文件内容反序打印出来。

  

- echo "123" > temp/test/hello 和 echo "123" >> temp/test/hello都是将内容123写入到hello文件中。但>与>>的区别在于，前者会将hello中的全部内容改成只为123,而后者则是在之前的内容后新起一行写入123。

  

- more: 显示文件内容(当文件内容较多的时候，用这个可以翻看)；类似的命令还有less；

  

- head: 显示文件内容前10行，加 -n 则显示前n行；tail命令则是显示文件内容后10行,-n同理。 -f 动态显示文件的最后十行，如果文件是不断增加的，则用-f 选项。如：tail -f /var/log/messages。

  

- shutdown: 关机命令，但我使用时貌似提醒必须是root权限才可以执行。shutdown -h now 立刻关机 (halt命令也是) -h后面可以接数字或者时间格式，表示延时多少分钟后关机或在某个时间点关机；reboot命令是重启。

  

- chgrp： 更改所属组；语法：chgrp [组名] [文件名]

  

- chown： 更改所属主；语法：chown [ -R ] 账户名 文件名;这里的-R选项只作用于目录，作用是级联更改，即不仅更改当前目录，连目录里的目录或者文件全部更改。

  

- useradd: 创建用户；如useradd test 即创建了一个账户名为test。

  

- passwd: 设置密码；如passwd test 即为刚创建的test用户设置密码。

  

- ln:(link的缩写) 建立连接档，分为硬连接（hard link）和软连接（symbolic link），但一般是使用软连接。所以需要加入一个选项 -s ,如果不加则表示建立硬链接。这个命令就好比windows中给一个应用程序创建一个快捷方式。

  

- su: 切换用户；如su root则切换到超级管理员。

  

- find: 查找文件；如 find /usr/java 则会查找出usr目录下所有与java相关的文件。查找文件时很多需要权限，所以可以使用root来查找。

  

- tar: 解压命令；语法：tar [主选项+辅选项] 文件或者目录;该命令分为主辅两种选项，主选项必须有，是用来告诉tar做什么，辅选项可以选用。
  主选项：
  -c 创建新的档案文件。如果用户想备份一个目录或是一些文件，就要选择这个选项。相当于打包。
  -x 从档案文件中释放文件。相当于拆包。
  -t 列出档案文件的内容，查看已经备份了哪些文件。
  特别注意，在参数的下达中， c/x/t 仅能存在一个！不可同时存在！因为不可能同时压缩与解压缩。
  辅助选项：
  -z：是否同时具有 gzip 的属性？亦即是否需要用 gzip 压缩或解压？ 一般格式为xx.tar.gz或xx. tgz
  -j：是否同时具有 bzip2 的属性？亦即是否需要用 bzip2 压缩或解压？一般格式为xx.tar.bz2  
  -v：压缩的过程中显示文件！这个常用
  -f：使用档名，请留意，在 f 之后要立即接档名喔！不要再加其他参数！
  -p：使用原文件的原来属性（属性不会依据使用者而变）
  --exclude FILE：在压缩的过程中，不要将 FILE 打包！
  如:tar -xvjf test.tar.bz2 即解压名为test的压缩包。

  

- 启动jar包

  nohup java -jar project.jar > nohup.out 2>&1 &

  解释：

  catalina.out将标准输出指向制定文件catalina.out
  2>&1 输出所有的日志文件
  & 后台启动
  java -jar webapp/project.jar --spring.profiles.active=debug01 > webapp/start.out &

  

  logstash linux下启动如下

  （守护进程）

  ./bin/logstash agent -f conf/paycenter.conf &

  

- 删除当前路径下大于100M文件命令

  find ./ -size +100M | xargs rm -rf

  其中第一个/表示路径，此时表示的是根目录，也就是搜索全部的文件

  -type表示类型

  f表示是文件

  -size 表示大小

  +100M：表示大于100M

  

- 查看磁盘空间

  查看磁盘分区占用情况：df -ah

- 查看当前目录：du -sh *

  

- 查看内存使用情况

  cat /proc/meminfo 查看RAM使用情况最简单的方法是通过/proc/meminfo。这个动态更新的虚拟文件实际上是许多其他内存相关工具(如：free / ps / top)等的组合显示。/proc/meminfo列出了所有你想了解的内存的使用情况。进程的内存使用信息也可以通过/proc/<pid>/statm 和 /proc/<pid>/status 来查看。

  

- free -h free命令是一个快速查看内存使用情况的方法，它是对 /proc/meminfo 收集到的信息的一个概述。

  total:总计物理内存的大小。
  used:已使用多大。
  free:可用有多少。
  Shared:多个进程共享的内存总额。
  Buffers/cached:磁盘缓存的大小。
  top 命令提供了实时的运行中的程序的资源使用统计。你可以根据内存的使用和大小来进行排序。

  

- 查看目录中文件大小

  du -h --max-depth=1

  

- 
  查看端口占用情况

  lsof -i:8080

  

- 查看服务器环境变量 env

  

- 
  用top命令指定固定的PID

  top -p 10997

  

- 
  查询指定进程内的线程占用资源情况

  top -Hp 31737查询

  

- find相关命令

  **1.按照文件名查找**

  (1)find / -name nginx.conf　　#在根目录下查找文件nginx.conf，表示在整个硬盘查找

  (2)find /etc -name httpd.conf　　#在/etc目录下文件httpd.conf

  (3)find /etc -name ‘srm’　　#使用通配符*(0或者任意多个)。表示在/etc目录下查找文件名中含有字符串‘srm’的文件

  (4)find . -name ‘srm*’ 　　#表示当前目录下查找文件名开头是字符串‘srm’的文件

  **2.按照文件特征查找**

  (1)find / -amin -10 　　# 查找在系统中最后10分钟访问的文件(access time)

  (2)find / -atime -2　　 # 查找在系统中最后48小时访问的文件

  (3)find / -empty 　　# 查找在系统中为空的文件或者文件夹

  (4)find / -group cat 　　# 查找在系统中属于 group为cat的文件

  (5)find / -mmin -5 　　# 查找在系统中最后5分钟里修改过的文件(modify time)

  (6)find / -mtime -1 　　#查找在系统中最后24小时里修改过的文件

  (7)find / -user fred 　　#查找在系统中属于fred这个用户的文件

  (8)find / -size +10000c　　#查找出大于10000000字节的文件(c:字节，w:双字，k:KB，M:MB，G:GB)

  (9)find / -size -1000k 　　#查找出小于1000KB的文件

  **3.使用混合查找方式查找文件**

  参数有：！，-and(-a)，-or(-o)。

  (1)find /tmp -size +10000c -and -mtime +2 　　#在/tmp目录下查找大于10000字节并在最后2分钟内修改的文件

  (2)find / -user fred -or -user george 　　#在/目录下查找用户是fred或者george的文件文件

  (3)find /tmp ! -user panda　　#在/tmp目录中查找所有不属于panda用户的文件
  