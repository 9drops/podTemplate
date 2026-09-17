# 前提
1、创建远程repo版本库仓库：privatePods

2、将本地仓库和远程仓库关联
pod repo add privatePods git@github.com:9drops/privatePods.git


# 目录下的脚本
		
* get_pod_version_in_podspec.sh	- 获取 *.podspec中version的值（git tag版本），供其他脚本使用

* pod_lib_lint.sh     - 封装pod lib lint命令， 此脚本使用本地源码编译目标文件

* pod_repo_push.sh    - 封装pod repo push命令，推送本地podspec到repo版本库，此脚本使用git repository上对应tag版本源码编译目标文件

* push_to_git.sh   - 推送*.podspec中version的值（git tag版本）git repository，此脚本有一个必选参数message:git 提交消息

* create_pod.sh - 一键创建包含测试项目的pod,脚本自带输入pod lib create对话选项，可修改定制

# 使用此模版创建自己的pod
1. 用create_pod.sh脚本创建自己的podname
2. 拷贝podTemplate/下所有shell脚本到podname目录下，将podTemplate.podspec重命名为podname.podspec
3. 修改podname.podspec满足实际需求
4. 将用于创建pod的源码、资源文件分别放到podname/Classes和podname/Assets下, 生成的framework路径设定为podname/Products
5. 执行pod_lib_lint.sh脚本，如果成功，执行pod_repo_push.sh脚本,失败则解决问题。


# podTemplate

[![CI Status](https://img.shields.io/travis/9drops/podTemplate.svg?style=flat)](https://travis-ci.org/9drops/podTemplate)
[![Version](https://img.shields.io/cocoapods/v/podTemplate.svg?style=flat)](https://cocoapods.org/pods/podTemplate)
[![License](https://img.shields.io/cocoapods/l/podTemplate.svg?style=flat)](https://cocoapods.org/pods/podTemplate)
[![Platform](https://img.shields.io/cocoapods/p/podTemplate.svg?style=flat)](https://cocoapods.org/pods/podTemplate)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

podTemplate is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'podTemplate'
```

## Author

9drops, zhanbz@gmail.com

## License

podTemplate is available under the MIT license. See the LICENSE file for more info.
