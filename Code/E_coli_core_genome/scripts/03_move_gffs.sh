#!/usr/bin/env bash

mkdir out_data/gffs

for file in $(find out_data/annotations -name "*.gff")
do
  arrIN=(${file//\// })
  bn=${arrIN[2]}
  cp ${file} out_data/gffs/${bn}.gff
done