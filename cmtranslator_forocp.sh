#!/bin/bash

echo "Please enter your openshift url:"
read INPUT_OCP_URL

oc login $INPUT_OCP_URL

echo "Please Enter your project name:"
read INPUT_PROJECT_NAME

oc project $INPUT_PROJECT_NAME



for i in $(oc get cm |awk {'print$1'})
do
 oc describe cm $i > $i.txt
 cat $i.txt |grep -B 1 "\-\-\-\-" |grep : > item.txt
 sed -i 's/----/END/g'  $i.txt
 sed -i 's/Events:  <none>/END/g'  $i.txt

 for f in $(cat item.txt |tr ":" " ")
 do
  startval=$(cat $i.txt |grep -A 1 $f |tail -1)
  deleteitem=$(echo $f)
  sed "1,/$deleteitem/d" $i.txt > file.tmp
  cat file.tmp > $i.txt
  mkdir -p /Project/"$INPUT_PROJECT_NAME"_configmaps/$i/
  sed -n "/^$startval$/,/^END$/p"  $i.txt  | awk '!/END/'  > /Project/"$INPUT_PROJECT_NAME"_configmaps/$i/$f
 done
done
