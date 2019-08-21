#!/bin/sh
name=`echo $1 | sed 's/\.tex$//' | xargs basename`

TMPDIR=tmp

[ ! -d $TMPDIR ] && mkdir $TMPDIR

for f in *.tex; do
	TMPFILE_UTF8="$TMPDIR/$f.utf8"
	TMPFILE_EUC="$TMPDIR/$f"
	sed -e s/。/．/g $f \
		| sed -e s/、/，/g \
		| sed -e s/（/\(/g \
		| sed -e s/）/\)/g \
		| sed -e s/１/1/g \
		| sed -e s/２/2/g \
		| sed -e s/３/3/g \
		| sed -e s/４/4/g \
		| sed -e s/５/5/g \
		| sed -e s/６/6/g \
		| sed -e s/７/7/g \
		| sed -e s/８/8/g \
		| sed -e s/９/9/g \
		| sed -e s/０/0/g \
		| sed -e "s/--MAKE-DATE--/Generated at `LANG=C date`/g" \
		| sed -e "s/\\(\\\\includegraphics\\[.*\\]\\){\\(.*\\)}/\\1{\\.\\.\\/\\2}/g" \
		> "$TMPFILE_UTF8"
		# cat "$TMPFILE_UTF8" > "$TMPFILE_EUC"
		cat "$TMPFILE_UTF8" | nkf -e > "$TMPFILE_EUC"
		# cat "$TMPFILE_EUC" | nkf -w | diff -ubB - "$TMPFILE_UTF8" 1>&2
		# if [ $? -ne 0 ]; then
		# 	echo "ERROR: Encoding conversion error! ($f)" 1>&2
		# 	exit 1
		# fi
		rm "$TMPFILE_UTF8"
done
cp include/* $TMPDIR/

cd $TMPDIR
nkf -e --overwrite *.sty
platex -kanji=euc -interaction=nonstopmode $name.tex
# /usr/bin/platex -kanji=euc -interaction=nonstopmode $name.tex

#cp $name.log ../
#cp $name.dvi ../
