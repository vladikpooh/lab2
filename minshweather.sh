#!/bin/bash
while [[ true ]]
do
city=$(curl http://pogoda.tut.by/city/minsk -silent | grep '<a href="" class="dotted" data-weathercode="26850">' | sed -e's/<\/h1>//g' |  sed -e's/<h1>//g' | sed -e's/<\/a>//g' | sed -e's/<a href="" class="dotted" data-weathercode="26850">//g' | sed -e's/<div class="b-modes m-media">//g' | sed -e's/<ul class="b-modes-list">//g' | sed -e's/<li class="b-mode__li">//g')
echo $city
temp=$(curl http://pogoda.tut.by/city/minsk -silent | sed -nre '/h1/,/fcurrent-descr/p' | grep 'temp-i' | sed -e's/<span class="temp-i">//g' | sed -e's/<\/div>//g' | sed -e's/<\/span>//g' | sed -e's/&deg;//g')
echo $temp
sleep $(cat $file config.ini)
done
