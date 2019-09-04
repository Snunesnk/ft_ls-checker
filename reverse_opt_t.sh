# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    opt_l_test.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: snunes <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/09/01 18:03:31 by snunes            #+#    #+#              #
#    Updated: 2019/09/03 18:08:19 by snunes           ###   ########.fr        #
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

mkdir -p .result;

echo "=========================== reverse option t tests ===========================\n";
mkdir tests;
touch tests/a tests/b tests/c tests/d tests/e;
touch -t 201212101830.55 tests/c;
./$1 -1rt tests > .result/r1 2>&1;
ls -1rt tests > .result/r2 2>&1;
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
	echo $red"Test "$nb_test": [ft_ls -1rt] simple"$pos$cross$clear;
else
	((success+=1));
	echo $green"Test "$nb_test": [ft_ls -1rt] simple"$pos$pos$tick$clear;
fi
rm -rf tests;

mkdir -p tests;
touch -t 201312101830.55 tests/a;
touch -t 201212101830.55 tests/b;
touch -t 201412101830.55 tests/c;
touch -t 202012101830.55 tests/d;
./$1 -1rt tests > .result/r1 2>&1;
ls -1rt tests > .result/r2 2>&1;
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
	echo $red"Test "$nb_test": [ft_ls -1rt] easy"$pos$cross$clear;
else
	((success+=1));
	echo $green"Test "$nb_test": [ft_ls -1rt] easy"$pos$tick$clear;
fi
rm -rf tests;

mkdir -p tests;
touch -t 202012101830.55 tests/a;
touch -t 201312101830.55 tests/b;
touch -t 201412101830.55 tests/c;
touch -t 201411101830.55 tests/D;
touch -t 202011091830.55 tests/E;
touch -t 202012091730.55 tests/f;
touch -t 202012101729.55 tests/g;
touch -t 902012101729.55 tests/h;
./$1 -1rt tests 2>&1 > .result/r1 2>&1;
ls -1rt tests 2>&1 > .result/r2 2>&1;
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
	echo $red"Test "$nb_test": [ft_ls -1rt] harder"$pos$cross$clear;
else
	((success+=1));
	echo $green"Test "$nb_test": [ft_ls -1rt] harder"$pos$tick$clear;
fi
rm -rf tests;

mkdir -p tests;
touch -t 200012101830.55 tests/a;
touch -t 201412101830.55 tests/b;
ln tests/b tests/d;
ln -s tests/c tests/e;
ln -s tests/a tests/f;
touch -t 4212101830.55 tests/c;
./$1 -1rt tests > .result/r1 2>&1;
ls -1rt tests > .result/r2 2>&1;
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
	echo $red"Test "$nb_test": Test with symlink files"$pos$cross$clear;
else
	((success+=1));
	echo $green"Test "$nb_test": Test wit symlink files"$pos$tick$clear;
fi
rm -rf tests;

mkdir -p tests/level1{1..2}/level2{1..2}/level3{1..2};
touch -t 201212101830.55 tests/lvl1;
touch -t 201212101830.55 tests/level11/lvl11;
touch -t 201212101830.55 tests/level11/level21/lvl21;
touch -t 201212101830.55 tests/level11/level21/level31/lvl21;
./$1 -1rtR > .result/r1 2>&1;
ls -1rtR > .result/r2 2>&1;
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
	echo $red"Test "$nb_test": Recursive with multiple dir"$pos$cross$clear;
else
	((success+=1));
	echo $green"Test "$nb_test": Recursive with multiple dir"$pos$tick$clear;
fi
rm -rf tests;

printf $Byellow"\nEnd of reverse option t tests\n"$clear;
if [ $success -eq $nb_test ]
then
	echo $green"Congratulation ! You passed all the tests."$clear;
else
	printf $cyan"%d test succeed, " "$success";
	((success= $nb_test - $success));
	printf "%d test failed\n"$clear "$success";
fi
rm -rf .result
