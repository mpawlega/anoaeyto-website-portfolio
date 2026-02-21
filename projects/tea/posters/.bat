@echo off

for %%f in (*.jpg *.jpeg *.JPG *.JPEG) do (
    echo Compressing: %%f
    sharp -i "%%f" -o "%%f" --quality 75 resize 1600 2000 --withoutEnlargement
)

echo Done!
pause