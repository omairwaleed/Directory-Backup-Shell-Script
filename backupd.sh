#!/bin/bash
#this script backup a directory every given secs
re='^[0-9]+$'
if [ $# -lt 4 ] || [ $# -gt 4 ]
then
  echo "please enter 4 arguments"
  echo "first  : src directory"
  echo "second : backup directory"
  echo "third  : interval in  secs"
  echo "fourth : max backups"
 elif [ ! -d "$1" ] 
then 
  echo "please enter valid src directory "
 elif ! [[ $3 =~ $re ]]  
then
  echo  " third argument shuold be integer"   
 elif ! [[ $4 =~ $re ]]  
then
  echo  " fourth argument shuold be integer"
else
  currentdirectory=$(pwd)
  count=1
  date=$( date +%Y-%m-%d-%H-%M-%S )
  ls -lR $1 --time-style=+%Y-%m-%d-%H-%M-%S > directory-info.last
  cp -r $1 $2/$date
  while [ true ]
  do
    sleep $3
    ls -lR $1 --time-style=+%Y-%m-%d-%H-%M-%S > directory-info.new
    status="$(cmp --silent ./directory-info.last ./directory-info.new; echo $?)"
    if [ $status -ne 0 ]
    then
      if [ $count -lt $4 ]
      then
        newdate=$( date +%Y-%m-%d-%H-%M-%S )
        cp -r $1 $2/$newdate
        cp ./directory-info.new ./directory-info.last
        count=`expr $count + 1`
        echo "backup done"
      else    
        cd $2
        ls -1t | tail -n +$count | xargs rm -r
        cd $currentdirectory
        newdate=$( date +%Y-%m-%d-%H-%M-%S )
        cp -r $1 $2/$newdate
        cp ./directory-info.new ./directory-info.last 
        echo "backupdone after removing 1 directory"
      fi  
    else
      echo "no change in data... no backup"
    fi  
  done
fi
