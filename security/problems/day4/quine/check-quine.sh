file1=$1
file2=$2
diff $file1 $file2 > /dev/null 2>&1
error=$?
if [ $error -eq 2 ]
then
   echo "There was something wrong with the diff command"
elif [ $error -eq 1 ]
then
   echo "$file1 and $file2 differ. Quine check failed."
else
   echo "$file1 and $file2 are the same file. Quine check succeeded."
fi
