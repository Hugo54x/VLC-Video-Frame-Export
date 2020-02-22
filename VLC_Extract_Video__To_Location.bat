@Echo off
::Re-naming the window
title "VLC Video Extract Script"
::Defining Variables
set Input=
set Output=
set Format=
set Prefix=
::Getting User Input
set /p Input=Path to Video Input File:
set /p Output=Path to empty Image Output Directory:
set /p Format=Image Format (png, jpg, jpeg):
set /p Prefix=Prefix:
::Make the Output Directory
IF exist %Output% GOTO :True
md %Output%
GOTO GOON
:True
echo %Output% is existing already
GOTO GOON
:GOON
::Process the Image Output with VLC
start "" "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" "%Input%" --video-filter=scene --scene-format=%Format% --scene-prefix=%Prefix% --scene-ratio=1 --scene-path=%Output% vlc://quit
::Printing a finished work
echo Extraction in progress!
pause
