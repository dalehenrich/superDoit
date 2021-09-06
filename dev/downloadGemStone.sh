#! /usr/bin/env bash

vers="$1"
echo "installing GemStone version $vers in `pwd`"
set -x
if [ "$PLATFORM" = "macos-10.15" ] ; then
	name=GemStone64Bit${vers}-i386.Darwin
  dmgfile=${name}.dmg
  curl -O -s -S https://downloads.gemtalksystems.com/pub/GemStone64/${vers}/$dmgfile
  attach_result=`hdiutil attach -plist $dmgfile`
  attach_device=`echo $attach_result | xpath "//dict/array/dict[true]/key[.='dev-entry']/following-sibling::string[1]/text()" 2>/dev/null`
  attach_path=`echo $attach_result | xpath "//dict/array/dict[true]/key[.='mount-point']/following-sibling::string[1]/text()" 2>/dev/null`
  cp -R "${attach_path}/${gsvers}/${name}" .
 	hdiutil detach ${attach_device}
	export GEMSTONE="`pwd`/$name"
else
  name=GemStone64Bit${vers}-x86_64.Linux
  zipfile=${name}.zip
  curl -O -s -S https://downloads.gemtalksystems.com/pub/GemStone64/${vers}/$zipfile
  unzip -q $zipfile
	export GEMSTONE="`pwd`/$name"
fi 
