@echo off
set /p dirName="Enter Name: "

:: set the full working directory for the video project with the following structure:
:: yy_mm_dd_project
set fullDirectory=%date:~8,2%_%date:~3,2%_%date:~0,2%_%dirName%

mkdir %fullDirectory%

:: need to simplify this in the future
for %%f in (*.jpg) do (    
    move "%%f" "%fullDirectory%\%dirName%.jpg"
)

for %%f in (*.png) do (    
    move "%%f" "%fullDirectory%\%dirName%.png"
)

for %%f in (*.gif) do (    
    move "%%f" "%fullDirectory%\%dirName%.gif"
)

for %%f in (*.bmp) do (    
    move "%%f" "%fullDirectory%\%dirName%.bmp"
)


pause