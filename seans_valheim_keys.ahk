#SingleInstance,Force
#MenuMaskKey vk07
#UseHook

;;;;;;; FOR LOGITECH M500s since Logitech OPTIONS sucks (can't use setpoint with that mouse)
*WheelLeft::
sendinput, {7}
return

*WheelRight::
sendinput, {8}
return

;*LCtrl::
;sendinput, {MButton}
;return

*y::
sendinput, {MButton}
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#IfWinActive, Deep Rock Galactic

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
