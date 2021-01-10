width=3840
height=2160
framerate=29.97
framerate=59.94

inputfile="../video/sample.yuv"
outputfile="../video/encode-output.mp4"

### H264
ffmpeg -f rawvideo -pix_fmt yuv420p -s:v "$width"x"$height" -r $framerate -i $inputfile -c:v libx264 $outputfile

### HEVC
#ffmpeg -f rawvideo -pix_fmt yuv420p -s:v "$width"x"$height" -r $framerate -i $inputfile -c:v hevc $outputfile

### AV1
#ffmpeg -f rawvideo -pix_fmt yuv420p -s:v "$width"x"$height" -r $framerate -i $inputfile -c:v libaom-av1 -strict experimental $outputfile

### VP9
#ffmpeg -f rawvideo -pix_fmt yuv420p -s:v "$width"x"$height" -r $framerate -i $inputfile -c:v libvpx-vp9 $outputfile
