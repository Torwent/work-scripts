@echo off
set /p dirName="Enter Name: "

:: set the full working directory for the video project with the following structure:
:: yy_mm_dd_project
set fullDirectory=%date:~8,2%_%date:~3,2%_%date:~0,2%_%dirName%

mkdir %fullDirectory%

:: create subfolders
mkdir %fullDirectory%\resources
mkdir %fullDirectory%\docs
mkdir %fullDirectory%\out

:: look for the template.prproj file in the current working directory and make
:: a copy of it into the root of the newly created video project directory.
if exist template.prproj (
    copy template.prproj %fullDirectory%\%dirName%.prproj
)

:: sets up a counter variable
set /a counter = 0

:: enabledelayedexpansion to update counter variable each loop
setlocal ENABLEDELAYEDEXPANSION

:: copy each mp4 file into the resources directory in the project folder
for %%f in (*.mp4) do (
    move "%%f" "%fullDirectory%\resources\%dirName%!counter!.mp4"
    set /a counter += 1
)

endlocal