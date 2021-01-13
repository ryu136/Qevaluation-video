# Qevaluation-video

## 使い方
src以下のディレクトリに移動する
```
cd src/
```

* YUVデータしかないとき
```
exe.sh YUVData
```

* YUVデータと圧縮後のデータがある場合
```
cd src/
exe.sh YUVData ../video/encoded_output.mp4
```

* refデータと圧縮後のデータがある場合
```
cd src/
exe.sh ../video/ref.mp4 ../video/encoded_output.mp4
```

もし、zshで動かしたいならば、exe\_zsh.shを利用する

## 動作環境
* ffmpeg version 4.3.1 Copyright (c) 2000-2020 the FFmpeg developers
* GNU bash, version 3.2.57(1)-release (x86\_64-apple-darwin19)
* zsh 5.7.1 (x86\_64-apple-darwin19.0)
