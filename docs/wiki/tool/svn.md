###### 简介
svn是一个版本控制软件，

通过建立一个安放软件源文件的厂库，能够从厂库中chekout出来，也可以把一个add进去，可以进行版本比较，也可以进行权限控制，不同的用户授予不同的权限，

一个svn项目文件下有branches,tags,trunk三个目录，trunk代表主线，存放正在开发的项目；tags存放稳定的版本（只读的，不可修改的）;branches代表分支，branches分支可以分为即将发布的分支，解决bug的分支，引用新技术或功能的分支等，开发完成后要合并到主干。

 

###### （常用的Branches分支有好几种类型，这里列出常用的几种。

 Release Branches

当trunk达到准备发布的阶段时（或者你想冻结新特色的添加时），你应该创建一个release branches。

Bug fix branches

分支也可以用于处理trunk或release branches里发现的严重的Bug。

Experimental branches

有时你想将某个新技术引进项目。这很好，但是你当然不想赌上你的整个项目。想象一下，你想把你的Web程序从PHP4改为PHP5。你要花多少时间？在这期间你的trunk停止使用？直到你把所有到PHP5的转换做完）

###### svn常用操作
下载软件，根据项目资源库路径和自己的用户名密码找到项目，checkout到本地项目，提交，更新，查看历史版本，解决冲突等等

对于本地不想加入版本空值的可以进行ignore

###### svn常用命令
svn  checkout 检出项目到本地

svn　add 添加新文件

svn　commit 提交

svn　update更新文件

svn　delete删除文件

svn　diff 比较差异

svn　log查看日志

svn merge 将两个版本的文件的差异合并到当前文件

例如：svn merge -r 20:25 test.cpp（将版本20与25之间的差异合并到当前文件，但一般会发生冲突，需要处理一下）

svn diff
svn diff test.php 将本地文件和版本库文件比较

svn diff -r m:n path(对版本m和版本n比较差异)

例如：svn diff -r 200:201 test.php

svn update
svn update如果后面没有目录，默认将当前目录以及子目录下的所有文件都更新到最新版本。

svn update test.php 更新指定文件

svn update -r 200 test.php(test.php还原到版本200)

 

svn log
svn log test.php 显示文件的所有修改记录，及其版本号的变化

 

svn merge
svn merge -r m:n path

svn merge -r 200:205 test.php（将版本200与205之间的差异合并到当前文件，但是一般都会产生冲突，需要处理一下）

 

 

###### svn的冲突解决
出现冲突文件，需要进行编辑冲突，修改完冲突的地方，进行测试，测试没有问题，文件标记为已解决，进行提交

###### Svn分支的合并
主干和分支都把所有文件提交或更新，保持跟版本库一致，然后在主干上进行合并分支，对于有冲突的，我会先保留冲突的文件，合并完之后，在看冲突的地方，进行解决，本地测试，没有问题了提交到主干

 

###### svn版本回退
首先查看提交日志Show log

之后选择要回退的版本，点击revert to this version还原到这个版本

 

对于update item to revison:,本地更新到这个svn版本，作为只读模式版本无法提交所作的更改，一般作查看历史版本用

修改提交
修改前都是先与资源库同步，看本地的代码是否跟版本库一致

提交的时候也是先与资源库同步

如果有更新或者冲突，就先解决掉，然后再进行修改或提交

查看资源历史记录
通过资源历史记录能够查看提交的功能，提交的内容等，方便进行回退等
   
    
   
Svn资源库
通过svn资源库可以查看主干，所有的分支等，可以在svn资源库进行检出代码