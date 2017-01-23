#!/bin/bash

cd /etc/puppetlabs/puppet/modules
Module=motd
mkdir -p ${Module}/manifests
mkdir -p ${Module}/examples
mkdir -p ${Module}/files
mkdir -p ${Module}/templates
mkdir -p ${Module}/lib
mkdir -p ${Module}/facts.d
mkdir -p ${Module}/spec
mkdir -p ${Module}/tests

cd $Module
echo "This is my MOTD file" >files/motd

echo "class motd {">>manifests/init.pp
echo "        file { \"/etc/motd\":">>manifests/init.pp
echo "                ensure => 'file',">>manifests/init.pp
echo "                source => \"puppet:///modules/motd/motd\",">>manifests/init.pp
echo "        }">>manifests/init.pp
echo "}">>manifests/init.pp

echo "include motd" > tests/init.pp
