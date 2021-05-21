@echo off
set /p dirName="Enter Name: "
set fullDirectory=%date:~8,2%_%date:~3,2%_%date:~0,2%_%dirName%

REM for /f "eol=; tokens=*" %%fullDirectory= in ('powershell Get-Clipboard') do set CLIPBOARD_TEXT=%%fullDirectory

mkdir %fullDirectory%
mkdir %fullDirectory%\resources
mkdir %fullDirectory%\docs
mkdir %fullDirectory%\out

for %%f in (template.prproj) do (
    if "%%~xf"==".prproj" set file="%%f"
)

copy %file% %fullDirectory%\%fullDirectory%.prproj

for %%f in (*.mp4) do (
    if "%%~xf"==".mp4" set file="%%f"
)

move %file% %fullDirectory%\resources\video.mp4