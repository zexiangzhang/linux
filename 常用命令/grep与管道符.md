## grep用法

	grep -l ‘zexiang’ *                                 显示所有包含zexiang的文件名
	
	grep -n ‘zexiang’ file                              在匹配行之前加行号
	
	grep -i ‘zexiang’ file                              显示匹配行,zexiang不区分大小写
	
	grep -v ‘zexiang’ file                              显示所有不匹配行
	
	grep -q ‘zexiang’ file                              找到匹配行,但不显示,但可以检查grep的退出状态。(0 为匹配成功)
	
	grep -c ‘zexiang’ file                              只显示匹配行数(包括0)
	
	grep “$zexiang” file                                扩展变量zexiang的值再执行命令
	
	ps -ef|grep “^*zexiang″                             搜索zexiang的命令,即使它前面有零个或多个空格
	
	ps -e|grep -E ‘grant_server|commsvr|tcpsvr|dainfo’  查找多个字符串的匹配（grep -E 相当于 egrep）
	

## 管道符

		|				命令1 | 命令2  				 命令1的正确输出作为命令2的操作对象
	
	例：ps aux | grep nginx       
	
		命令1: (ps aux)								  ps命令就是最基本进程查看命令
			a: 显示现行终端机下的所有进程,包括其他用户的进程
			u: 以用户为主的进程状态
			x: 通常与a这个参数一起使用，可列出较完整信息
			
		命令2: (grep nginx) 							 从ps aux执行结果中寻找含有nginx的行
		

## 多命令执行符
					
		;		命令1 ; 命令2				 多个命令顺序执行,命令间没有逻辑关系

		&&   	命令1 && 命令2				逻辑与,命令2执行的条件是命令1的正确执行
	
		||   	命令1 || 命令2				逻辑或,命令1正确执行则命令2不执行,命令1不正确执行则命令2执行