/*
F2 - Orb Shield (as OS)
F3 - Black White (as BW)
F4 - Triple Explosion (as TE)
F5 - Freeze
F9 - Reset Timer
F12 - Close Timer
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
Gui, Add, Text,vTopic1 x5 y5 w50 center , OrbShield
Gui, Add, Text,vTopic2 x5 y40 w50 center , BlackWhite
Gui, Add, Text,vTopic3 x5 y75 w50 center , TripleExplode
Gui, Add, Text,vTopic4 x5 y110 w50 center c21e4ff, Freeze

Gui, Margin ,, 5,5
Gui, Font, s14 cBlack, MS Sans Serif
Gui, Add, Text, vCountdown1 x134 y5 w100 cFFFFFF ,0 
Gui, Add, Text, vCountdown2 x134 y40 w100 cFFFFFF ,0
Gui, Add, Text, vCountdown3 x134 y75 w100 cFFFFFF ,0
Gui, Add, Text, vCountdown4 x134 y110 w100 c00A3BA ,0

Gui, Show, h120 w170, CounterBall
Gui, +AlwaysOnTop -Caption -Border



Sec := 1000

BB_flag1 := 1
BB_flag2 := 0
cnt1 := 210
cnt2 := 290
cnt3 := 140


Gui, +LastFound
hwnd := WinExist()
DllCall("SetWindowLong", "UInt", hwnd, "Int", -20, "UInt", 0x20)

OnMessage(0x201, "WM_LBUTTONDOWN")
WM_LBUTTONDOWN() {
    PostMessage, 0xA1, 2,,, A
}

return

F12::
    ExitApp
return

$F2::  
   GuiControl, +cF4BD3E, Topic1
   GuiControl, +cFFFFFF, Countdown1
   cnt1 := 209
   SetTimer, Go1, % Sec
      
   if(BB_flag2 = 1){
      GuiControl, +cF4BD3E, Topic2
      GuiControl, +cFFFFFF, Countdown2
      cnt2 := 76
      SetTimer, Go2, % Sec

      BB_flag2 := 0 
   }
   else if(cnt2 <= 80){
      GuiControl, +cF4BD3E, Topic2
      GuiControl, +cFFFFFF, Countdown2
      cnt2 := 79
      SetTimer, Go2, % Sec
   }
   
   ; First count
   if(BB_flag1 = 1){
      GuiControl, +cF4BD3E, Topic2
      GuiControl, +cFFFFFF, Countdown2
      cnt2 := 289
      SetTimer, Go2, % Sec

      GuiControl, +cF4BD3E, Topic3
      GuiControl, +cFFFFFF, Countdown3
      cnt3 := 139
      SetTimer, Go3, % Sec
      BB_flag1 := 0
      BB_flag2 := 1
   }

Return

$F3::

   GuiControl, +cF4BD3E, Topic2
   GuiControl, +cFFFFFF, Countdown2
   cnt2 := 239
   SetTimer, Go2, % Sec

   if(cnt1 <= 80){
      GuiControl, +cF4BD3E, Topic1
      GuiControl, +cFFFFFF, Countdown1
      cnt1 := 79
      SetTimer, Go1, % Sec
   }

Return

$F4::
   GuiControl, +cF4BD3E, Topic3
   GuiControl, +cFFFFFF, Countdown3
   cnt3 := 139
   SetTimer, Go3, % Sec
Return

$F5::
   GuiControl, +c21e4ff, Topic4
   GuiControl, +c00a3ba, Countdown4
   cnt4 := 89
   SetTimer, Go4, % Sec
Return

$F9::
   GuiControl, +cFFFFFF, Countdown1
   GuiControl, +cFFFFFF, Countdown2
   GuiControl, +cFFFFFF, Countdown3
   GuiControl, +c21e4ff, Countdown4
   

   BB_Cnt := 0
   BB_flag1 := 1
   BB_flag2 := 0
   cnt1 := 210
   cnt2 := 290
   cnt3 := 140
   GuiControl,, Countdown1, 0
   GuiControl,, Countdown2, 0
   GuiControl,, Countdown3, 0
   GuiControl,, Countdown4, 0

   SetTimer, Go1, off
   SetTimer, Go2, off
   SetTimer, Go3, off
   SetTimer, Go4, off

Return

Go1:   
   GuiControl,, Countdown1, % cnt1
   if (--cnt1 < 0)
      SetTimer, Go1, off
   else if (cnt1 < 21)
      GuiControl, +cRed, Countdown1
   else if (cnt1 < 41)
      GuiControl, +cF4BD3E, Countdown1

Return

Go2:   
   GuiControl,, Countdown2, % cnt2
   if (--cnt2 < 0)
      SetTimer, Go2, off
   else if (cnt2 < 21)
      GuiControl, +cRed, Countdown2
   else if (cnt2 < 41)
      GuiControl, +cF4BD3E, Countdown2

Return

Go3:   
   GuiControl,, Countdown3, % cnt3
   if (--cnt3 < 0)
      SetTimer, Go3, off
   else if (cnt3 < 21)
      GuiControl, +cRed, Countdown3
   else if (cnt3 < 41)
      GuiControl, +cF4BD3E, Countdown3
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

