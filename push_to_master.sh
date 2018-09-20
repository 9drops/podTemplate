if [[ $# < 1 ]] ;then
    echo -e "\033[44;37;5mUsage:$0 commitMessage\033[0m"
    exit 1
fi

. ./get_pod_version_in_podspec.sh
tag=$pod_version
message=${1:-Update Repository}

function push_to_git_master() {
    echo "tag:$tag message:$message"
    git add -A
    git commit -m "\"$message\""
    git tag -d $tag
    git push origin :refs/tags/$tag
    git tag $tag
    git push --tags
    git push origin master
}

push_to_git_master $tag $message


