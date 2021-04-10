#! /usr/bin/env bash

          set -x
          ls -l ${GITHUB_WORKSPACE}/gemstone/gs
          pushd ${GITHUB_WORKSPACE}/gemstone/gs
            vers=3.6.0
            name=GemStone64Bit${vers}-x86_64.Linux
            zipfile=${name}.zip
            curl -O -s -S https://downloads.gemtalksystems.com/pub/GemStone64/${vers}/$zipfile
            unzip -q $zipfile
            ln -s $name product
            curl  -L -O -s -S "https://github.com/dalehenrich/superDoit/releases/download/v0.1.0/${vers}_extent0.solo.dbf.gz"
            gunzip --stdout ${vers}_extent0.solo.dbf.gz > extent0.solo.dbf
            chmod -w extent0.solo.dbf
          popd
          ls -l ${GITHUB_WORKSPACE}/gemstone/gs
          . ${GITHUB_WORKSPACE}/bin/defPath.env
          simple.solo
