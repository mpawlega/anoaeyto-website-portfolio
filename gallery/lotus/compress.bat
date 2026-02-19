@echo off
setlocal enabledelayedexpansion
cd /d "C:\Users\Matilda\Documents\GitHub\anoaeyto-portfolio\New folder\gallery\lotus"

echo Compressing JPG files 1000 KB or larger...
for %%F in (*.jpg) do (
    for /f %%S in ('powershell -Command "(Get-Item .\%%F).Length"') do (
        if %%S geq 1024000 (
            echo Compressing %%F ^(Size: %%S bytes^)...
            "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i "%%F" -c:v mjpeg -q:v 10 -map_metadata -1 -y "temp_%%F"
            if exist "temp_%%F" (
                echo Success, replacing %%F...
                del "%%F"
                ren "temp_%%F" "%%F"
            ) else (
                echo Failed to compress %%F
            )
        )
    )
)

echo Compressing JPG files 1000 KB or larger ^(uppercase^)...
for %%F in (*.JPG) do (
    for /f %%S in ('powershell -Command "(Get-Item .\%%F).Length"') do (
        if %%S geq 1024000 (
            echo Compressing %%F ^(Size: %%S bytes^)...
            "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i "%%F" -c:v mjpeg -q:v 10 -map_metadata -1 -y "temp_%%F"
            if exist "temp_%%F" (
                echo Success, replacing %%F...
                del "%%F"
                ren "temp_%%F" "%%F"
            ) else (
                echo Failed to compress %%F
            )
        )
    )
)

echo Compressing PNG files 1000 KB or larger...
for %%F in (*.png) do (
    for /f %%S in ('powershell -Command "(Get-Item .\%%F).Length"') do (
        if %%S geq 1024000 (
            echo Compressing %%F ^(Size: %%S bytes^)...
            "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i "%%F" -compression_level 9 -y "temp_%%F"
            if exist "temp_%%F" (
                echo Success, replacing %%F...
                del "%%F"
                ren "temp_%%F" "%%F"
            ) else (
                echo Failed to compress %%F
            )
        )
    )
)

echo All done!
pause