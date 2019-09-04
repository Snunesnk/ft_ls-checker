# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    custom_test.sh                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: snunes <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/09/04 11:17:39 by snunes            #+#    #+#              #
#    Updated: 2019/09/04 11:37:50 by snunes           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
#!/bin/bash

### All of this is needed, but you can change colors or add variable if you wish to
clear="\033[0m"
green="\033[32m"
red="\033[31m"
cyan="\033[36m"
Byellow="\033[33;1m"
pos="\033[60G"
cross="\xE2\x9D\x8C"
tick="\xE2\x9C\x94"
success=0;
nb_test=0;

if [ -z $1 ]
then
	echo "ft_ls executable is missing"
	echo "Usage: ./basic_test.sh path/to/ft_ls [p]"
	exit 1;
fi

### Creation of the directory that will contain the output of the commands
mkdir -p result;
### Edit the test name below
test_name="TEST NAME"
echo "=========================== "$test_name" ===========================\n";

### Prerequisite you need for the test. Ex:
mkdir -p dir1 dir2 dir3
touch dir1/file1 dir2/file2
ln -s dir1/file1 symfile
### Command you want to test. Ex:
### Your ls:
./$1 -1l dir1 > result/r1 2>&1; ### $1 represent your ft_ls, and the output, error and
### standard, is stored in a hidden file.
### True ls:
ls -1l dir1 > result/r2 2>&1;
### This below up to the "fi" is needed to print and determine your success/fail
### (let's say you succeed)
diff result/r1 result/r2 > result/r3;
	((nb_test+=1))
if [ -s result/r3 ]
then
	echo $cyan"\n==========\nft_ls:"$clear;
	cat -e result/r1;
	echo $cyan"==========\nls:"$clear;
	cat -e result/r2;
	if [ -n $2 ] && [ "$2" == "p" ]
	then
		echo "\nDiff:";
		cat result/r3;
		echo "";
	fi 
	### Edit the two TEST DESCRIPTION below with some description.
	### Ex: [ft_ls -1l dir1] and [ls -1l dir2] 	
	echo $red"Test "$nb_test": TEST DESCRIPTION"$pos$cross$clear;
else
	((success+=1));
	echo $green"Test "$nb_test": TEST DESCRIPTION"$pos$pos$tick$clear;
fi
### Now you can erase all the files you created and that are no longer needed
rm -rf dir1
rm -rf dir2
rm -rf symfile

### To add another test, just copy paste the previous pattern and edit it

### End of all test, this will print your result.
printf $Byellow"\nEnd of "$test_name" tests\n"$clear;
if [ $success -eq $nb_test ]
then
	echo $green"Congratulation ! You passed all the tests."$clear;
else
	printf $cyan"%d test succeed, " "$success";
	((success=$nb_test-$success));
	printf "%d test failed\n"$clear "$success";
fi
rm -rf result;
