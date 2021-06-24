#!/usr/bin/env bash

# ./flicker-diff.sh pdf-name
# ./flicker-diff.sh IBM_Systemi_Using_Python_ES

# todo
# directory structure
# get number of pages
# first page showing metrics
# document meta data
# table of contents
# valid HTML5
# other view options like side by side or overlay markers
# command line args

#fullfilename="$1"
#filename=${fullfilename%%.*}
filename="$1"
echo "$filename"

# change directory
cd ../assets/pdf || exit

# make directories if not exist
mkdir -p old/images/"$filename"
mkdir -p new/images/"$filename"
mkdir -p flicker/"$filename"

# create a single page png for every page in the PDF
pdftocairo -png old/"$filename".pdf old/images/"$filename"/"$filename"
pdftocairo -png new/"$filename".pdf new/images/"$filename"/"$filename"

# Fix to get number or pages ???
for i in {01..03}; do
  # create the difference between each png page and generate a flicker based GIF image difference
  convert -delay 50 old/images/"$filename"/"$filename"-"$i".png new/images/"$filename"/"$filename"-"$i".png flicker/"$filename"/"$filename"-"$i"-difference-flicker.gif
done

# zero file
: >flicker-diff-webpage.html

# Open file descriptor (fd) 3 for read/write on a HTML file.
exec 3<>flicker-diff-webpage.html

# create web page header
echo "<!doctype html><html><head><meta charset=\"UTF-8\"></head><body>" >&3

# loop over flicker GIFs
for f in flicker/"$filename"/*; do
  echo "<img src='$f' alt='$f'>" >&3
done
# finish HTML page
echo "</body></html>" >&3

# close fd 3
exec 3>&-
