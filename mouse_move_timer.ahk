;;;https://www.autohotkey.com/board/topic/95131-how-to-simulate-mouse-movements-every-5-minutes-without-actually-moving-them/

#SingleInstance,Force
#NoTrayIcon
Menu, Tray, Icon, C:\Windows\system32\shell32.dll,15 ;Set custom Script icon

#MenuMaskKey vk07
#UseHook

;;;;;;;;;;Mouse Timer;;;;;;;;;;;;

SetTimer, FakeMe, 10000 ; check once every 10 seconds
Return
 
FakeMe:
    If A_TimeIdlePhysical > 30000 ; (30s [in ms] since last REAL user action)
        MouseMove,0,0,0,R ; mouse pointer stays in place but sends a mouse event
Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
;;;;;;;;;;;;;;;;;;;;;;;;;; ENABLE/DISABLE HOTKEYS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	

>!Pause::
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

>!Home::
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
^+>!x::
Suspend, Permit
Soundplay, %A_WinDir%\Media\Windows Recycle.wav, Wait
ExitApp
