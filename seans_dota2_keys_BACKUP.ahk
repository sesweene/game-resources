#SingleInstance,Force
Menu, Tray, Icon, C:\Users\seanx\Desktop\Fun and games\autohotkey\icons\dota2_black.ico, 1, 1

#MenuMaskKey vk07
#UseHook

;;;;;; Start up Utilities
Run, "C:\Program Files (x86)\PlayClaw 6\PlayClaw6.exe"

;;;;; Variables ;;;;;
;If False, hotkeys will be disabled
global HotkeysEnabled := True
global HotkeysEnabledChat := True

;;;;;;Function to toggle whether the hotkeys are disabled or not
ToggleHotkeysEnabled()
{
  if (HotkeysEnabled == True)
  {
    Suspend, On
    HotkeysEnabled := False
    SoundPlay,*16
    Sleep 150
    SoundPlay,*16
  }
  else
  {
    Suspend, Off
    HotkeysEnabled := True
    SoundPlay,*-1
  }
  return
}

;;;;; Enable/disable all hotkeys ;;;;;
*Pause::
  Suspend, Permit ;Mark this subroutine as exempt from suspension
  ToggleHotkeysEnabled()
  return
*Home::
  Suspend, Permit ;Mark this subroutine as exempt from suspension
  ToggleHotkeysEnabled()
  return

;;;;;; Toggle hotkeys when Enter is pressed, for typing
*Enter::
Suspend, Permit ;Mark this subroutine as exempt from suspension
Send, {Blind}{Enter}
if (HotkeysEnabled == False)
  return ;If hotkeys aren't enabled, Enter should function normally
Suspend ;Toggle whether this script is suspended
if (A_IsSuspended == 1)
{
  SoundPlay,*16
  Sleep 150
  SoundPlay,*16
}
else
  SoundPlay,*-1
return

;;;;;; Alias windows key to Alt
;Use remap syntax instead of Send so that it will trigger hotkeys that normally trigger with Alt
LWin::LAlt

;;;;;;; Make alt function for use with inventory keys (can't use alt in game because it's hard-coded to beacon)
;Note, we can't use Ctrl either, since observer wards have a different function when ctrl is held
;*!a::Send u
;*!s::Send i
;*!e::Send o
;*!f::Send j
;*!d::Send k
;*!r::Send l
;*!t::Send {,}

Space & w::Send u
Space & e::Send i
Space & r::Send o
Space & s::Send j
Space & d::Send k
Space & f::Send l
Space & t::Send {,}

Space::Send {Space}

;;;;;; Make Caps lock a usable key (without toggling your upper/lower case)
*Capslock::m

;;;;;; Make Alt function as Ctrl for Ctrl-clicking to select multiple units and subgroup order modifier key only
/*
!LButton::
Send ^{LButton}
return
!RButton::
Send ^{RButton}
return
*/

;;;;;; Make shift function as ctrl for control group setting only
+1::Send, ^1
+2::Send, ^2
+3::Send, ^3
+4::Send, ^4
+5::Send, ^5

;;;;;;; Make ctrl function as shift for adding to control groups only
;Note that we need to use ::Send here, instead of the 'remap' syntax of a::b, since remap will preserve any modifier keys held
^1::Send, +1
^2::Send, +2
^3::Send, +3
^4::Send, +4
^5::Send, +5

;;;;;;;;
;;;;;; Make back side mouse button function as Ctrl
XButton1::Ctrl

;;;;;;; FOR LOGITECH M500s since Logitech OPTIONS sucks (can't use setpoint with that mouse)
  ;pickaxe bind
  *WheelLeft::
    sendinput, {9}
    return

  ;edit reset bind
  *WheelRight::
    sendinput, {0}
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
  Menu, Tray, Icon, C:\Users\seanx\Desktop\Fun and games\autohotkey\icons\dota2_white.ico, 1, 1
}
else
{
  Suspend, Off
  SoundPlay, %A_WinDir%\Media\Speech Disambiguation.wav
  Menu, Tray, Icon, C:\Users\seanx\Desktop\Fun and games\autohotkey\icons\dota2_black.ico, 1, 1
}
return

Home::
Suspend, Permit
if (A_IsSuspended == False)
{
  Suspend, On
  SoundPlay, %A_WinDir%\Media\chord.wav
  Menu, Tray, Icon, C:\Users\seanx\Desktop\Fun and games\autohotkey\icons\dota2_white.ico, 1, 1
}
else
{
  Suspend, Off
  SoundPlay, %A_WinDir%\Media\Speech Disambiguation.wav
  Menu, Tray, Icon, C:\Users\seanx\Desktop\Fun and games\autohotkey\icons\dota2_black.ico, 1, 1
}
return

;;;;;; Kill the app
^+*x::
Suspend, Permit
Soundplay, %A_WinDir%\Media\Windows Recycle.wav, Wait
Process, Close, PlayClaw6.exe
Process, Close, playclawhook32.exe
Process, Close, playclawhook64.exe
ExitApp