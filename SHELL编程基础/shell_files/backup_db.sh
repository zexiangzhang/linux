#!/bin/bash

date=`date '+%Y-%m-%d'`

# 存放备份数据的文件路径
backup_dir=/root/mysql_backup_files/$date

# 备份的文件名称
backup_file_name=$date

# 备份数据库服务器的ip地址，公网域名也可以
backup_db_ip=***.***.***.***

# 备份数据库服务器的对应端口，一般是3306
backup_db_port=****

# 要备份的数据库名称
backup_db_name=***

# 要进行备份操作的mysql用户
backup_db_username=****

# 备份操作只有root用户才可以进行
if [ $UID -ne 0 ];then
	echo "you must use root to backup"
	sleep 2
	exit
else
	echo "you are root user"
fi

# 如果备份数据存放的目录不存在，则创建
if [ ! -d $backup_dir ];then
	echo "$backup_dir not exits, will create it"
	mkdir -p $backup_dir
else
	echo "$backup_dir exited"
fi

cd $backup_dir
# 执行备份数据库的命令，在终端会要求输入对应mysql用户的密码
/usr/bin/mysqldump -h $backup_db_ip -P $backup_db_port -u root -p -d $backup_db_name > "$backup_file_name".sql

# 如果上一步执行成功，则将当前的.sql文件打包，并提示对应信息
if [ $? -le 0 ];then
	tar -czvf "$backup_file_name".tar.gz "$backup_file_name".sql
	echo "$backup_db_name backup successful"
else
	echo "$backup_db_name backup failed"
fi

cd /root/mysql_backup_files/
# 删除15天前的目录
find . -type d -mtime +15 -exec rm -rf {} \;

