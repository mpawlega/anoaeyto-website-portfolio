@echo off
cd /d "%~dp0"

ffmpeg -y -i "tea_bag.mp4" ^
-t 00:00:03.052 ^
-vf "scale=iw*1.2:ih*1.2" ^
-c:v mpeg4 -qscale:v 2 ^
-c:a aac -b:a 128k ^
"tea_bag_scaled.mp4"

pause
