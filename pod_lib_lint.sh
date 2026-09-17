if [[ $# < 1 ]] ;then
    echo -e "Usage:$0 podname\nEg:$0 RTLog"
    exit 1
fi

pod lib lint $1.podspec --allow-warnings --verbose --platforms=ios --sources='git@github.com:9drops/privatePods.git,https://cdn.cocoapods.org/'
