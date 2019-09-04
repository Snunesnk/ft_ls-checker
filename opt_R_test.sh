# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    opt_l_test.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: snunes <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/09/01 18:03:31 by snunes            #+#    #+#              #
#    Updated: 2019/09/02 17:16:36 by snunes           ###   ########.fr        #
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
	echo "Usage: ./b.sh path/to/ft_ls [p]"
	exit 1;
fi

echo "=========================== option R tests ===========================\n";
mkdir -p .result;
mkdir -p level1/level{2..4}/level{5..9}
./$1 -1R level1 > .result/r1 2>&1;
ls -1R level1 > .result/r2 2>&1;
diff .result/r1 .result/r2 > .result/r3;
	((nb_test+=1))
if [ -s .result/r3 ]
then
	echo $cyan"\n==========\nft_ls:"$clear;
	cat -e .result/r1;
	echo $cyan"==========\nls:"$clear;
	cat -e .result/r2;
	if [ -n $2 ] && [ "$2" == "p" ]
	then
		echo "\nDiff:";
		cat .result/r3;
		echo "";
	fi
	echo $red"Test "$nb_test": [ft_ls -1R] simple"$pos$cross$clear;
else
	((success+=1));
	echo $green"Test "$nb_test": [ft_ls -1R] simple"$pos$pos$tick$clear;
fi
rm -rf .result;
rm -rf level1;

mkdir -p .result;
mkdir -p tests;
mkdir -p tests/a tests/b tests/c;
mkdir -p tests/.a tests/.b tests/.c;
./$1 -1R tests > .result/r1 2>&1;
ls -1R tests > .result/r2 2>&1;
diff .result/r1 .result/r2 > .result/r3;
	((nb_test+=1));
if [ -s .result/r3 ]
then
	echo $cyan"\n==========\nft_ls:"$clear;
	cat -e .result/r1;
	echo $cyan"==========\nls:"$clear;
	cat -e .result/r2;
	if [ -n $2 ] && [ "$2" == "p" ]
	then
		echo "\nDiff:";
		cat .result/r3;
		echo "";
	fi
	echo $red"Test "$nb_test": [ft_ls -1R] with hidden files"$pos$cross$clear;
else
	((success+=1));
	echo $green"Test "$nb_test": [ft_ls -1R] with hidden files"$pos$tick$clear;
fi
rm -rf .result;
rm -rf tests;

mkdir -p .result;
mkdir -p dir1 dir2 dir3;
chmod 000 dir1;
./$1 -1R 2>&1 | grep -v denied> .result/r1 2>&1;
ls -1R 2>&1 | grep -v denied > .result/r2 2>&1;
diff .result/r1 .result/r2 > .result/r3;
	((nb_test+=1));
if [ -s .result/r3 ]
then
	echo $cyan"\n==========\nft_ls:"$clear;
	cat -e .result/r1;
	echo $cyan"==========\nls:"$clear;
	cat -e .result/r2;
	if [ -n $2 ] && [ "$2" == "p" ]
	then
		echo "\nDiff:";
		cat .result/r3;
		echo "";
	fi
	echo $red"Test "$nb_test": file without permission"$pos$cross$clear;
else
	((success+=1));
	echo $green"Test "$nb_test": file without permission"$pos$tick$clear;
fi
rm -rf .result;
chmod 777 dir1;
rm -rf dir1 dir2 dir3;

mkdir -p .result;
mkdir A;
touch  A/file rootFile;
./$1 -1R A a rootfile Rootfile > .result/r1 2>&1;
ls -1R A a rootfile Rootfile > .result/r2 2>&1;
diff .result/r1 .result/r2 > .result/r3;
	((nb_test+=1));
if [ -s .result/r3 ]
then
	echo $cyan"\n==========\nft_ls:"$clear;
	cat -e .result/r1;
	echo $cyan"==========\nls:"$clear;
	cat -e .result/r2;
	echo $cyan"=========="$clear;
	if [ -n $2 ] && [ "$2" = "p" ]
	then
		echo "\nDiff:";
		cat .result/r3;
		echo "";
	fi
	echo $red"Test "$nb_test": Case insensitive test"$pos$cross$clear;
else
	((success+=1));
	echo $green"Test "$nb_test": Case insensitive test"$pos$tick$clear;
fi
rm -rf .result;
rm -rf A rootFile;

mkdir -p .result;
mkdir -p dir;
mkdir -p open/closed;
chmod 000 dir;
chmod 000 open/closed;
./$1 -1R 2>&1 | grep -v denied | wc -l | tr -d ' ' | tr -d '\n' > .result/r1 2>&1;
ls -1R 2>&1 | grep -v denied | wc -l | tr -d ' ' | tr -d '\n' > .result/r2 2>&1;
diff .result/r1 .result/r2 > .result/r3;
	((nb_test+=1));
if [ -s .result/r3 ]
then
	echo $cyan"\n==========\nft_ls:"$clear;
	cat -e .result/r1;
	echo $cyan"==========\nls:"$clear;
	cat -e .result/r2;
	echo $cyan"=========="$clear;
	if [ -n $2 ] && [ "$2" = "p" ]
	then
		echo "\nDiff:";
		cat .result/r3;
		echo "";
	fi
	echo $red"Test "$nb_test": Count of error message"$pos$cross$clear;
else
	((success+=1));
	echo $green"Test "$nb_test": Count of error message"$pos$tick$clear;
fi
rm -rf .result;
chmod 777 dir;
chmod 777 open/closed;
rm -rf dir;
rm -rf open;

mkdir -p .result;
mkdir -p dir/dir2;
touch dir/file1 dir/file2 dir/file3 dir/file4;
ln -s dir symdir;
./$1 -1R symdir/ > .result/r1 2>&1;
ls -1R symdir/ > .result/r2 2>&1;
diff .result/r1 .result/r2 > .result/r3;
	((nb_test+=1));
if [ -s .result/r3 ]
then
	echo $cyan"\n==========\nft_ls:"$clear;
	cat -e .result/r1;
	echo $cyan"==========\nls:"$clear;
	cat -e .result/r2;
	echo $cyan"=========="$clear;
	if [ -n $2 ] && [ "$2" = "p" ]
	then
		echo "\nDiff:";
		cat .result/r3;
		echo "";
	fi
	echo $red"Test "$nb_test": Directories symlink"$pos$cross$clear;
else
	((success+=1));
	echo $green"Test "$nb_test": Directories symlink"$pos$tick$clear;
fi
rm -rf .result;
rm -rf dir;
rm -rf symdir;

mkdir -p .result;
echo $cyan"==========\ntime of [ft_ls -R ~/]:"$clear;
time ./$1 -1R ~/ | grep -v "ls:" > .result/r1 2>&1;
echo $cyan"==========\ntime of [ls -R ~/]:"$clear;
time ls -1R ~/ | grep -v "ls:" > .result/r2 2>&1;
echo $cyan"=========="$clear;
diff .result/r1 .result/r2 > .result/r3;
	((nb_test+=1));
if [ -s .result/r3 ]
then
	echo $cyan"\n==========\nft_ls:"$clear;
	cat -e .result/r1;
	echo $cyan"==========\nls:"$clear;
	cat -e .result/r2;
	echo $cyan"=========="$clear;
	if [ -n $2 ] && [ "$2" = "p" ]
	then
		echo "\nDiff:";
		cat .result/r3;
		echo "";
	fi
	echo $red"Test "$nb_test": [ft_ls -1R ~/]"$pos$cross$clear;
else
	((success+=1));
	echo $green"Test "$nb_test": [ft_ls -1R ~/]"$pos$tick$clear;
fi
rm -rf .result;

printf $Byellow"\nEnd of option R tests\n"$clear;
if [ $success -eq $nb_test ]
then
	echo $green"Congratulation ! You passed all the tests."$clear;
else
	printf $cyan"%d test succeed, " "$success";
	((success= $nb_test - $success));
	printf "%d test failed\n"$clear "$success";
fi
