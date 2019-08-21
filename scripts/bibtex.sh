#!/bin/sh
name=`echo $1 | sed 's/\.tex$//' | xargs basename`

TMPDIR=tmp
cp *.bib $TMPDIR/

cd $TMPDIR

if [ -x "`which jbibtex`" ]; then
    jbibtex $@ # for ubuntu ~precise
elif [ -x "`which pbibtex`" ]; then
    nkf -e --overwrite *.bib
    pbibtex -kanji=euc $@ # for ubuntu quantal~ and OSX
else
    bibtex $@  # it may cause error
fi

#cp $name.bbl ../
#cp $name.blg ../
