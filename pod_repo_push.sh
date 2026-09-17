if [[ $# < 2 ]] ;then
    echo "Usage:$0 podname localRepoName"
    exit 1
fi

pod repo push $2 $1.podspec --allow-warnings --verbose --sources='git@github.com:9drops/privatePods.git,https://cdn.cocoapods.org/'
