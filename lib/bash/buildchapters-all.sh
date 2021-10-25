#!/bin/bash

# We want to be in the directory in which the HV etext lives.  First we need to
# remove the namespace declarations (find a better solution for that) from a
# copy of the text that we'll actually be working from.

#mss=(stein-189 k)
mss=(stein-189 bori-486-1887-91 jammu-494-ga jammu-797 jammu-495 bori-216-1875-76 bori-215-1875-76 bori-217-1875-76 bori-227-A-1882-83 bori-828-1886-72)

#ms="stein-189"
#text="hvvu"

function setvariables {
case $ms in
  stein-189)
    cantos=(01 03)
    text="hvvu"
    echo "I just did Stein 189."
    ;;
  
  bori-486-1887-91)
    cantos=(03)
    text="hv"
    echo "I just did bori-486-1887-91."
    ;;

  jammu-494-ga)
    cantos=(03)
    text="hv"
    echo "I just did jammu-494-ga."
    ;;

  jammu-797)
    cantos=(03)
    text="hv"
    echo "I just did jammu-797."
    ;;

  jammu-495)
    cantos=(03)
    text="hvvu"
    echo "I just did jammu-495."
    ;;

  bori-216-1875-76)
    cantos=(03)
    text="hv"
    echo "I just did bori-216-1875-76."
    ;;

  bori-227-A-1882-83)
    cantos=(03)
    text="hvvu"
    echo "I just did bori-227-A-1882-83."
    ;;

  bori-828-1886-72)
    cantos=(03)
    text="hvvu"
    echo "I just did bori-828-1886-72."
    ;;

  bori-486-1887-91)
    cantos=(03)
    text="hv"
    echo "I just did bori-486-1887-91."
    ;;


  k)
    cantos=(01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 prasasti)
    text ="hv"
    echo "I just did K."
    ;;

  bori-215-1875-76)
    cantos=(01 03)
    text="hv"
    echo "I just did bori-215-1875-76."
    ;;

  bori-217-1875-76)
    cantos=(03)
    text="hvvu"
    echo "I just did bori-217-1875-76."
    ;;


  *)
    echo "Something wrong."
    ;;
esac
}

function build-chapters {
for i in ${cantos[*]}
do
cd ../$i 
echo "<TEI xmlns=\"http://www.tei-c.org/ns/1.0\">"  > $text-$i-$ms.txt
xmlstarlet sel -N x="http://www.tei-c.org/ns/1.0" -t -c "//x:teiHeader" ../all/$text-all-$ms.xml >> $text-$i-$ms.txt
echo  >> $text-$i-$ms.txt
echo "  <text xml:lang=\"sa-Latn\">" >> $text-$i-$ms.txt
echo "    <body>" >> $text-$i-$ms.txt
#cat ../templates/template-beginning-$ms.xml > $text-$i-$ms.txt
xmlstarlet sel -N x="http://www.tei-c.org/ns/1.0" -t -c "//x:div[@n=\"$i\"]" ../all/$text-all-$ms.xml >> $text-$i-$ms.txt
cat ../templates/template-end.xml >> $text-$i-$ms.txt
done
}

for ms in ${mss[*]}
do
setvariables
build-chapters
done

