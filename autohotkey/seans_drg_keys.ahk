#SingleInstance,Force
#MenuMaskKey vk07
#UseHook

;;;;;;; FOR LOGITECH M500s since Logitech OPTIONS sucks (can't use setpoint with that mouse)
*WheelLeft::
sendinput, {9}
return

*WheelRight::
sendinput, {8}
return

;;;;;; BHOP ;;;;;;
q::
if GetKeyState("space","p") {
While GetKeyState("space","p")
{
Send {Blind}{space}
Sleep 10
}
} else {
Send, q
}
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
;;;;;;;;;;;;;;;;;;;;;;;;;; ENABLE/DISABLE HOTKEYS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	


Pause::
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

Home::
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
^+*x::
Suspend, Permit
Soundplay, %A_WinDir%\Media\Windows Recycle.wav, Wait
ExitApp
}
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#IfWinActive, Deep Rock Galactic

;~e:: 
;{
;if !GetKeyState("RButton","p") { 
;  if !GetKeyState("LButton","p") { 
;    SendInput {a down} 
;    KeyWait, e 
;    SendInput {a up} 
;    } 
;  }
;} return

