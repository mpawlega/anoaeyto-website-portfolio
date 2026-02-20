@echo off
setlocal enabledelayedexpansion

set DIR=C:\Users\Matilda\Documents\GitHub\anoaeyto-website-portfolio\projects\tea\posters

for /r "%DIR%" %%f in (*.jpg *.jpeg *.JPG *.JPEG) do (
    echo Compressing: %%f
    magick "%%f" -resize "2560x2560>" -quality 60 -strip "%%f"
)

echo Done!
pause