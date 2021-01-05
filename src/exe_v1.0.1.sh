#!/bin/zsh
# inputfileにyuvfileを指定する

function usage {
  cat <<EOM
Usage: $(basename "$0") [option] YUVfile (EncodedFile)
  -h          Display help
  -w VALUE    Width of frame video
  -t VALUE    Height of frame video
  -r VALUE    Frame rate
  -c String   Used codec by encoding (libx264, hevc, libvpx-vp9, {libaom-av1})
EOM
lib
  exit 2
}


if [ $# -lt 1 ]; then
  echo "指定された引数は$#個です。" 1>&2
  echo "実行するには1個以上の引数が必要です。" 1>&2
  usage
  exit 1
fi

ref_file="../video/ref.mp4"
encode_file="../video/encode_file.mp4"
width=3840
height=2160
framerate=29.97
codec="hevc"


# 引数別の処理定義
while getopts ":w:t:r:c:h" OPT; do
  case "$OPT" in
    w)
      width=${OPTARG}
      ;;
    t)
      height=${OPTARG}
      ;;
    r)
      framerate=${OPTARG}
      ;;
    c)
      codec=${OPTARG}
      ;;
    '-h'|'--help'|* )
      usage
      ;;
  esac
done

# delete option
shift `expr $OPTIND - 1`
inputfile=$1

###  debug
#echo "引数に\"$1\"が指定されました。"
#echo "引数に\"$2\"が指定されました。"
echo "width: $width, height: $height, framerate: $framerate, codec: $codec\n"
###  

#inputfileの拡張子を調べる
#echo $inputfile | sed 's/^.*\.\([^\.]*\)$/\1/'
ext=`echo $inputfile | sed 's/^.*\.\([^\.]*\)$/\1/'`
echo $ext

if [ $ext = "yuv" ]; then
  # 評価用の動画ファイルを作成
  ffmpeg -y -f rawvideo -pix_fmt yuv420p -s:v "$width"x"$height" -r $framerate -i $inputfile -c:v libx264 -crf 0 $ref_file
  #echo ffmpeg -y -f rawvideo -pix_fmt yuv420p -s:v "$width"x"$height" -r $framerate -i $inputfile -c:v libx264 -crf 0 $ref_file
fi

if [ $# -eq 1 ]; then
  # yuvファイルをエンコードする
  ffmpeg -y -f rawvideo -pix_fmt yuv420p -s:v "$width"x"$height" -r $framerate -i $inputfile -c:v $codec $encode_file
  #echo ffmpeg -y -f rawvideo -pix_fmt yuv420p -s:v "$width"x"$height" -r $framerate -i $inputfile -c:v $codec $encode_file
else
  encode_file=$2
fi

DATE=`date "+%Y%m%d-%H:%M:%S"`
echo $DATE

# psnr | ssim
echo "PSNR"
ffmpeg -i $ref_file -i $encode_file  -filter_complex psnr=../log/psnr_stats.log -an -f null - >& ../log/psnr_avg_$DATE.log      ## stats fileにはなぜか変数DATEを付け加えるとerror
echo "SSIM"
ffmpeg -i $ref_file -i $encode_file  -filter_complex ssim=../log/ssim_stats.log -an -f null - >& ../log/ssim_avg_$DATE.log

mv ../log/ssim_stats.log ../log/ssim_stats_$DATE.log
tail -n1 ../log/ssim_avg_$DATE.log
mv ../log/psnr_stats.log ../log/psnr_stats_$DATE.log
tail -n1 ../log/ssim_avg_$DATE.log
