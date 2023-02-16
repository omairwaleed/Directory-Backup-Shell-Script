# Backup Script

It is a script that can be used to backup a given directory every given interval of secs and the backup directory will have max number of given backups

## Overview
This directory contain two files backupd.sh and Makefile.

backupd.sh: conatin script first makes validations on input arguments then it makes the initialization as makes the first backup and get directory info and saves it in a file in this dierectory and then every interval of given sec it gets info of the directory and compare it with previous informatiom and if there is a change backup will be done.

Makefile: Runs the script and gives it the arguments from user. it also make a validation tha backup dir is found.if not it makes a new one. 


## Installation "prerequisits"

You need to install make if it isn't installed on your Ubuntu

```bash

sudo apt install make -y

```

## Instructions
User can run sript by two ways:
*running script in terminal and giving it 4 argments which are src_dir backup_dir interval max_backups

*using make to run the sript and giving it 4 arguments as like this:
make src="src_dir" dist="backup_dir" interval="interval" count="mak_backups"

user should enter arguments by this way in make file and interval and count should be integer

 
