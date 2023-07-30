for file in $(find . -type f -name "*.c") 
do 
    prog_name=$(echo $file | cut -d'/' -f2 | cut -d'.' -f1)
    trimmedName=`echo $file | cut -d'/' -f2 `
    gcc -o $prog_name $file  2>/dev/null 
    if [ -f $prog_name ] 
    then 
        ans=$(./$prog_name)
        anskey=20
        if [ $ans -eq $anskey ] 
            then 
                ans=10
            else 
                ans=7
            fi
    else 
        ans=5
    fi
    printf "%s \t%s\n" $trimmedName $ans
done