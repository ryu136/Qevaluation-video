width=3840
height=2160
framerate=29.97
#framerate=59.94

inputfile="../video/sample.yuv"
outputfile1="../video/encoded_output-h264.mp4"
outputfile2="../video/encoded_output-hevc.mp4"
outputfile3="../video/encoded_output-av1.mp4"
outputfile4="../video/encoded_output-vp9.mp4"

### H264
ffmpeg -f rawvideo -pix_fmt yuv420p -s:v "$width"x"$height" -r $framerate -i $inputfile -c:v libx264 $outputfile1

### HEVC
ffmpeg -f rawvideo -pix_fmt yuv420p -s:v "$width"x"$height" -r $framerate -i $inputfile -c:v hevc $outputfile2

### AV1
#ffmpeg -f rawvideo -pix_fmt yuv420p -s:v "$width"x"$height" -r $framerate -i $inputfile -c:v libaom-av1 -strict experimental $outputfile3

### VP9
ffmpeg -f rawvideo -pix_fmt yuv420p -s:v "$width"x"$height" -r $framerate -i $inputfile -c:v libvpx-vp9 $outputfile4
