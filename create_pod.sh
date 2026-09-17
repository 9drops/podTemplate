#! /bin/bash

if [[ $# !=  1 ]] ;then
    echo "Usage:$0 podname"
    exit 1
fi

podname=$1

/usr/bin/expect<<EOF
# if { $argc != 1 } {
#     puts "Usage:$argv0 podname"
#     exit 1
# }

# set podname [lindex $argv 0]

puts "podname:$podname"

set timeout -1
spawn pod lib create $podname --template-url=https://github.com/9drops/podTemplate.git

expect platform
send "iOS\r"

expect language
send "ObjC\r"

expect demo
send "Yes\r"

expect frameworks
send "None\r"

expect "view based testing"
send "No\r"

expect prefix
send "RT\r"

interact

expect EOF
EOF
