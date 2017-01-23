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

