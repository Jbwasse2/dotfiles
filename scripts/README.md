# Scripts

Here are scripts that I use to automate bullshit that I dont feel like remembering because the program names are not easy to remember (pdfpc isnt the most obvious name for a powerpoint). I also (try to) automate stuff that I do a lot.

If I do not specify an input, there isn't one.

## Description

ln - Here I keep my soft links, I use these to allow me to access directories without remembering where things actually are. In order to make this work add "export CDPATH=/Path/To/This/Folder/ln/"

python - various supporting python scripts. Will get its own README.md when needed.

### Wallpapers/Background
shuffleBGOnce - Changes the background once, does not loop.

shuffleBGLoop - Changes the background every 2 hours and when it is run

deleteAndShuffleBG - Deletes the current background from the wallpaper folder and then shuffles the background to a new one.

### Quality of Life

getWeather - Gets the weather. Automatically gets your city by through wifi connection information. Use -v flag to get weather for today and next few days, use -i just to get weather right now in fahrenheit.

connectToWifi - Interactive way to connect to the wifi

printIRL - send a file to the printer through the terminal. Input should be file to print

monitorOff - When using i3, if you disconnect from a monitor (physically) the i3wm will still have windows open for that monitor even though it isn't connected. This tells the X window system to turn off the other monitor through software. TODO: Make this script more flexible to not depend on the user changing this script to match their monitor 

monitorOn - Similiarly, when you connect a monitor, i3wm/X will not immediately allow the user to work with the newly connected monitor. This script tells X to use the other monitor. TODO: Make this script more flexible to not depend on the user changing this script to match their monitor.

compileLaTeX - When compiling bibs with PDFTex you need to also compile with bibtex and then pdfTex again and once more. This does that automatically. Input should be tex file to compile 

### Stuff I Don't Feel Like Remembering

renderMD - Renders a markdown file into a pdf and puts the render in a "PDF" folder. Input should be name of markdown

screenshot - Take a screenshot, input should be file name to save screenshot as.

search - Looks for word in files. So if you type "search randomize" you'd get back the shuffle wallpaper scripts. The words are case sensitive and need to be a complete match, so "search random" in this folder should return nothing. Input is word you want to search for.

slideshow - Open a pdf as a slideshow. Input should be pdf to have as slideshow

svgToPDF - Turn a .svg into a .pdf file. Input should be .svg file to be converted.

installDEB - Installs .deb files, still need to test so may not be working... Input should be .deb file



