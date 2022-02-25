#!/bin/bash

file="sandbox-workspace.json"

while [ "$1" != "" ]; do
    case $1 in
        -f | --file )          shift
                               file=$1
                               ;;
        -p | --pat )           shift
                               pat=$1
                               ;;  
       * )                     exit
    esac
    shift
done

ibmcloud schematics workspace new -f $file -g $pat --output json 
