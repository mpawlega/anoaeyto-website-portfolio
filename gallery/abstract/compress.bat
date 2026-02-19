@echo off
setlocal enabledelayedexpansion

cd /d "C:\Users\Matilda\Documents\GitHub\anoaeyto-portfolio\New folder\gallery\abstract"

echo Scaling down images between 4000-13000 KB...

for %%F in (*.jpg) do (
    for /f %%S in ('powershell -Command "(Get-Item '%%F').Length"') do (
        if %%S gtr 4096000 if %%S lss 13312000 (
            echo Scaling %%F...
            "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i "%%F" -vf "scale=trunc(iw/1.5):trunc(ih/1.5)" -q:v 5 -y "temp_%%F" >nul 2>&1
            del "%%F"
            ren "temp_%%F" "%%F"
        )
    )
)

for %%F in (*.png) do (
    for /f %%S in ('powershell -Command "(Get-Item '%%F').Length"') do (
        if %%S gtr 4096000 if %%S lss 13312000 (
            echo Scaling %%F...
            "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i "%%F" -vf "scale=trunc(iw/1.5):trunc(ih/1.5)" -compression_level 9 -y "temp_%%F" >nul 2>&1
            del "%%F"
            ren "temp_%%F" "%%F"
        )
    )
)

echo Done!
pause