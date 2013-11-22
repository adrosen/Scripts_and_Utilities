#!/bin/bash
for pkg in `dpkg --get-selections | egrep -v deinstall | awk '{print $1}' | egrep -v '(dpkg|apt)'` ; do apt-get -y install --reinstall $pkg ; done
