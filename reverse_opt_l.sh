# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    opt_l_test.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: snunes <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/09/01 18:03:31 by snunes            #+#    #+#              #
#    Updated: 2019/09/03 18:09:43 by snunes           ###   ########.fr        #
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

echo "=========================== reverse option l tests ===========================\n";
mkdir -p .result;
./$1 -1rl > .result/r1 2>&1;
ls -1rl > .result/r2 2>&1;
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
	echo $red"Test "$nb_test": [ft_ls -1rl]"$pos$cross$clear;
else
	((success+=1));
	echo $green"Test "$nb_test": [ft_ls -1rl]"$pos$pos$tick$clear;
fi
rm -rf .result;

mkdir -p .result;
./$1 -lr ../ > .result/r1 2>&1;
ls -lr ../ > .result/r2 2>&1;
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
	echo $red"Test "$nb_test": [ft_ls -lr ../]"$pos$cross$clear;
else
	((success+=1));
	echo $green"Test "$nb_test": [ft_ls -lr ../]"$pos$tick$clear;
fi
rm -rf .result;

mkdir -p .result;
mkdir -p dir1 dir2 dir3;
./$1 -lr dir1 dir2 dir3 > .result/r1 2>&1;
ls -lr dir1 dir2 dir3 > .result/r2 2>&1;
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
	echo $red"Test "$nb_test": [ft_ls -lr dir1 dir2 dir3]"$pos$cross$clear;
else
	((success+=1));
	echo $green"Test "$nb_test": [ft_ls -lr dir1 dir2 dir3]"$pos$tick$clear;
fi
rm -rf .result;
rm -rf dir1 dir2 dir3;

mkdir -p .result;
mkdir -p dir1 dir2 dir3;
touch  dir1/file1 dir2/file2 dir3/file3;
echo "Bonjour monde" > dir1/file1
echo "Hello world" > dir2/file2
echo "Hola mundo" > dir3/file3
./$1 -lr dir1 dir2 dir3 > .result/r1 2>&1;
ls -lr dir1 dir2 dir3 > .result/r2 2>&1;
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
	echo $red"Test "$nb_test": [ft_ls -lr dir1 dir2 dir3]"$pos$cross$clear;
else
	((success+=1));
	echo $green"Test "$nb_test": [ft_ls -lr dir1 dir2 dir3]"$pos$tick$clear;
fi
rm -rf .result;
rm -rf dir1 dir2 dir3;

mkdir -p .result;
mkdir -p dir;
touch dir/file ;
ln dir/file sym0;
ln dir/file sym1;
ln dir/file sym2;
ln dir/file sym3;
ln dir/file sym4;
ln dir/file sym5;
ln dir/file sym6;
ln dir/file sym7;
ln dir/file sym8;
ln dir/file sym9;
ln dir/file sym10;
ln dir/file sym11;
ln dir/file sym12;
./$1 -lra dir > .result/r1 2>&1;
ls -lra dir > .result/r2 2>&1;
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
	echo $red"Test "$nb_test": files with link"$pos$cross$clear;
else
	((success+=1));
	echo $green"Test "$nb_test": files with link"$pos$tick$clear;
fi
rm -rf .result;
rm -rf dir;
rm -rf sym0;
rm -rf sym1;
rm -rf sym2;
rm -rf sym3;
rm -rf sym4;
rm -rf sym5;
rm -rf sym6;
rm -rf sym7;
rm -rf sym8;
rm -rf sym9;
rm -rf sym10;
rm -rf sym11;
rm -rf sym12;

mkdir -p .result;
mkdir -p dir;
touch file1;
touch file2;
touch file3;
echo "YA PA D PANNO" > file1;
echo "To be or not to be" > file2;
echo "Stonks" > file3;
ln -s file1 dir/sym1;
ln -s file2 dir/sym2;
ln -s file3 dir/sym3;
ln -s dir dir/symdir;
echo "I like trains" > dir/sym1;
echo "2B3" > dir/sym2;
echo "Ah yes, enslaved words" > dir/sym3;
./$1 -lr dir > .result/r1 2>&1;
ls -lr dir > .result/r2 2>&1;
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
	echo $red"Test "$nb_test": files with symlink"$pos$cross$clear;
else
	((success+=1));
	echo $green"Test "$nb_test": files with symlink"$pos$tick$clear;
fi
rm -rf .result;
rm -rf dir;
rm -rf file1;
rm -rf file2;
rm -rf file3;

mkdir -p .result;
./$1 -lr /dev | grep -v "ls:" | grep -v "dtrace" | grep -v "io8log" | grep -v "io8logtemp" > .result/r1 2>&1;
ls -lr /dev | grep -v "ls:" | grep -v "dtrace" | grep -v "io8log" | grep -v "io8logtemp" > .result/r2 2>&1;
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
	echo $red"Test "$nb_test": [ft_ls -lr /dev]"$pos$cross$clear;
else
	((success+=1));
	echo $green"Test "$nb_test": [ft_ls -lr /dev]"$pos$tick$clear;
fi
rm -rf .result;

mkdir -p .result;
touch -t 999912312459 future;
touch -t 01010101 first_day;
touch -t 6901010101 past;
touch present;
touch present_too;
touch present_again;
./$1 -lr > .result/r1 2>&1;
ls -lr > .result/r2 2>&1;
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
	echo $red"Test "$nb_test": special timestamps files"$pos$cross$clear;
else
	((success+=1));
	echo $green"Test "$nb_test": special timestamps files"$pos$tick$clear;
fi
rm -rf .result;
rm -rf future;
rm -rf first_day;
rm -rf past;
rm -rf present;
rm -rf present_too;
rm -rf present_again;

mkdir -p .result;
touch setgid_exec; chmod 676 setgid_exec; chmod g+s setgid_exec;
touch setgid; chmod 666 setgid; chmod g+s setgid;
touch setuid_exec; chmod 766 setuid_exec; chmod u+s setuid_exec;
touch setuid; chmod 666 setuid; chmod u+s setuid;
touch sticky_exec; chmod 667 sticky_exec; chmod +t sticky_exec;
touch sticky; chmod 666 sticky; chmod +t sticky;
./$1 -lr > .result/r1 2>&1;
ls -lr > .result/r2 2>&1;
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
	echo $red"Test "$nb_test": setuid, setgid and sticky bit tests"$pos$cross$clear;
else
	((success+=1));
	echo $green"Test "$nb_test": setuid, setgid and sticky bit tests"$pos$tick$clear;
fi
rm -rf .result;
rm -rf setgid_exec;
rm -rf setgid;
rm -rf setuid_exec;
rm -rf setuid;
rm -rf sticky_exec;
rm -rf sticky;

printf $Byellow"\nEnd of reverse option l tests\n"$clear;
if [ $success -eq $nb_test ]
then
	echo $green"Congratulation ! You passed all the tests."$clear;
else
	printf $cyan"%d test succeed, " "$success";
	((success= $nb_test - $success));
	printf "%d test failed\n"$clear "$success";
fi
