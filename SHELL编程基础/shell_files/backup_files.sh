#!/bin/bash

time=$(date "+%Y-%m-%d-%H:%M:%S")

function backup() {
    if [ ! -d $1 ];then
        echo "$1 文件夹不存在，请输入有效的文件夹路径"
        return -1
    fi
    if [ "`ls -A $1`" = "" ];then
        echo "$1 文件夹为空"
        return -1
    fi
    if [ ! -d $2 ];then
        echo "$2 文件夹不存在，将创建该文件夹"
        mkdir $2
    fi
    for source_file in `ls $1`; do
        # 判断是否是.jar文件
        if [ ${source_file:0-4} = '.jar' ];then
            cd $2
            if [ ! -d ${source_file:0:${#source_file}-4} ];then
                mkdir ${source_file:0:${#source_file}-4}
            else
                cd ${source_file:0:${#source_file}-4}
                # 删除当前目录下所有后缀名不是.jar的文件和文件夹
                find . -maxdepth 1  \( ! -iname '*.jar' ! -iname '.' \) -exec rm -r {} \;
                # 查找所有的文件个数，上一步做过操作，所以留下来的全是.jar文件
                total_file_num=`ls -l | grep "^-" | wc -l`
                if [ $total_file_num -gt 2 ];then
                    # 得到需要删除的文件个数
                    del_count=$((total_file_num=total_file_num-2))
                    # 删除$del_count个以创建时间排序的文件
                    ls -ltr | grep -v 'total' | grep "^-" | awk '{print $9}' | head -n $del_count | xargs rm -f
                fi
                cd ..
            fi
            cd ..
            cp $1/$source_file $2/${source_file:0:${#source_file}-4}/${source_file:0:${#source_file}-4}-$time.jar
            if [ $? -eq 0 ];then
                echo $source_file "备份成功"
            else
                echo $source_file "备份失败"
            fi
        fi
    done
}

backup $1 $2