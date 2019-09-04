# ft_ls-checker

### A test runner for 42's ft_ls project.

#### Running tests:
To run tests, just run the set of test you want, or `all_test.sh` if you want to test them all, and give the path of your `ft_ls`
as first argument.

Ex: `./all_test.sh path/to/your/ft_ls`

If you want to print the differences between your output and `ls` output just add the letter `p` as second argument.

Ex: `./basic_test.sh path/to/your/ft_ls p`

#### Adding tests:
To add a new set of test, do `cp custom_test.sh name_of_new_test.sh` and edit your new test file following the instructions.
If you want to add a new test in an exiting set, just copy an existing test in the set an edit it following the instructions in `custom_test.sh`.
