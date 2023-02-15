#SingleInstance,Force
#MenuMaskKey vk07
#UseHook

;;;;;; remap windows key ;;;;;;
;*LWin::RAlt
;~LWin up::Send {LWin up}

;;;;;;;;Movement Keys ESDF;;;;;;;;;;;;;
e::w
s::a
d::s
f::d

;;;;;;;;;;Other keys;;;;;;;;;;;;;
;r 							;;;;;;Report 
a::r						;;;;;;Report
w::Esc          ;;;;;;Escape/cancel
Space::q				;;;;;;KILL

;;;;;;;;;;Mouse binds;;;;;;;;;;;;
XButton1::e     ;;;;;;Interact
XButton2::Tab   ;;;;;;Map
0::Esc          ;;;;;;Cancel
WheelRight::Esc ;;;;;;Cancel


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
