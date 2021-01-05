ref_file="../video/ref.mp4"
encode_file="../video/encode-output.hevc"
DATE=`date "+%Y%m%d-%H:%M:%S"`
echo $DATE

#ffmpeg -i $ref_file -i $encode_file -filter_complex ssim=../log/ssim_stats.log -an -f null - >& ../log/ssim_avg.log
#ffmpeg -i $ref_file -i $encode_file -filter_complex ssim=../log/ssim_stats_$DATE.log -an -f null - >& ../log/ssim_avg_$DATE.log
ffmpeg -i $ref_file -i $encode_file -filter_complex ssim=../log/ssim_stats.log -an -f null - >& ../log/ssim_avg_$DATE.log
