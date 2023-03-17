#! /usr/bin/env bash

set -ex

gemstoneversion=3.6.5

PLATFORM="`uname -sm | tr ' ' '-'`"
case "$PLATFORM" in
   Darwin-arm64)
		dlname="GemStone64Bit${gemstoneversion}-arm64.Darwin"
		format=dmg
		;;
   Darwin-x86_64)
		dlname="GemStone64Bit${gemstoneversion}-i386.Darwin"
		format=dmg
		;;
	Linux-x86_64)
		dlname="GemStone64Bit${gemstoneversion}-x86_64.Linux"
		format=zip
     ;;
	*)
		echo "This script should only be run on Mac (Darwin-i386 or Darwin-arm64), or Linux (Linux-x86_64) ). The result from \"uname -sm\" is \"`uname -sm`\""
		exit 1
     ;;
esac

superDoit="`dirname $0`/.."
products=$superDoit/gemstone/products
cd $products

needsDownload="true"
if [ $# -eq 1 ]; then
	commonProducts="$1"
	if [ -d "${commonProducts}/${dlname}" ] ; then
		echo "Making symbolic link in `pwd` to ${commonProducts}/${dlname} for $PLATFORM"
		ln -s "${commonProducts}/${dlname}" .
		needsDownload="false"
	fi
fi
if [ "$needsDownload" = "true" ] ; then
	echo "Downloading ${dlname} to `pwd` for $PLATFORM"
	curl  -L -O -S "https://ftp.gemtalksystems.com/GemStone64/${gemstoneversion}/${dlname}.${format}"
	case "$format" in
		zip)
			unzip ${dlname}.zip
			;;
		dmg)
			VOLUME=`hdiutil attach ${dlname}.dmg | grep Volumes | awk '{print $3}'`
			cp -rf ${VOLUME}/${dlname} .
			hdiutil detach $VOLUME
			;;
	esac
fi

cd ../solo
echo "Making symbolic link in `pwd` for $dlname" 
ln -s ../products/${dlname} product

echo "Copying extent0.rowan.dbf and extent0.dbf"
cp ../products/${dlname}/bin/extent0.rowan.dbf extent0.solo.dbf
chmod -w extent0.solo.dbf
cp ../products/${dlname}/bin/extent0.dbf extent0.dbf
chmod -w extent0.dbf
