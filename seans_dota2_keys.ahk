#SingleInstance,Force
Menu, Tray, Icon, C:\Users\seanx\Desktop\Fun and games\autohotkey\icons\dota2_black.ico, 1, 1
#SingleInstance force		;force a single instance
#HotkeyInterval 0		;disable the warning dialog if a key is held down
#InstallKeybdHook		;Forces the unconditional installation of the keyboard hook
#UseHook On			;might increase responsiveness of hotkeys
#MaxThreads 20			;use 20 (the max) instead of 10 threads
SetBatchLines, -1		;makes the script run at max speed
SetKeyDelay , -1, -1		;faster response (might be better with -1, 0)
;Thread, Interrupt , -1, -1	;not sure what this does, could be bad for timers 

;;;;;; Alias windows key to Alt
;Use remap syntax instead of Send so that it will trigger hotkeys that normally trigger with Alt
LWin::LAlt

;;;;; Hotkeys ;;;;;
;Only active when dota 2 window is active
#ifWinActive, Dota 2

;;;;;; Start up Utilities
Run, "C:\Program Files (x86)\PlayClaw 6\PlayClaw6.exe"

;;;;; Variables ;;;;;
;Track Whether Hotkeys are Enabled by Pause/Home (for the purposes of chatting with Enter only, otherwise check A_IsSuspended)
global HotkeysEnabled := True

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;; ENABLE/DISABLE ;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;Function to toggle whether the hotkeys are disabled or not
ToggleHotkeysEnabled()
{
  if (HotkeysEnabled == True)
  {
    Suspend, On
    HotkeysEnabled := False
    SoundPlay, %A_WinDir%\Media\chord.wav
    Menu, Tray, Icon, C:\Users\seanx\Desktop\Fun and games\autohotkey\icons\dota2_white.ico, 1, 1
  }
  else
  {
    Suspend, Off
    HotkeysEnabled := True
    SoundPlay, %A_WinDir%\Media\Speech Disambiguation.wav
    Menu, Tray, Icon, C:\Users\seanx\Desktop\Fun and games\autohotkey\icons\dota2_black.ico, 1, 1
  }
  return
}

;;;;;; Toggle hotkeys when Enter is pressed, for typing
*Enter::
  Suspend, Permit ;Mark this subroutine as exempt from suspension
  Send, {Blind}{Enter}
  if (HotkeysEnabled == False)
  {
    return ;If hotkeys aren't enabled, Enter should function normally
  }
  else
  {
    Suspend ;Toggle whether this script is suspended
    if (A_IsSuspended == 1)
    {
      SoundPlay, %A_WinDir%\Media\chord.wav
      Menu, Tray, Icon, C:\Users\seanx\Desktop\Fun and games\autohotkey\icons\dota2_white.ico, 1, 1
    }
    else
      SoundPlay, %A_WinDir%\Media\Speech Disambiguation.wav
      Menu, Tray, Icon, C:\Users\seanx\Desktop\Fun and games\autohotkey\icons\dota2_black.ico, 1, 1
    return
  }

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;; INEVENTORY KEYS;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;; Make Space function for use with inventory keys
Space & w::Send u
Space & e::Send i
Space & r::Send o
Space & s::Send j
Space & d::Send k
Space & f::Send l
Space & t::Send {,}
Space::Send {Space} ; make space usable on its own

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;; CAMERA HOTKEYS ;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;; Make XButton1 (back mouse button) function for use with camera keys
XButton1 & w::Send {[} ; use cams
XButton1 & e::Send {]}
XButton1 & r::Send {;}
XButton1 & t::Send {'}
XButton1 & s::Send ^{[} ; set cams
XButton1 & d::Send ^{]}
XButton1 & f::Send ^{;}
XButton1 & g::Send ^{'}
XButton1::Send {Blind}{Space}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;; MISC DOTA KEYS ;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Capslock::m ; for directional movement (or camera grip)
LAlt::LCtrl ; LAlt to LCtrl for skilling

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;; CTRL GROUPS ;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
+6::Send, ^6			

;;;;;;; Make ctrl function as shift for adding to control groups only
;Note that we need to use ::Send here, instead of the 'remap' syntax of a::b, since remap will preserve any modifier keys held
^1::Send, +1
^2::Send, +2
^3::Send, +3
^4::Send, +4
^5::Send, +5
^6::Send, +6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;; MOUSE WHEEL ;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;
;;;;;; Make back side mouse button function as Ctrl
;XButton1::Ctrl ;; now use for camera grip

;;;;;;; FOR LOGITECH M500s since Logitech OPTIONS sucks (can't use setpoint with that mouse)
  ;pickaxe bind
  *WheelLeft::
    sendinput, {9} ; open talent menu
    return

  ;edit reset bind
  *WheelRight::
    sendinput, {0} ; ?? not sure what for yet
    return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
;;;;;;;;;;;;;;;;;;;;;;;;;; ENABLE/DISABLE HOTKEYS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
#IfWinActive ;; can be used whether in Dota2 window or not

;;; Pause always turns keys ON
Pause::
Suspend, Permit
{
  Suspend, Off
  HotkeysEnabled := True
  SoundPlay, %A_WinDir%\Media\Speech Disambiguation.wav
  Menu, Tray, Icon, C:\Users\seanx\Desktop\Fun and games\autohotkey\icons\dota2_black.ico, 1, 1
  return
}

;;; Home always turns keys OFF
Home::
Suspend, Permit
{
  Suspend, On
  HotkeysEnabled := False
  SoundPlay, %A_WinDir%\Media\chord.wav
  Menu, Tray, Icon, C:\Users\seanx\Desktop\Fun and games\autohotkey\icons\dota2_white.ico, 1, 1
  return
}

;;;;;; Kill the app
^+*x::
Suspend, Permit
Soundplay, %A_WinDir%\Media\Windows Recycle.wav, Wait
Process, Close, PlayClaw6.exe
Process, Close, playclawhook32.exe
Process, Close, playclawhook64.exe
ExitApp