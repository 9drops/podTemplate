if [[ $# < 2 ]] ;then
    echo "Usage:$0 podname localRepoName"
    exit 1
fi

pod repo push $2 $1.podspec --allow-warnings --verbose --sources=http://192.168.0.34/iOSGroup/iOSPods.git,https://github.com/CocoaPods/Specs.git
