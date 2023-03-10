#! /usr/bin/env bash

vers=3.6.5

PLATFORM="`uname -sm | tr ' ' '-'`"
case "$PLATFORM" in
    Darwin-arm64)
			dlname="GemStone64Bit${vers}-arm64.Darwin"
			format=dmg
			;;
    Darwin-x86_64)
			dlname="GemStone64Bit${vers}-i386.Darwin"
			format=dmg
			;;
		Linux-x86_64)
			dlname="GemStone64Bit${vers}-x86_64.Linux"
			format=zip
      ;;
		*)
			echo "This script should only be run on Mac (Darwin-i386 or Darwin-arm64), or Linux (Linux-x86_64) ). The result from \"uname -sm\" is \"`uname -sm`\""
			exit 1
      ;;
esac
superDoit="`dirname $0`/.."
products=$superDoit/gemstone/products
echo "Downloading ${dlname} to `pwd` for $PLATFORM"
cd $products
curl  -L -O -S "https://ftp.gemtalksystems.com/GemStone64/${vers}/${dlname}.${format}"
case "$format" in
	zip)
		unzip ${dlname}.zip
		;;
	dmg)
		VOLUME=`hdiutil attach ${dlname}.dmg | grep Volumes | awk '{print $3}'`
		cp -rf $VOLUME/${dlname} .
		hdiutil detach $VOLUME
		;;
esac
cd ../solo
cp ../products/${dlname}/bin/extent0.rowan.dbf extent0.solo.dbf
chmod -w extent0.solo.dbf
cp ../products/${dlname}/bin/extent0.dbf extent0.dbf
chmod -w extent0.dbf
ln -s ../products/${dlname} product
