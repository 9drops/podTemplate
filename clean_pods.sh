lines=`cat clean.list`
rm -rf *.xcworkspace
for line in $lines ;do
    echo "$line:$line"
    pod cache clean $line
    rm -rf "Pods/$line"
done
