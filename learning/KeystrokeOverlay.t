View.Set ("graphics:370;20,title:Keystroke Overlay,position:centre;centre")
View.Set ("nobuttonbar")
colour (white)
colourback (black)
cls

var chars : array char of boolean

loop
    Input.KeyDown (chars)
    locate (1, 2)
    if chars ('w') then
	put "[W] " ..
    else
	put "[_] " ..
    end if
    if chars ('a') then
	put "[A] " ..
    else
	put "[_] " ..
    end if
    if chars ('s') then
	put "[S] " ..
    else
	put "[_] " ..
    end if
    if chars ('d') then
	put "[D] " ..
    else
	put "[_] " ..
    end if
    if chars (chr (32)) then
	put "[SPACE] " ..
    else
	put "[_____] " ..
    end if
    if chars (chr (181)) then
	put "[CTRL] " ..
    else
	put "[____] " ..
    end if
    if chars (chr (180)) then
	put "[SHIFT] " ..
    else
	put "[_____] " ..
    end if
    if chars (chr (9)) then
	put "[TAB] " ..
    else
	put "[___] " ..
    end if
end loop
