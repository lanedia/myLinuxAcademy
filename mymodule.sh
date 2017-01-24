#!/bin/bash

if [ -d 
cd /etc/puppetlabs/puppet/modules
if [ $# -eq 1 ]; then
	Module=$1
else
	Module=motd
fi
cd $Module
mkdir -p ${Module}/manifests
mkdir -p ${Module}/examples
mkdir -p ${Module}/files
mkdir -p ${Module}/templates
mkdir -p ${Module}/lib
mkdir -p ${Module}/facts.d
mkdir -p ${Module}/spec
mkdir -p ${Module}/tests

echo "This is my $Module file" >files/$Module

echo "class $Module {">>manifests/init.pp
echo "        file { \"/etc/$Module\":">>manifests/init.pp
echo "                ensure => 'file',">>manifests/init.pp
echo "                source => \"puppet:///modules/$Module/$Module\",">>manifests/init.pp
echo "        }">>manifests/init.pp
echo "}">>manifests/init.pp

echo "include $Module" > tests/init.pp
