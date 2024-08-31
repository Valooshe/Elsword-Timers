/*
Numpad4 - Freeze
NumpadEnter - Reset Timer
NumpadSub - Close Timer
*/

#SingleInstance Force
if not A_IsAdmin
   {
      Run *RunAs "%A_ScriptFullPath%"
      ExitApp 
   }

Gui, Show, x1550 y700
Gui, Color, c404040
Gui, Font, s14 cF4BD3E, MS Sans Serif
Gui, Add, Text,vTopic4 x5 y5 w50 center, Freeze


Gui, Margin ,, 5,5
Gui, Font, s14 cBlack, MS Sans Serif
Gui, Add, Text, vCountdown4 x85 y5 w100 cFFFFFF ,0

Gui, Show, h15 w105 
Gui, +AlwaysOnTop -Caption -Border


Gui, +LastFound
hwnd := WinExist()
DllCall("SetWindowLong", "UInt", hwnd, "Int", -20, "UInt", 0x20)


OnMessage(0x201, "WM_LBUTTONDOWN")
WM_LBUTTONDOWN() {
    PostMessage, 0xA1, 2,,, A
}

flag = 0
return

NumpadSub::
    ExitApp
return

$Numpad4::
   GuiControl, +c21e4ff, Topic4
   GuiControl, +c00a3ba, Countdown4
   cnt4 := 89
   SetTimer, Go4, 1000
Return

$NumpadEnter::
   GuiControl, +c21e4ff, Countdown4
   
   flag = 0

   GuiControl,, Countdown4, 0

   SetTimer, Go4, off
Return

Go4:   
   GuiControl,, Countdown4, % cnt4
   if (--cnt4 < 0)
      SetTimer, Go4, off
   else if (cnt4 < 1)
      GuiControl, +c21e4ff, Countdown4
   else if (cnt4 < 16)
      GuiControl, +cF4BD3E, Countdown4
Return