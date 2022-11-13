
Gui, +AlwaysOnTop
Gui, Margin, 20, 20
Gui, Font, s11 normal, Segoe UI
Gui, Add, Picture, x0 y0 w160 h140,  %A_ScriptDir%\boneclubblueskull.png
Gui, Add, Picture, x65 y45 w50 h40 +BackgroundTrans garea, %A_ScriptDir%\select.png
Gui, Add, picture, x10 y45 w50 h40 +BackgroundTrans gfiles, %A_ScriptDir%\replace.png
Gui, Add, Picture, x10 y90 w50 h40 +BackgroundTrans gstart, %A_ScriptDir%\start.png
Gui, Add, picture, x65 y90 w50 h40 +BackgroundTrans gstop, %A_ScriptDir%\stop.png
Gui, Add, picture, x120 y99 w30 h30 +BackgroundTrans, %A_ScriptDir%\button.png
Gui, Show, x400 y100 w160 h140, BONE CLUB FISHER
return


files:
Msgbox, leave world before continuing!
FileDelete, C:\Users\%A_UserName%\AppData\Local\Growtopia\cache\game\particles.rttex
FileDelete, C:\Users\%A_UserName%\AppData\Local\Growtopia\game\particles.rttex
tooltip, Files deleted, Replacing
sleep 500
FileCopy, %A_ScriptDir%\particles.rttex\, C:\Users\%A_UserName%\AppData\Local\Growtopia\cache\
FileCopy, %A_ScriptDir%\particles.rttex\, C:\Users\%A_UserName%\AppData\Local\Growtopia\game\
tooltip, Files replaced
sleep 2500
tooltip
return

area:

tooltip, left click the top left corner above the water
sleep 500
KeyWait, LButton, D
tooltip
mousegetpos, mx, my
WinGet, pid, PID, A
sleep 200
tooltip, left click the bottom right corner above the water
KeyWait, LButton, D
tooltip
mousegetpos, mx2, my2
sleep 200
tooltip, left click the the water
KeyWait, LButton, D
tooltip
mousegetpos, x1, y1
tooltip, Position Saved
sleep 1000
tooltip
return
return

start:
ControlClick, x%x1% y%y1%, ahk_pid %pid%
breakloop = 0
sleep 3000
Loop {
if (BreakLoop = 1)

  break 
  
  Else
  
WinActivate, ahk_pid %pid%  
PixelSearch, Px, Py, mx, my, mx2, my2, 0x0000FE, 5, Fast
if ErrorLevel = 0
{
 tooltip, Fish Detected
  ControlClick, x%x1% y%y1%,ahk_pid %pid%
  sleep 500
  tooltip
  random, s, 0, 3000
sleep %s%
	ControlClick, x%x1% y%y1%,ahk_pid %pid%
	tooltip, fishing
	sleep 2500
}

if Errorlevel = 1
{
 sleep 50
	}
	}
return

stop:
Breakloop = 1
return