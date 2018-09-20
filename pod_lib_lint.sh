if [[ $# < 1 ]] ;then
    echo -e "Usage:$0 podname\nEg:$0 TXLog"
    exit 1
fi

pod lib lint $1.podspec --allow-warnings --verbose --sources=http://192.168.0.34/iOSGroup/iOSPods.git,https://github.com/CocoaPods/Specs.git
