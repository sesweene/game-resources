#SingleInstance,Force
#MenuMaskKey vk07
#UseHook

*XButton1::1
*XButton2::2
*LButton::3
*RButton::4

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