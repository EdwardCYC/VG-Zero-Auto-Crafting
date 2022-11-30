#NoEnv  ; Performance and compatibility with future AutoHotkey releases.
SendMode Event  ; For new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Warn

if(!A_IsAdmin) {
    Run, *RunAs "%A_AhkPath%" "%A_ScriptFullPath%"
    ExitApp
}



F1::
stop = 0
Loop
{
   if stop = 1
      break

   ; Check PC resolution
   SysGet, Res, Monitor

   ; Check if Craft button is on screen
   ImageSearch, OutX, OutY, %ResLeft%, %ResTop%, %ResRight%, %ResBottom%,    craft_button.bmp
   if ErrorLevel = 0
   {
      if stop = 1
         break

      ; Click Craft Button if it's there
      MouseClick, left, OutX, OutY
      Sleep 2000

      if stop = 1
         break

      ; Click OK
      MouseClick, left, OutX, OutY*0.64
      Sleep 4500

      if stop = 1
         break

      ; Click OK again
      MouseClick, left, OutX*0.90, OutY*0.64
      Sleep 2000
   }
}
Return

F2::
   stop = 1
Return