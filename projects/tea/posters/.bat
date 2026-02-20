@echo off
setlocal enabledelayedexpansion

set DIR=C:\Users\Matilda\Documents\GitHub\anoaeyto-website-portfolio\projects\tea\posters

for /r "%DIR%" %%f in (*.jpg *.jpeg *.JPG *.JPEG) do (
    echo Compressing: %%f
    magick "%%f" -quality 75 "%%f"
)

echo Done!
pause