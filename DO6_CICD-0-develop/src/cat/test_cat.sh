declare -a arr=( "-e" "-n" "-t" "-e" "-u")
gcc s21_cat.c -o s21_cat.o
gcc test_cat.c -o test_cat.o

for i in "${arr[@]}"
do
cat "$i" file >> file1
./s21_cat.o "$i" file >> file2
a=`./test_cat.o`
echo "$a"
if [[ $a == "ERROR" ]]
then
  exit 1
else
  echo "$a"
fi
rm file1 file2
done
exit 0

# for i in "${arr[@]}"
# do
# cat "$i" microfile file >> file1
# ./s21_cat.o "$i" microfile file >> file2
# echo "$i microfile file"
# ./test_cat.o
# rm file1 file2
# done