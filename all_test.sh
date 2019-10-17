#!/bin/sh

if [ -z $1 ]
then
	echo "$1 executable is missing"
	echo "Usage: ./all_test.sh path/to/ft_ls [p]"
	exit 1
fi

./basic_test.sh $1 $2
echo ""
./opt_l_test.sh $1 $2
echo ""
./opt_R_test.sh $1 $2
echo ""
./opt_a_test.sh $1 $2
echo ""
./opt_t_test.sh $1 $2
echo ""
./reverse_basic_test.sh $1 $2
echo ""
./reverse_opt_l.sh $1 $2
echo ""
./reverse_opt_R.sh $1 $2
echo ""
./reverse_opt_a.sh $1 $2
echo ""
./reverse_opt_t.sh $1 $2
echo ""
./symdir_test.sh $1 $2
echo ""
./hyphen_test.sh $1 $2
echo ""
./mix_test.sh $1 $2
