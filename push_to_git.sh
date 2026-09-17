if [[ $# < 1 ]] ;then
    echo -e "\033[44;37;5mUsage:$0 commitMessage\033[0m"
    exit 1
fi

. ./get_pod_version_in_podspec.sh
tag="$pod_version"
podsource="$pod_source_prefix"
podname="$pod_name"
message="${1:-Update Repository}"

function push_to_git() {
    local branch
    branch=$(git rev-parse --abbrev-ref HEAD)

    echo "origin:$podsource tag:$tag branch:$branch message:$message"

    # git remote add 只在 origin 不存在时生效；如果 origin 已经存在（哪怕是历史脏
    # 数据/错误 URL），add 会失败且不会更新它，导致后面所有 push 都用着旧的、可能
    # 是错的地址。这里改成存在则 set-url、不存在则 add，确保 origin 每次都被纠正
    # 成本次算出来的 podsource，具备自愈能力。
    if git remote get-url origin >/dev/null 2>&1; then
        git remote set-url origin "$podsource"
    else
        git remote add origin "$podsource"
    fi

    git add -A
    git commit -m "$message"

    # 本地/远程 tag 在首次推送时本来就不存在，删除操作允许失败，不应该中断脚本。
    git tag -d "$tag" 2>/dev/null || true
    git push origin ":refs/tags/$tag" 2>/dev/null || true
    git tag "$tag"
    git push --tags

    # 不再硬编码 main：远程仓库默认分支是 master 还是 main 因仓库而异，直接用
    # 当前所在分支名去推，避免 "src refspec main does not match any" 这类错误。
    git push origin "$branch"
}

push_to_git
