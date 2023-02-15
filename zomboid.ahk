#SingleInstance,Force
#MenuMaskKey vk07
#UseHook
#MaxHotkeysPerInterval 1000  ;can spam 200 hotkeys per second before error msg pops up

;;;;;; keys for refocusing window to PZ
#IfWinNotActive ahk_exe ProjectZomboid64.exe
  *WheelLeft::SendInput #1 ;; refocus game to PZ window, for emergency
  *WheelRight::SendInput #1 ;; refocus game to PZ window, for emergency
#IfWinNotActive

#IfWinActive ahk_exe ProjectZomboid64.exe
  ;;;;;;;;;;Mouse binds;;;;;;;;;;;;
  XButton1::7   ;;;;;;Use/Interact
  XButton2::8   ;;;;;;Melee
  ;WheelLeft::9  ;;;;;;
  ;WheelRight::0  ;;;;;;
#IfWinActive

;;;;;; remap windows key ;;;;;;
  LWin::LAlt ;; my suspicion is that I'm hitting Win+3 to focus on chrome -- since it ALWAYS seems to go to chrome
  ;*LWin::RAlt
  ;~LWin up::Send {LWin up}

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