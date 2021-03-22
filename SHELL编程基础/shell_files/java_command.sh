#!/bin/bash

command=$1
jar_name=$2

if [ ${jar_name:0-4} = '.jar' ];then
    echo $command $jar_name
    echo `date` $command $jar_name>>./logs/java_command.log

    case $command in

      start)
          echo "--------$jar_name starting--------------"
          nohup java -XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=128m -Xms1024m -Xmx1024m -Xmn256m -Xss256k -XX:SurvivorRatio=8 -XX:+UseConcMarkSweepGC -jar $jar_name >./logs/$jar_name.log 2>&1 &
          echo "--------$jar_name started---------------"
          tail -f ./logs/$jar_name.log
      ;;

      stop)
          echo "--------$jar_name killing---------------"
          `ps -ef|grep $jar_name| grep -vE 'grep|java_command'|awk '{print $2}' | xargs kill -9`
          echo "--------$jar_name killed----------------"
        ;;

      restart)
          echo "--------$jar_name killing---------------"
          `ps -ef|grep $jar_name| grep -vE 'grep|java_command'|awk '{print $2}' | xargs kill -9`
          echo "--------$jar_name killed----------------"

          echo "--------$jar_name starting--------------"
          nohup java -XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=128m -Xms1024m -Xmx1024m -Xmn256m -Xss256k -XX:SurvivorRatio=8 -XX:+UseConcMarkSweepGC -jar $jar_name >./logs/$jar_name.log 2>&1 &
          echo "--------$jar_name started---------------"
          tail -f ./logs/$jar_name.log
        ;;

      *)
          echo "Sorry, the input '$command' not recognized. the first param should in (start,stop,restart), the second param should be you jar package name"
          exit 1;;
    esac
    exit 0
else
    echo "Sorry， the second input should be the file which name is end by .jar"
fi
