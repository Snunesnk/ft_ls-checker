# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    basic_test.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: snunes <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/09/01 18:04:41 by snunes            #+#    #+#              #
#    Updated: 2019/09/03 18:04:32 by snunes           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
#!/bin/bash

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

echo "=========================== reverse Basic tests ===========================\n";
mkdir -p result;
./$1 -1r > result/r1 2>&1;
ls -1r > result/r2 2>&1;
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
	echo $red"Test "$nb_test": [ft_ls -1r]"$pos$cross$clear;
else
	((success+=1));
	echo $green"Test "$nb_test": [ft_ls -1r]"$pos$pos$tick$clear;
fi
rm -rf result;

mkdir -p result;
./$1 -1r ../ > result/r1 2>&1;
ls -1r ../ > result/r2 2>&1;
diff result/r1 result/r2 > result/r3;
	((nb_test+=1));
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
	echo $red"Test "$nb_test": [ft_ls -1r ../]"$pos$cross$clear;
else
	((success+=1));
	echo $green"Test "$nb_test": [ft_ls -1r ../]"$pos$tick$clear;
fi
rm -rf result;

mkdir -p result;
mkdir -p dir1 dir2 dir3;
./$1 -1r dir1 dir2 dir3 > result/r1 2>&1;
ls -1r dir1 dir2 dir3 > result/r2 2>&1;
diff result/r1 result/r2 > result/r3;
	((nb_test+=1));
if [ -s result/r3 ]
then
	echo $cyan"\n==========\nft_ls:"$clear;
	cat -e result/r1;
	echo $cyan"==========\nls:"$clear;
	cat -e result/r2;
	if [ -n $2 ] && [ "$1" == "p" ]
	then
		echo "\nDiff:";
		cat result/r3;
		echo "";
	fi
	echo $red"Test "$nb_test": [ft_ls -1r dir1 dir2 dir3]"$pos$cross$clear;
else
	((success+=1));
	echo $green"Test "$nb_test": [ft_ls -1r dir1 dir2 dir3]"$pos$tick$clear;
fi
rm -rf result;
rm -rf dir1 dir2 dir3;

mkdir -p result;
mkdir -p dir1 dir2 dir3;
touch  dir1/file1 dir2/file2 dir3/file3;
./$1 -1r dir1 dir2 dir3 > result/r1 2>&1;
ls -1r dir1 dir2 dir3 > result/r2 2>&1;
diff result/r1 result/r2 > result/r3;
	((nb_test+=1));
if [ -s result/r3 ]
then
	echo $cyan"\n==========\nft_ls:"$clear;
	cat -e result/r1;
	echo $cyan"==========\nls:"$clear;
	cat -e result/r2;
	echo $cyan"=========="$clear;
	if [ -n $2 ] && [ "$2" = "p" ]
	then
		echo "\nDiff:";
		cat result/r3;
		echo "";
	fi
	echo $red"Test "$nb_test": [ft_ls -1r dir1 dir2 dir3]"$pos$cross$clear;
else
	((success+=1));
	echo $green"Test "$nb_test": [ft_ls -1r dir1 dir2 dir3]"$pos$tick$clear;
fi
rm -rf result;
rm -rf dir1 dir2 dir3;

printf $Byellow"\nEnd of reverse basic tests\n"$clear;
if [ $success -eq $nb_test ]
then
	echo $green"Congratulation ! You passed all the tests."$clear;
else
	printf $cyan"%d test succeed, " "$success";
	((success=4-success));
	printf "%d test failed\n"$clear "$success";
fi
