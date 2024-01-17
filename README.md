# SucklessKeyPeek 

A bash-generated cheatsheet wallpaper for newcomers using my DWM fork, easing the learning curve until they master the Suckless experience. 

## Features

- Takes a custom wallpaper as background
- Fills columns with text on top of background
- Custom line color with "@color" tag at the end of a line
- Generates an output JPEG
- Sets JPEG as wallpaper

## Requirements

- ImageMagick (must have `convert` installed)

## Installation

```bash
./installReq.sh
git clone https://github.com/tragdate/SucklessKeyPeek
```

No build required. Place the script in the desired directory.

## Usage

1. Set an input image file in `generator.sh` or use provided `template_wood.png` 
2. Set your parameters like `fontsize` `fontcolor` and more
3. Add/Modify your cheatsheet content in the `text` file
4. Run the script using the following command:

```bash
./generate.sh
```

4. The output image will be saved as `output.jpg` in the same directory

## Parameteres

- `cols`: number of columns
- `margin`: margin for the columns
- `fontsize`: font size for the text
- `row_margin`: row margin
- `fontcolor`: font color

## Author

🥷-[TragDate](https://tragdate.ninja)

## Contributors 
 -[andrei-cojanu18](https://github.com/andrei-cojanu18)

 -[haalk3n](https://github.com/haalk3n)

Documentation done by [docuTron](https://github.com/tragdate/docuTron)

## License

ISC
