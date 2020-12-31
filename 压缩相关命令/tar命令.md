# tar命令

### Linux下最常用的打包程序

    使用tar程序打出来的包常称为tar包，tar包文件的命令通常都是以.tar结尾的
    
### tar命令的基本用法

    tar -cf zzx.tar *.jpg  是将所有.jpg的文件打成一个名为zzx.tar的包
	-c表示产生新的包
	-f指定包的文件名
    
    tar -rf zzx.tar *.gif  将所有.gif的文件增加到zzx.tar的包里面去
	-r表示增加文件
	
    tar -uf zzx.tar logo.gif  是更新原来tar包zzx.tar中logo.gif文件
	-u表示更新文件
    
    tar -tf zzx.tar  列出zzx.tar包中所有文件
	-t表示列出文件
     
    tar -xf zzx.tar  解出zzx.tar包中所有文件
	-t表示解开
					 
### tar的特殊功能

    tar可以在打包或解包的同时调用其它的压缩程序，比如调用gzip、bzip2等
	
	1)  tar调用gzip
	
		gzip是GNU组织开发的一个压缩程序;
	    .gz结尾的文件就是gzip压缩的结果;
		与gzip相对的解压程序是gunzip;
		
		tar中使用-z这个参数来调用gzip
		示例：
			tar -czf zzx.tar.gz *.jpg 
			这条命令是将所有.jpg的文件打成一个tar包，并且将其用gzip压缩，生成一个gzip压缩过的包，包名为zzx.tar.gz
			
			tar -xzf zzx.tar.gz 
			这条命令是将上面产生的包解开
			
	2) tar调用bzip2		
	
		bzip2是一个压缩能力更强的压缩程序;
		.bz2结尾的文件就是bzip2压缩的结果;
		与bzip2相对的解压程序是bunzip2;
		
		tar 中使用-j这个参数来调用bzip2
		示例：
			 tar -cjf zzx.bz2 *.jpg
			 这条命令是将所有.jpg的文件打成一个tar包，并且将其用bzip2压缩，生成一个bzip2压缩过的包，包名为zzx.tar.bz2
			 
			 tar -xjf zzx.tar.bz2
			 这条命令是将上面产生的包解开
	
	