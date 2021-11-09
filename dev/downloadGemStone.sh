#! /usr/bin/env bash

vers="$1"
echo "installing GemStone version $vers in `pwd`"
# set -x
if [ "$PLATFORM" = "macos-10.15" ] ; then
  dl_format=zip
  name=GemStone64Bit${vers}-i386.Darwin
  if  [ "$vers" \> "3.5.2"  ] ;  then 
    dl_format=dmg
  fi
  dl_gss_file=${name}.${dl_format}
  curl -O -s -S https://downloads.gemtalksystems.com/pub/GemStone64/${vers}/$dl_gss_file
	case "$dl_format" in
		zip)
			unzip -q $dl_gss_file
			;;
		dmg)
  		attach_result=`hdiutil attach -plist $dl_gss_file`
		  attach_device=`echo $attach_result | xpath "//dict/array/dict[true]/key[.='dev-entry']/following-sibling::string[1]/text()" 2>/dev/null`
  		attach_path=`echo $attach_result | xpath "//dict/array/dict[true]/key[.='mount-point']/following-sibling::string[1]/text()" 2>/dev/null`
  		cp -R "${attach_path}/${gsvers}/${name}" .
 			hdiutil detach ${attach_device}
			;;
	esac
else
  name=GemStone64Bit${vers}-x86_64.Linux
  zipfile=${name}.zip
  curl -O -s -S https://downloads.gemtalksystems.com/pub/GemStone64/${vers}/$zipfile
  unzip -q $zipfile
fi 
