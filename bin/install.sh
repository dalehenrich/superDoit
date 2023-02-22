#! /usr/bin/env bash

products="`dirname $0`/.."
cd $products
curl  -L -O -s -S "https://ftp.gemtalksystems.com/GemStone64/3.6.5/GemStone64Bit3.6.5-x86_64.Linux.zip"
unzip GemStone64Bit3.6.5-x86_64.Linux.zip
cd ../solo
cp ../products/GemStone64Bit3.6.5-x86_64.Linux/bin/extent0.rowan.dbf extent0.solo.dbf
chmod -w extent0.solo.dbf
cp ../products/GemStone64Bit3.6.5-x86_64.Linux/bin/extent0.dbf extent0.dbf
chmod -w extent0.dbf
ln -s ../products/GemStone64Bit3.6.5-x86_64.Linux product
