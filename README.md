# 目录下的脚本
		
* get_pod_version_in_podspec.sh	- 获取 *.podspec中version的值（git tag版本），供其他脚本使用

* pod_lib_lint.sh     - 封装pod lib lint命令， 此脚本使用本地源码编译目标文件

* pod_repo_push.sh    - 封装pod repo push命令，推送本地podspec到repo版本库，此脚本使用git repository上对应tag版本源码编译目标文件

* build_framework.sh  - 封装pod package --dynamic 命令, 此脚本使用git repository上对应tag版本源码生成framework动态库，此脚本执行前后都需调用push_to_master.sh命令将本地源码上传到git repository

* push_to_master.sh   - 推送*.podspec中version的值（git tag版本）git repository，此脚本有一个必选参数message:git 提交消息

* create_pod.sh - 一键创建包含测试项目的pod,脚本自带输入pod lib create对话选项，可修改定制

* clean_pods.sh - pod库framework、源码切换前清除操作

* clean.list   - 需要清除的pod清单



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
