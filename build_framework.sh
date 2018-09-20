if [[ $# < 1 ]] ;then
    echo "Usage:$0 podname"
    exit 1
fi

. ./get_pod_version_in_podspec.sh
version=$pod_version
podname=$1
#clean pod cache
pod cache clean $podname

#--configuration = Debug, Debug模式
pod package "$podname.podspec" --dynamic  --spec-sources=http://192.168.0.34/iOSGroup/iOSPods.git,https://github.com/CocoaPods/Specs.git   --force  --verbose
framework="$podname-$version/ios/$podname.framework"
if test -d $framework ;then
    productsDir="$podname/Products"
    frameworkDst="$productsDir/$podname.framework"
	if ! test -d $productsDir ;then
		mkdir $productsDir
    elif test -d $frameworkDst ;then
        rm -rf $frameworkDst
	fi

	mv $framework $productsDir
	rm -rf "$podname-$version"
fi

