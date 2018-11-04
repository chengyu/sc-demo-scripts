#!/bin/bash

DIRS0="ndn-cxx"
DIRS1="NFD"
DIRS2="repo-ng"
DIRS3="NLSR" # need to figure out the version 0.3.1
DIRS4="ChronoSync" # need to figure out the version with 0.5.0: 36eb3edb8169bdc345490128b80002b204f026e5
DIRS5="ndn-atmos" # need to figure out the version with 0.5.0: 36eb3edb8169bdc345490128b80002b204f026e5

release="NONE"
CLEAN="FALSE"

while getopts "h?cr:" opt; do
    case "$opt" in
    h|\?)
        echo "[-h] Print help messages"
        echo "[-r] Release version"
        echo "[-c] Clean repo"
        exit 0
        ;;
    r)  release=$OPTARG
        ;;
    c)  CLEAN="TRUE"
        ;;
    esac
done

shift $((OPTIND-1))

[ "$1" = "--" ] && shift

CWD=`pwd`

for d in $DIRS0
do
  pushd $d

  if [ $release != "NONE" ]; then
    echo "Checkouting to $DIRS0-$release"
    git checkout $DIRS0-$release -b $release
  fi

  if [ $CLEAN = "TRUE" ]; then
    echo "Cleaning $d"
    sudo ./waf uninstall
    ./waf clean
    ./waf distclean
  else
    echo "Building $d"
    ./waf configure
    ./waf 
    sudo ./waf install
  fi

  popd

done 

for d in $DIRS1
do
  pushd $d

  if [ $release != "NONE" ]; then
    echo "Checkouting to $DIRS1-$release"
    git checkout $DIRS1-$release -b $release
  fi

  if [ $CLEAN = "TRUE" ]; then
    echo "Cleaning $d"
    sudo ./waf uninstall
    ./waf clean
    ./waf distclean
  else
    echo "Building $d"
    ./waf configure
    ./waf 
    sudo ./waf install
  fi

  popd
done 

for d in $DIRS2
do
  pushd $d

  if [ $release != "NONE" ]; then
	  echo "Checkouting to 959c5b9740cec055def1347be8cb845eec1118af (0.5.0)"
    git checkout 959c5b9740cec055def1347be8cb845eec1118af -b 0.5.0
  fi

  if [ $CLEAN = "TRUE" ]; then
    echo "Cleaning $d"
    sudo ./waf uninstall
    ./waf clean
    ./waf distclean
  else
    echo "Building $d"
    ./waf configure
    ./waf 
    sudo ./waf install
  fi

  popd
done 

for d in $DIRS3
do
  pushd $d

  if [ $release != "NONE" ]; then
    echo "Checkouting to $DIRS3-0.3.1"
    git checkout $DIRS3-0.3.1 -b 0.3.1
  fi

  if [ $CLEAN = "TRUE" ]; then
    echo "Cleaning $d"
    sudo ./waf uninstall
    ./waf clean
    ./waf distclean
  else
    echo "Building $d"
    ./waf configure
    ./waf 
    sudo ./waf install
  fi

  popd
done 

for d in $DIRS4
do
  pushd $d

  if [ $release != "NONE" ]; then
    echo "Checkouting to $DIRS4-0.3.0"
    git checkout 0.3.0 -b 0.3.0
  fi

  if [ $CLEAN = "TRUE" ]; then
    echo "Cleaning $d"
    sudo ./waf uninstall
    ./waf clean
    ./waf distclean
  else
    echo "Building $d"
    ./waf configure
    ./waf 
    sudo ./waf install
  fi

  popd
done 

for d in $DIRS5
do
  pushd $d

  if [ $CLEAN = "TRUE" ]; then
    echo "Cleaning $d"
    sudo ./waf uninstall
    ./waf clean
    ./waf distclean
  else
    echo "Building $d"
    ./waf configure --with-log4cxx
    ./waf 
    sudo ./waf install
  fi

  popd
done 


