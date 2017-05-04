#!/bin/bash
fail() {
  echo $1

}
[[ -d $1 ]] || fail "I need the exercise to execute"
images="puppet-demo:centos6 puppet-demo:centos7 puppet-demo:ubuntu14.04"
for i in $images; do
  docker run --rm -ti -v ${1}:/opt/puppet $i puppet apply --modulepath /opt/puppet/modules:/etc/puppet/modules /opt/puppet/apply.pp
done
