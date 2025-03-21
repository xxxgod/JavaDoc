# JavaDoc
JavaDoc 基于docsify部署的JAVA文档库


如果你还未安装 Docsify，需要先使用 npm（Node.js 的包管理器）进行安装。前提是你的系统已经安装了 Node.js 和 npm。打开终端，执行下面的命令：
bash
npm i docsify-cli -g
这个命令会在全局环境下安装 docsify-cli 工具，让你能够使用 Docsify 的命令行接口。
初始化项目
在你想要创建 Docsify 文档项目的目录下，打开终端并执行以下命令：
bash
docsify init ./docs

此命令会在当前目录下创建一个名为 docs 的文件夹，并且在其中生成初始化文件，像 index.html、README.md 这类文件。index.html 是 Docsify 的入口文件，README.md 则是文档的首页内容。
本地预览
初始化完成之后，就可以在本地启动一个服务器来预览文档。在终端中运行以下命令：
bash
docsify serve ./docs

该命令会启动一个本地服务器，默认监听 3000 端口。打开浏览器，访问 http://localhost:3000 ，就能看到 Docsify 生成的文档页面了。
