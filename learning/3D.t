View.Set ("title:Pseudo 3D Graphics Test,graphics:800;600,nobuttonbar,offscreenonly")
colourback (white)
cls
var chars : array char of boolean
var x : int := maxx div 2
var y : int := maxy div 2
var size : int := 40
drawfillbox (x - (size + 30), y - size, x + (size + 30), y + size, blue)
loop
    Input.KeyDown (chars)
    if chars (KEY_UP_ARROW) or chars ('w') then
	locate (1, 1)
	put "FORWARD"
	drawfillbox (x - (size + 30), y - size, x + (size + 30), y + size, white)
	size := size + 4
	delay (20)
    elsif chars (KEY_DOWN_ARROW) or chars ('s') then
	locate (1, 1)
	put "BACKWARD"
	drawfillbox (x - (size + 30), y - size, x + (size + 30), y + size, white)
	size := size - 4
	delay (20)
    elsif chars (KEY_LEFT_ARROW) or chars ('a') then
	locate (1, 1)
	put "LEFT"
	drawfillbox (x - (size + 30), y - size, x + (size + 30), y + size, white)
	x := x - 4
	delay (20)
    elsif chars (KEY_RIGHT_ARROW) or chars ('d') then
	locate (1, 1)
	put "RIGHT"
	drawfillbox (x - (size + 30), y - size, x + (size + 30), y + size, white)
	x := x + 4
	delay (20)
    end if
    if size < 40 then
	size := 40
    elsif size > 280 then
	size := 280
    end if
    drawfillbox (x - (size + 30), y - size, x + (size + 30), y + size, blue)
    View.Update
end loop
