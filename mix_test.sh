# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    basic_test.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: snunes <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/09/01 18:04:41 by snunes            #+#    #+#              #
#    Updated: 2019/09/03 19:13:30 by snunes           ###   ########.fr        #
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

echo "=========================== mix tests ===========================\n";
mkdir -p result;
./$1 -lR /usr/bin 2>&1 | grep -v "ls:" | grep -v "treereg" > result/r1 2>&1;
ls -lR /usr/bin 2>&1 | grep -v "ls:" | grep -v "treereg" > result/r2 2>&1;
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
	echo $red"Test "$nb_test": [ft_ls -lR /usr/bin]"$pos$cross$clear;
else
	((success+=1));
	echo $green"Test "$nb_test": [ft_ls -lR /usr/bin]"$pos$pos$tick$clear;
fi
rm -rf result;

mkdir -p result;
./$1 -lt /usr > result/r1 2>&1;
ls -lt /usr > result/r2 2>&1;
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
	echo $red"Test "$nb_test": [ft_ls -lt /usr]"$pos$cross$clear;
else
	((success+=1));
	echo $green"Test "$nb_test": [ft_ls -lt /usr]"$pos$pos$tick$clear;
fi
rm -rf result;

mkdir -p result;
mkdir tests;
touch tests/files{0..1000};
./$1 -l tests > result/r1 2>&1;
ls -l tests > result/r2 2>&1;
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
	echo $red"Test "$nb_test": [ft_ls -l] with many files"$pos$cross$clear;
else
	((success+=1));
	echo $green"Test "$nb_test": [ft_ls -l] with many files"$pos$pos$tick$clear;
fi
rm -rf result;
rm -rf tests;

mkdir -p result;
./$1 -l /var/ | grep -v "@" > result/r1 2>&1;
ls -l /var/ | grep -v "@" > result/r2 2>&1;
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
	echo $red"Test "$nb_test": [ft_ls -l /var/run/]"$pos$cross$clear;
else
	((success+=1));
	echo $green"Test "$nb_test": [ft_ls -l /var/run/]"$pos$pos$tick$clear;
fi
rm -rf result;
rm -rf tests/file*;
rm -rf tests;

printf $Byellow"\nEnd of mix tests\n"$clear;
if [ $success -eq $nb_test ]
then
	echo $green"Congratulation ! You passed all the tests."$clear;
else
	printf $cyan"%d test succeed, " "$success";
	((success=4-success));
	printf "%d test failed\n"$clear "$success";
fi
