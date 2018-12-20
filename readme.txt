=======================================================
 『问题修复锦集』
=======================================================
q1、在PHP 5.6中,使用mcrypt_encrypt（）函数时修复错误
http://webinformation.tistory.com/77修复即可

q2、解决Whoops, looks like something went wrong
https://blog.csdn.net/wen_3370/article/details/79720777

=======================================================
1、简介
Scrumwala不是一个网站，而是一个建站工具，让你创建和管理项目计划、工作进度、问题讨论、设置最后期限以及邮件通知，从而对自己的敏捷式开发进行管理。

2、GitHub
https://github.com/modestkdr/Scrumwala

3、功能&特性
通过工作计划及工作流程图实现创建和管理项目
群组讨论项目问题
设置最后期限，快速进行项目迭代
接近最后期限时通过邮件列表通知相关人员
基于Bootstrap的响应式UI

4、截图
工作计划
（图略）

5、安装
通过克隆代码仓库安装：
$ git clone https://github.com/modestkdr/scrumwala.git

接下来进入项目根目录安装项目依赖：
$ composer install

再次，配置.env文件和数据库，随后，创建数据库并运行迁移命令：
$ php artisan migrate

=======================================================