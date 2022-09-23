#SingleInstance, FORCE
#Include %A_ScriptDir%\volume.ahk

myMics := ["Microfone (Logitech G935/G933s Gaming Headset)", "Microfone (Razer Seiren Emote)"]
micLevels := 65

While( True )
{
  Loop
  {          
    currentMic := A_Index

    SoundGet, micVolume, MASTER, VOLUME, %currentMic%

    if (micVolume = "")
      break

    if ( ErrorLevel )
      continue  

    Loop
    {
      CurrInstance := A_Index
      
      SoundGet, micVolume, MASTER:%CurrInstance%,, %currentMic%

      if ErrorLevel in Mixer Doesn't Have That Many of That Component Type, Invalid Control Type or Component Type
        break

      SoundGet, micVolume, MASTER:%CurrInstance%, VOLUME, %currentMic%

      if ErrorLevel in Component Doesn't Support This Control Type,Invalid Control Type or Component Type
        continue

      micVolume := Round( micVolume ) 
      VA_dev:= VA_GetDevice(currentMic)
      VA_dev_name:= VA_GetDeviceName(VA_dev)

      for index, mic in myMics
      {
        if ( mic == VA_dev_name)
        {
            if ( micVolume > micLevels) 
            {
              SoundSet, %micLevels%, MASTER, VOLUME, %currentMic%
            } 
        }
        Sleep, 1
      }
      Sleep, 1
    }  
    Sleep, 1
  } 

  ;// 60 minutes in ms
  Sleep, 3600000
}

return

;// Lcontrol + F8
^F8::EXITAPP
  