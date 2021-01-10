inputfile="../video/sample.yuv"
outputfile="../video/ref.mp4"

width=3840
height=2160
framerate=29.97

ffmpeg -f rawvideo -pix_fmt yuv420p -s:v "$width"x"$height" -r $framerate -i $inputfile -c:v libx264 -crf 0 $outputfile
#echo ffmpeg -f rawvideo -pix_fmt yuv420p -s:v "$width"x"$height" -r $framerate -i $inputfile -c:v libx264 -crf 0 $outputfile

