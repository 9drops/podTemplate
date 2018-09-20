#! /bin/bash

function get_version() {
  pod_version=`awk -F'='  '/s.version *=/ {gsub(/ *|"/,"", $2);print $2; }' *.podspec`
  return $version
}

get_version
