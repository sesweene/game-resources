#SingleInstance,Force
Menu, Tray, Icon, C:\Users\seanx\Desktop\Fun and games\autohotkey\icons\icons8-fortnite-llama-48.ico, 1, 1

#MenuMaskKey vk07
#UseHook

;;;;;; Start up Fort utilities
Run, "C:\Program Files (x86)\Cursor Lock\CursorLock.exe"  /A:"C:\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\FortniteClient-Win64-Shipping.exe"
Run, "C:\Users\seanx\Desktop\Fun and games\Fortnite\TimerResolution.exe"
Run, "C:\Program Files\Keys2XInput\Keys2XInput.exe"
Run, "C:\Program Files (x86)\PlayClaw 6\PlayClaw6.exe"

;;;;;; NO BUILD BIND CHANGES -- REVERT FOR BUILDS ;;;;;;;;;;;
;;;;;; 1) add 'a' for sprint (normally floor) -- do this in autohotkey?
;;;;;; 2) in this script, change RButton from edit to 'u' for sliding

;;;;;; disable windows key ;;;;;;
  LWin::LAlt
  ;~LWin up::Send {LWin up}

;#IfWinActive ahk_exe Fortnite ;;seanfix get full window name here

  ;;;;;; Wall Button rebound to ping for no build (Y)
  *r::y
  *XButton2::y

  *3::Esc
  
  ;;;;; Exit Vehicle
  *w::2

  ;;;;;; so you can still use capslock ;;;;;;
  *>^Capslock::Capslock

  ;;;;;; rebind capslock so the toggle isn't annoying ;;;;;;
  Capslock::u

  ;;;;;; for assigning MButton to select edit ;;;;;;;
  ;*>!o::MButton

  ;;;;;;;;;;;;;EDIT with one button;;;;;;;;;;;;;;;;;;
  *RButton::u
  *a::LShift

/*  
  *RButton::
    Send {Blind}{XButton1}
    Send {Blind}{MButton down}
    keywait, RButton
    Send {Blind}{MButton up}
    ;sendinput, {XButton1} ;; ADD back in for non edit on release in game setting, though it's def slower
    return
*/

  ;;;;;;;;;;;Back Mouse Button is ADS and change build mat, but if during an edit (RButton held down) then it resets and does another edit;;;;;;;;;;;;;;;;
  ;*XButton1::RButton

  *XButton1::
    if GetKeyState("RButton","p") 
    {
      Send {Blind}{l} ;reset the edit first
      Send {Blind}{MButton down}
      keywait, XButton1
      Send {Blind}{MButton up}
      ;sendinput, {XButton1} ;; ADD back in for non edit on release in game setting
      return
    } 
    else 
    {
      Send {Blind}{RButton down}
      keywait, XButton1
      Send {Blind}{RButton up}
      return
    }
    return

  ;;;;;; hold to crouch ;;;;;;;
  *LAlt::
    sendinput, {LAlt}
    keywait, LAlt
    sendinput, {Space}
    return

  ;;;;;; building edit reset ;;;;;;
  ;can sleep 50 (or maybe less) once edit is back client-side
  *8::
    sendinput, {p}
    sleep, 2
    sendinput, {p}
    sleep, 2
    sendinput, {p}
    sleep, 2
    sendinput, {p}
    return

  ;;;;;; BHOP and GOD BUILD ;;;;;;
  q::
    if GetKeyState("space","p") 
    {
      While GetKeyState("space","p")
      {
        Send {Blind}{space}
        Sleep 10
      }
    } 
    else if GetKeyState("LButton","p") 
    {
      While GetKeyState("LButton","p")
      {
        Send {Blind}{LButton}
        Sleep 10
      }
    } 
    else 
    {
      Send, q
    }
    return

  ;;;;;;; FOR LOGITECH M500s since Logitech OPTIONS sucks (can't use setpoint with that mouse)
  ;pickaxe bind
  *WheelLeft::
    sendinput, {9}
    return

  ;edit reset bind
  *WheelRight::
    sendinput, {p}
    sleep, 2
    sendinput, {p}
    sleep, 2
    sendinput, {p}
    sleep, 2
    sendinput, {p}
    return

;#IfWinActive

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
;;;;;;;;;;;;;;;;;;;;;;;;;; ENABLE/DISABLE HOTKEYS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	

Pause::
Suspend, Permit
if (A_IsSuspended == False)
{
  Suspend, On
  SoundPlay, %A_WinDir%\Media\chord.wav
  Menu, Tray, Icon, C:\Users\seanx\Desktop\Fun and games\autohotkey\icons\icons8-fortnite-llama-48_SUSPEND.png, 1, 1
}
else
{
  Suspend, Off
  SoundPlay, %A_WinDir%\Media\Speech Disambiguation.wav
  Menu, Tray, Icon, C:\Users\seanx\Desktop\Fun and games\autohotkey\icons\icons8-fortnite-llama-48.ico, 1, 1
}
return

Home::
Suspend, Permit
if (A_IsSuspended == False)
{
  Suspend, On
  SoundPlay, %A_WinDir%\Media\chord.wav
  Menu, Tray, Icon, C:\Users\seanx\Desktop\Fun and games\autohotkey\icons\icons8-fortnite-llama-48_SUSPEND.png, 1, 1
}
else
{
  Suspend, Off
  SoundPlay, %A_WinDir%\Media\Speech Disambiguation.wav
  Menu, Tray, Icon, C:\Users\seanx\Desktop\Fun and games\autohotkey\icons\icons8-fortnite-llama-48.ico, 1, 1
}
return

;;;;;; Kill the app
^+*x::
Suspend, Permit
Soundplay, %A_WinDir%\Media\Windows Recycle.wav, Wait
if WinExist("Set Timer Resolution")
    WinClose ; Use the window found by WinExist.
if WinExist("Keys2XInput")
    WinClose ; Use the window found by WinExist.
Process, Close, CursorLock.exe
Process, Close, PlayClaw6.exe
Process, Close, playclawhook32.exe
Process, Close, playclawhook64.exe
Process, Close, Keys2XInput_core.exe
ExitApp
