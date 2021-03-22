# shell编程基础

## ***本人对shell编程也不是很了解，只了解一些简单的语法知识，和一些简单脚本的编写，因此此文档只记录本人在学习和实际工作工程中的shell知识***


## ***实际案例(只记录部分，会继续更新)***

### 1. [启动Java项目(jar包部署/jenkins部署)](https://github.com/zexiangzhang/linux/blob/main/SHELL%E7%BC%96%E7%A8%8B%E5%9F%BA%E7%A1%80/shell_files/java_command.sh)

	脚本运行命令为：./java_command.sh start/stop/restart xxx.jar
	其中第一个参数为：start或stop或restart，属于其他参数会提示对应信息
	第二个参数为要执行的jar包名称，应以.jar结尾
	
	JVM的一些参数本人写在脚本中了，可以修改后直接使用：
	
	java -XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=128m -Xms1024m -Xmx1024m -Xmn256m -Xss256k -XX:SurvivorRatio=8 -XX:+UseConcMarkSweepGC -jar $jar_name 


### 2. [文件备份](https://github.com/zexiangzhang/linux/blob/main/SHELL%E7%BC%96%E7%A8%8B%E5%9F%BA%E7%A1%80/shell_files/backup_files.sh)

	脚本运行命令为：./backup_files.sh source_dir_path backup_target_dir_path
	其中source_dir_path为需要备份的文件路径，backup_target_dir_path要备份到的目标文件路径(pwd查看即可)

	脚本用于备份源文件夹下的所有.jar文件至目标文件夹下，并以当前时间重新命名文件便于识别
	源文件夹不存在或文件夹下不存在.jar文件则提示相应信息
	目标文件夹不存在会创建
	脚本只保留最近三个版本的jar包
	脚本会删除备份到的目标文件路径下所有后缀名不是.jar的文件和文件夹
    

### 3. [数据库备份](https://github.com/zexiangzhang/linux/blob/main/SHELL%E7%BC%96%E7%A8%8B%E5%9F%BA%E7%A1%80/shell_files/backup_db.sh)

	脚本运行命令为：./backup_db.sh
	
	备份操作只有root用户才可以进行
	如果备份数据存放的目录不存在，则创建
	脚本执行过程中在终端会要求输入对应执行备份操作的mysql用户的密码
	脚本会生成备份的.sql文件，也会将此.sql文件压缩


### update continue...