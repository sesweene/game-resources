#SingleInstance,Force		;force a single instance
#HotkeyInterval 0		;disable the warning dialog if a key is held down
#InstallKeybdHook		;Forces the unconditional installation of the keyboard hook
#UseHook On			;might increase responsiveness of hotkeys
#MaxThreads 20			;use 20 (the max) instead of 10 threads
SetBatchLines, -1		;makes the script run at max speed
SetKeyDelay , -1, -1		;faster response (might be better with -1, 0)
;Thread, Interrupt , -1, -1	;not sure what this does, could be bad for timers 

;;;;; Make the icon the TFT icon (Author: NiJo?) ;;;;;  
;regread, war, HKEY_CURRENT_USER, Software\Blizzard Entertainment\Warcraft III, ProgramX
;menu, tray, Icon, %War%, 1, 1 

;;;;; Variables ;;;;;
InChatRoomOn := False
InResourceMenu := False

;;;;; Hotkeys ;;;;;
#ifWinActive, Warcraft III ;*new to ver 1.0.41.00* only run when war3 is running

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
;;;;;;;;;;;;;;;;;;;;;;;;;; INVENTORY ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	

;;;;; Use tgbyhn instead of KEYPAD for inventory ;;;;;
t::Send, {Numpad7}
g::Send, {Numpad4}
b::Send, {Numpad1}
y::Send, {Numpad8}
h::Send, {Numpad5}
n::Send, {Numpad2}

+t::Send, +{Numpad7}
+g::Send, +{Numpad4}
+b::Send, +{Numpad1}
+y::Send, +{Numpad8}
+h::Send, +{Numpad5}
+n::Send, +{Numpad2}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
;;;;;;;;;;;;;;;;;;;;;;;;;; CONTROL GROUPS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	

;;;;;;; Make shift function to SET hotkey groups
+1::^1
+2::^2
+3::^3
+4::^4
+5::^5
+6::^6
+7::^7
+8::^8
+9::^9
+0::^0

;;;;;;; Make ctrl function to ADD TO hotkey groups
Ctrl & 1::Send, +1
Ctrl & 2::Send, +2
Ctrl & 3::Send, +3
Ctrl & 4::Send, +4
Ctrl & 5::Send, +5
Ctrl & 6::Send, +6
Ctrl & 7::Send, +7
Ctrl & 8::Send, +8
Ctrl & 9::Send, +9
Ctrl & 0::Send, +0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
;;;;;;;;;;;;;;;;;;;;;;;;;; SEAN ONLY (MOUSE BINDS, ETC) ;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	

;;;;;;;;;;; ` and space are backspace to cycle through town halls;;;;;;;;;;;;;;;;;
`::Send, {Backspace}
Space::Send, {Backspace}

;;;;;; For Heroes (for Sean, remove for Bryan)
F2::F3
F3::F1
F4::F2

;;;;;; Mouse button hotkeys (Sean)
XButton1::F1 ;;back button
XButton2::F2 ;;forward button
*9::Tab ;;Left on scroll wheel
*0::F8 ;;Right on scroll wheel, SELECT IDLE WORKER

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; MISC ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	

;;;;;; For pausing and unpausing quickly
*F5::
Send {F10}m{F10}
return

;;;;;; make Z esc for canceling - not necessary with new customkeys, removed
z::Send, {Esc}z

;;;;;; to go to last alert
Capslock::F3
+Capslock::Capslock ;;so you can turn caps off if needed
+Space::Send, {Space}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
;;;;;;;;;;;;;;;;;;;;;;;;;; RESOURCE TRADING ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	

;;;;;; repurpose windows key for resource trading ;;;;;;
*LWin::
if (InResourceMenu == False)
{
  InResourceMenu := True
  Send, {Blind}{F11}
}
else
{
  Send, {Blind}{Enter}
  InResourceMenu := False
}
return

*6::
if (InResourceMenu == False)
{
  InResourceMenu := True
  Send, {Blind}{F11}
}
else
{
  Send, {Blind}{Enter}
  InResourceMenu := False
}
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
;;;;;;;;;;;;;;;;;;;;;;;;;; ENABLE/DISABLE HOTKEYS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	

;; For some reason the *~ commands do not work with warcraft
*Enter::
Suspend, Permit
Send, {Blind}{Enter}
if (InChatRoomOn == True)
  return
Suspend
if (A_IsSuspended == 1)
{  
  SoundPlay, %A_WinDir%\Media\chord.wav
}
else
{
  SoundPlay, %A_WinDir%\Media\Speech Disambiguation.wav
}
return

Pause::
Suspend, Permit
if (InChatRoomOn == False)
{
  Suspend, On
  InChatRoomOn := True
  InResourceMenu := False
  SoundPlay, %A_WinDir%\Media\chord.wav
}
else
{
  Suspend, Off
  InChatRoomOn := False
  SoundPlay, %A_WinDir%\Media\Speech Disambiguation.wav
}
return

Home::
Suspend, Permit
if (InChatRoomOn == False)
{
  Suspend, On
  InChatRoomOn := True
  InResourceMenu := False
  SoundPlay, %A_WinDir%\Media\chord.wav
}
else
{
  Suspend, Off
  InChatRoomOn := False
  SoundPlay, %A_WinDir%\Media\Speech Disambiguation.wav
}
return

;;;;;; Kill the app
^+*x::
Suspend, Permit
Soundplay, %A_WinDir%\Media\Windows Recycle.wav, Wait
ExitApp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
;;;;;;;;;;;;;;;;;;;;;;;;;;; COMMENTED OUT ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	

;;;;;;  Capslock functions like shift to add to hotkey groups
;Capslock & 1::Send, +1
;Capslock & 2::Send, +2
;Capslock & 3::Send, +3
;Capslock & 4::Send, +4
;Capslock & 5::Send, +5
;Capslock & 6::Send, +6
;Capslock & 7::Send, +7
;Capslock & 8::Send, +8
;Capslock & 9::Send, +9
;Capslock & 0::Send, +0

;;;;; Disable hotkeys for fast resource trading - Outdated with F4 Method;;;;;
;*F11::
;Suspend, Permit
;Send, {Blind}{F11}
;if (InChatRoomOn == True)
;  return
;Suspend
;if (A_IsSuspended == 1)
;{
;  SoundPlay,*16
;}
;else
;{
;  SoundPlay,*64
;}
;return

