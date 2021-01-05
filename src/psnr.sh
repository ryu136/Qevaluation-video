ref_file="../video/ref.mp4"
encode_file="../video/encode-output.hevc"
DATE=`date "+%Y%m%d-%H:%M:%S"`
echo $DATE

#ffmpeg -i $ref_file -i $encode_file -filter_complex psnr=../log/psnr_stats.log -an -f null - >& ../log/psnr_avg.log
#ffmpeg -i $ref_file -i $encode_file -filter_complex psnr=../log/psnr_stats_$DATE.log -an -f null - >& ../log/psnr_avg_$DATE.log
ffmpeg -i $ref_file -i $encode_file -filter_complex psnr=../log/psnr_stats.log -an -f null - >& ../log/psnr_avg_$DATE.log
