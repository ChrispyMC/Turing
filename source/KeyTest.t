%Key Test
%2018-07-04
%By Chris
%Tests keys and moves a box

View.Set ("graphics:640;477,nobuttonbar")
colourback (grey)
cls

View.Set ("offscreenonly")
var x1 : int := 0
var y1 : int := 0
var x2 : int := 10
var y2 : int := 10
var ms : int := 100
drawfillbox (x1, y1, x2, y2, blue)
View.Update
var chars : array char of boolean
loop
    Input.KeyDown (chars)
    if chars (KEY_UP_ARROW) then
	y1 := y1 + 15
	y2 := y2 + 15
	cls
	drawfillbox (x1, y1, x2, y2, blue)
	View.Update
	delay (ms)
    elsif chars (KEY_DOWN_ARROW) then
	y1 := y1 - 15
	y2 := y2 - 15
	cls
	drawfillbox (x1, y1, x2, y2, blue)
	View.Update
	delay (ms)
    elsif chars (KEY_LEFT_ARROW) then
	x1 := x1 - 15
	x2 := x2 - 15
	cls
	drawfillbox (x1, y1, x2, y2, blue)
	View.Update
	delay (ms)
    elsif chars (KEY_RIGHT_ARROW) then
	x1 := x1 + 15
	x2 := x2 + 15
	cls
	drawfillbox (x1, y1, x2, y2, blue)
	View.Update
	delay (ms)
    end if
end loop
