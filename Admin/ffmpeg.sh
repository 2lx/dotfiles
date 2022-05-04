rm -f output.mp4 && sleep 5s && timeout 3 ffmpeg -video_size 940x544 -framerate 25 -f x11grab -i :0.0+0,0 output.mp4
