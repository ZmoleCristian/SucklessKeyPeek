#!/bin/bash

infile="template_wood.png"
textfile="text"
outfile="output.jpg"
convert="/usr/bin/convert"

cols=4
margin=40
fontsize=22
row_margin=12
fontcolor="white"

img_dims=$(identify -format "%wx%h" "$infile")
img_width=$(echo "$img_dims" | cut -dx -f1)
img_height=$(echo "$img_dims" | cut -dx -f2)
col_width=$(( (img_width - (cols + 1) * margin) / cols ))
col_height=$(( img_height - 2 * margin ))

# Copy input image to output
cp "$infile" "$outfile"


# Fill columns with text
col=0
line_height=$((fontsize + row_margin))
y=$(( margin ))
while read -r line; do
    x=$(( margin + col * (col_width + margin) ))
    if [[ $line == *"@"* ]]; then
        fontcolor=$(echo $line | cut -d'@' -f2)
        line=$(echo $line | cut -d'@' -f1)
    fi
    
    if [[ $line == \#* ]]; then
        line=${line#\#}
        header_font=$((fontsize * 3 /2))
            $convert "$outfile" -background none -fill "$fontcolor" -weight Bold -pointsize "$header_font" -size "${col_width}x${col_height}" -gravity NorthWest caption:"$line" -geometry +$x+$y -composite "$outfile"
        else
            $convert "$outfile" -background none -fill "$fontcolor" -weight Bold -pointsize "$fontsize" -size "${col_width}x${col_height}" -gravity NorthWest caption:"$line" -geometry +$x+$y -composite "$outfile"
    fi
    y=$((y + line_height))

    #Reset to default Color
    fontcolor="white"
    # Move to next column when the bottom is reached
    if ((y + line_height > img_height - margin)); then
        y=$(( margin ))
        col=$((col + 1))
    fi

    # Stop when reaching the last column
    if (($((col / cols)) >= 1)); then
        break
    fi
done < "$textfile"

setbg output.jpg
