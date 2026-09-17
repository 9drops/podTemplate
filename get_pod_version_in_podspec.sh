#! /bin/bash

function get_version() {
  local podspec
  podspec=$(ls -1 *.podspec 2>/dev/null | head -n 1)
  if [[ -z "$podspec" ]]; then
    echo "No .podspec file found in current directory" >&2
    return 1
  fi

  pod_name=`awk -F'='  '/s\.name *=/ {gsub(/ *|"|\047/,"", $2);print $2; exit}' "$podspec"`
  pod_version=`awk -F'='  '/s\.version *=/ {gsub(/ *|"|\047/,"", $2);print $2; exit}' "$podspec"`
  # 只抓取 :git => "..." 这一段的引号内容，避免 :tag / :branch 等同一行的其它
  # key 被 `=>` 误切进结果（老实现按 `=>` 整行切分，行里出现第二个 `=>` 时就会
  # 把 ", :tag" 这类内容一起带出来）。
  pod_source_prefix=`grep -Eo ':git[[:space:]]*=>[[:space:]]*["'"'"'][^"'"'"']*["'"'"']' "$podspec" \
    | sed -E 's/.*["'"'"']([^"'"'"']*)["'"'"'].*/\1/'`

  # source 里常见 "#{s.name}"/"#{s.version}" 这类 Ruby 字符串插值写法，
  # awk/grep/sed 只会把它当普通文本抠出来，不会替换成真实值。这里用已经
  # 解析出的 pod_name/pod_version 做一次字面量替换（非正则），把插值补上，
  # 这样拿到的 URL 才能直接 git clone。
  pod_source_prefix=${pod_source_prefix//\#\{s.name\}/$pod_name}
  pod_source_prefix=${pod_source_prefix//\#\{s.version\}/$pod_version}

  echo "name:$pod_name version:$pod_version source_prefix:$pod_source_prefix"
}

get_version
