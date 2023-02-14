@Echo Off
Setlocal EnableExtensions DisableDelayedExpansion

Set "inFile=pc1-hainan.txt"
Set "nLines=9999"

If Not Exist "%inFile%" GoTo :EOF
For %%A In ("%inFile%") Do Set "fName=%%~nA"&Set "fExt=%%~xA"

Set "count=0"
For /F %%A In ('Find /C /V ""^<"%inFile%"') Do Set "fLines=%%A"

(For /L %%A In (1 1 %fLines%) Do (Set/P "data="
    Set/A "file=(count/%nLines%)+1", "count+=1"
    SetLocal EnableDelayedExpansion
    (Echo=!data!)>>"%fName%_!file!%fExt%"
    EndLocal))<"%inFile%"

EndLocal
GoTo :EOF