# change_mic_sens_on_windows
When restarting windows, for some reason it always changes the sensitivity of my razer microphone. So I decided to make a script to check and change every 1 hour.


## How to use

1. Download Ahk [HERE](https://www.autohotkey.com/)
2. Install autoHotKey
3. In main.ahk put the name of your microphones inside the list
```
line 4: myMics := ["Microfone (Logitech G935/G933s Gaming Headset)", "Microfone (Razer Seiren Emote)"]
```

4. Define your mic level 
```
line 5: micLevels := 65 ;// from 0 to 100
```
5. Run :)

![myfile](https://cdn.discordapp.com/attachments/990575680255324181/1022730690095239218/exemple.gif)
