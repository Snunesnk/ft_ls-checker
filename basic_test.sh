#!/bin/sh

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

cp $1 ./
mkdir -p result;
echo "=========================== Basic tests ===========================\n";
./ft_ls -1 > result/r1 2>&1;
ls -1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": [ft_ls -1]"$pos$cross$clear;
else
	((success+=1));
	echo $green"Test "$nb_test": [ft_ls -1]"$pos$pos$tick$clear;
fi

./ft_ls -1 ../ > result/r1 2>&1;
ls -1 ../ > result/r2 2>&1;
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
	echo $red"Test "$nb_test": [ft_ls -1 ../]"$pos$cross$clear;
else
	((success+=1));
	echo $green"Test "$nb_test": [ft_ls -1 ../]"$pos$tick$clear;
fi

mkdir -p dir1 dir2 dir3;
./ft_ls -1 dir1 dir2 dir3 > result/r1 2>&1;
ls -1 dir1 dir2 dir3 > result/r2 2>&1;
diff result/r1 result/r2 > result/r3;
	((nb_test+=1));
if [ -s result/r3 ]
then
	echo $cyan"\n==========\nft_ls:"$clear;
	cat -e result/r1;
	echo $cyan"==========\nls:"$clear;
	cat -e result/r2;
	if [ -n $2 ] && [ "ft_ls" == "p" ]
	then
		echo "\nDiff:";
		cat result/r3;
		echo "";
	fi
	echo $red"Test "$nb_test": [ft_ls -1 dir1 dir2 dir3]"$pos$cross$clear;
else
	((success+=1));
	echo $green"Test "$nb_test": [ft_ls -1 dir1 dir2 dir3]"$pos$tick$clear;
fi
rm -rf dir1 dir2 dir3;

mkdir -p dir1 dir2 dir3;
touch  dir1/file1 dir2/file2 dir3/file3;
./ft_ls -1 dir1 dir2 dir3 > result/r1 2>&1;
ls -1 dir1 dir2 dir3 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": [ft_ls -1 dir1 dir2 dir3]"$pos$cross$clear;
else
	((success+=1));
	echo $green"Test "$nb_test": [ft_ls -1 dir1 dir2 dir3]"$pos$tick$clear;
fi
rm -rf dir1 dir2 dir3;

mkdir -p empty_dir;
./ft_ls empty_dir > result/r1 2>&1;
ls empty_dir > result/r2 2>&1;
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
	echo $red"Test "$nb_test": [ft_ls empty_dir]"$pos$cross$clear;
else
	((success+=1));
	echo $green"Test "$nb_test": [ft_ls empty_dir]"$pos$tick$clear;
fi
rm -rf empty_dir;

mkdir -p dir;
touch dir/file;
./ft_ls dir/file > result/r1 2>&1;
ls dir/file > result/r2 2>&1;
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
	echo $red"Test "$nb_test": test on a single file"$pos$cross$clear;
else
	((success+=1));
	echo $green"Test "$nb_test": test on a single file"$pos$tick$clear;
fi
rm -rf dir;

mkdir -p dir;
touch dir/file1 dir/file2 dir/file3;
./ft_ls -1 dir/file1 dir/file2 dir/file3 > result/r1 2>&1;
ls -1 dir/file1 dir/file2 dir/file3 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": multi files test"$pos$cross$clear;
else
	((success+=1));
	echo $green"Test "$nb_test": multi files test"$pos$tick$clear;
fi
rm -rf dir;

rm -rf result;
printf $Byellow"\nEnd of basic tests\n"$clear;
if [ $success -eq $nb_test ]
then
	echo $green"Congratulation ! You passed all the tests."$clear;
else
	printf $cyan"%d test succeed, " "$success";
	((success=$nb_test-$success));
	printf "%d test failed\n"$clear "$success";
fi
