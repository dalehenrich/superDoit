#! /usr/bin/env bash
vers="$1"
${GITHUB_WORKSPACE}/dev/downloadGemStone.sh $vers
if [ "$PLATFORM" = "macos-10.15" ] ; then
	ln -s GemStone64Bit${vers}-i386.Darwin product
else
	ln -s GemStone64Bit${vers}-x86_64.Linux product
fi``
