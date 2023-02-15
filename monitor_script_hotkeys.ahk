;;;;;;;;;;;;;;;;;Set custom Script icon;;;;;;;;;;;;;;;
#SingleInstance,Force
#NoTrayIcon
Menu, Tray, Icon, C:\Windows\system32\shell32.dll,16

;;;;;;;;;;;;;;;;;Ctrl+Shift+Alt+0
;;;;;;;;;;;;;;;;;Swap Triple to DP (PC)
^+!0::
Run, "C:\Users\seanx\Desktop\Fun and games\autohotkey\monitor scripts\TRIPLE_to_PC.bat"
return

;;;;;;;;;;;;;;;;;Ctrl+Shift+Alt+9
;;;;;;;;;;;;;;;;;Swap Triple to HDMI (Mac)
^+!9::
Run, "C:\Users\seanx\Desktop\Fun and games\autohotkey\monitor scripts\TRIPLE_to_MAC.bat"
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
;;;;;;;;;;;;;;;;;;;;;;;;;; ENABLE/DISABLE HOTKEYS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	

>^Pause::
Suspend, Permit
if (A_IsSuspended == False)
{
  Suspend, On
  SoundPlay, %A_WinDir%\Media\chord.wav
}
else
{
  Suspend, Off
  SoundPlay, %A_WinDir%\Media\Speech Disambiguation.wav
}
return

>^Home::
Suspend, Permit
if (A_IsSuspended == False)
{
  Suspend, On
  SoundPlay, %A_WinDir%\Media\chord.wav
}
else
{
  Suspend, Off
  SoundPlay, %A_WinDir%\Media\Speech Disambiguation.wav
}
return

;;;;;; Kill the app
<^+>^x::
Suspend, Permit
Soundplay, %A_WinDir%\Media\Windows Recycle.wav, Wait
ExitApp
