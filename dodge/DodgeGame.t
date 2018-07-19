%Dodging Game
%2018-07-08
%By Chris
%Game about dodging obstacles

%Set window size and background colour
View.Set ("graphics:560;340,nobuttonbar,position:center;center")
colourback (white)
cls

%Arrays
var squareList : array 1 .. 34 of int
var chars : array char of boolean

squareList (1) := 0
squareList (2) := 0
squareList (3) := 0
squareList (4) := 0
squareList (5) := 0
squareList (6) := 0
squareList (7) := 0
squareList (8) := 0
squareList (9) := 0
squareList (10) := 0
squareList (11) := 0
squareList (12) := 0
squareList (13) := 0
squareList (14) := 0
squareList (15) := 0
squareList (16) := 0
squareList (17) := 0
squareList (18) := 0
squareList (19) := 0
squareList (20) := 0
squareList (21) := 0
squareList (22) := 0
squareList (23) := 0
squareList (24) := 0
squareList (25) := 0
squareList (26) := 0
squareList (27) := 0
squareList (28) := 0
squareList (29) := 0
squareList (30) := 0
squareList (31) := 0
squareList (32) := 0
squareList (33) := 0
squareList (34) := 0

%Variables
var x1 : int := 0     %Player lower x coordinate (Set before the loop starts)
var y1 : int := 0    %Player lower y coordinate (Set before the loop starts)
var x2 : int := 0     %Player upper x coordinate (Set before the loop starts)
var y2 : int := 0     %Player upper y coordinate (Set before the loop starts)
var px1 : int := x1     %Previous lower x
var py1 : int := y1     %Previous lower y
var px2 : int := x2     %Previous upper x
var py2 : int := y2     %Previous upper y
var ms : int := 0
var rsquare : int := Pic.FileNew ("rsquare.jpg")     %Red square picture
var rx : int := maxx - 30     %Red square x coord
var ry : int     %Red square y coord
var rspd : int := 8     %Speed that red square travels
var rnum : int := 2     %Number of times red square is shown on level
var rranddone : boolean := false     %Checks if randint y coord is done
var lvl : int := 1     %Game level
var canhit : boolean := false %Check for if the player can get hit.
var squareCount : int := 0 %Square count for red squares
var prevRow : int := 1 %Count for previous row in squareList array
var prevRowHit : int := 1 %Count for previous row in squareList array. Unused.


%Loading screen
var barx1 : int := 80
var barx2 : int := 95
var randms : int

loop
    randint (randms, 140, 180)
    delay (randms)
    put "Loading: "
    for i : 1 .. 10
	delay (20)
	drawfillbox (barx1, maxy - 16, barx2, maxy - 1, grey)
	barx1 := barx1 + 20
	barx2 := barx2 + 20
    end for
    barx1 := 80
    barx2 := 95
    for i : 1 .. 10
	delay (randms)
	drawfillbox (barx1, maxy - 16, barx2, maxy - 1, blue)
	barx1 := barx1 + 20
	barx2 := barx2 + 20
    end for
    delay (200)
    put "Finished loading."
    exit
end loop

%Settings
var soundToggle : string := "true"
delay (250)
put "Do you want sound on or off? (Default to ON)"
put "Type TRUE or FALSE. Anything else that is not 'true' or 'false'"
put "will turn sounds off"
loop
    get soundToggle : *
    soundToggle := Str.Lower (soundToggle)
    if soundToggle = "true" then
	delay (0)
    elsif soundToggle = "false" then
	delay (0)
    elsif soundToggle = "" then
	soundToggle := "true"
    else
	soundToggle := "false"
    end if
    exit
end loop

put "Level 1"
delay (1000)
put "Get Ready... 3"
delay (1000)
put "Get Ready... 2"
delay (1000)
put "Get Ready... 1"
delay (1000)
put "GO!"
delay (500)
cls

%Graphics Settings
View.Set ("offscreenonly")
colourback (grey)
cls
drawfillbox (px1, py1, px2, py2, grey)
drawfillbox (x1, y1, x2, y2, grey)
drawfillbox (x1, y1, x2, y2, blue)
View.Update

%Procedures

%Timer Procedure
var remainingTime : int := 500
procedure timer
    Time.Delay (50)
    remainingTime := remainingTime - 1
    locate (1, 1)
    put "Time: ", remainingTime
end timer

%Hit detection
procedure hitDetect
    if x1 < squareList (1) and y1 < squareList (2) and x2 > squareList (1) and y2 > squareList (2) then
	cls
	rx := maxx - 30
	x1 := 0
	y1 := (maxy div 2) - 5
	x2 := 10
	y2 := (maxy div 2) + 5
	squareCount := 0 %Square count for red squares
	prevRow := 1 %Count for previous row in squareList array
	if soundToggle = "true" then
	    Music.PlayFile ("shine.mp3")
	else
	    delay (5)
	end if
	drawfillbox (x1, y1, x2, y2, blue)
	View.Update
    elsif x1 < squareList (3) and y1 < squareList (4) and x2 > squareList (3) and y2 > squareList (4) then
	cls
	rx := maxx - 30
	x1 := 0
	y1 := (maxy div 2) - 5
	x2 := 10
	y2 := (maxy div 2) + 5
	squareCount := 0         %Square count for red squares
	prevRow := 1 %Count for previous row in squareList array
	if soundToggle = "true" then
	    Music.PlayFile ("shine.mp3")
	else
	    delay (5)
	end if
	drawfillbox (x1, y1, x2, y2, blue)
	View.Update
    elsif x1 < squareList (5) and y1 < squareList (6) and x2 > squareList (5) and y2 > squareList (6) then
	cls
	rx := maxx - 30
	x1 := 0
	y1 := (maxy div 2) - 5
	x2 := 10
	y2 := (maxy div 2) + 5
	squareCount := 0         %Square count for red squares
	prevRow := 1 %Count for previous row in squareList array
	if soundToggle = "true" then
	    Music.PlayFile ("shine.mp3")
	else
	    delay (5)
	end if
	drawfillbox (x1, y1, x2, y2, blue)
	View.Update
    elsif x1 < squareList (7) and y1 < squareList (8) and x2 > squareList (7) and y2 > squareList (8) then
	cls
	rx := maxx - 30
	x1 := 0
	y1 := (maxy div 2) - 5
	x2 := 10
	y2 := (maxy div 2) + 5
	squareCount := 0         %Square count for red squares
	prevRow := 1 %Count for previous row in squareList array
	if soundToggle = "true" then
	    Music.PlayFile ("shine.mp3")
	else
	    delay (5)
	end if
	drawfillbox (x1, y1, x2, y2, blue)
	View.Update
    elsif x1 < squareList (9) and y1 < squareList (10) and x2 > squareList (9) and y2 > squareList (10) then
	cls
	rx := maxx - 30
	x1 := 0
	y1 := (maxy div 2) - 5
	x2 := 10
	y2 := (maxy div 2) + 5
	squareCount := 0         %Square count for red squares
	prevRow := 1 %Count for previous row in squareList array
	if soundToggle = "true" then
	    Music.PlayFile ("shine.mp3")
	else
	    delay (5)
	end if
	drawfillbox (x1, y1, x2, y2, blue)
	View.Update
    elsif x1 < squareList (11) and y1 < squareList (12) and x2 > squareList (11) and y2 > squareList (12) then
	cls
	rx := maxx - 30
	x1 := 0
	y1 := (maxy div 2) - 5
	x2 := 10
	y2 := (maxy div 2) + 5
	squareCount := 0         %Square count for red squares
	prevRow := 1 %Count for previous row in squareList array
	if soundToggle = "true" then
	    Music.PlayFile ("shine.mp3")
	else
	    delay (5)
	end if
	drawfillbox (x1, y1, x2, y2, blue)
	View.Update
    elsif x1 < squareList (13) and y1 < squareList (14) and x2 > squareList (13) and y2 > squareList (14) then
	cls
	rx := maxx - 30
	x1 := 0
	y1 := (maxy div 2) - 5
	x2 := 10
	y2 := (maxy div 2) + 5
	squareCount := 0         %Square count for red squares
	prevRow := 1 %Count for previous row in squareList array
	if soundToggle = "true" then
	    Music.PlayFile ("shine.mp3")
	else
	    delay (5)
	end if
	drawfillbox (x1, y1, x2, y2, blue)
	View.Update
    elsif x1 < squareList (15) and y1 < squareList (16) and x2 > squareList (15) and y2 > squareList (16) then
	cls
	rx := maxx - 30
	x1 := 0
	y1 := (maxy div 2) - 5
	x2 := 10
	y2 := (maxy div 2) + 5
	squareCount := 0         %Square count for red squares
	prevRow := 1 %Count for previous row in squareList array
	if soundToggle = "true" then
	    Music.PlayFile ("shine.mp3")
	else
	    delay (5)
	end if
	drawfillbox (x1, y1, x2, y2, blue)
	View.Update
    elsif x1 < squareList (17) and y1 < squareList (18) and x2 > squareList (17) and y2 > squareList (18) then
	cls
	rx := maxx - 30
	x1 := 0
	y1 := (maxy div 2) - 5
	x2 := 10
	y2 := (maxy div 2) + 5
	squareCount := 0         %Square count for red squares
	prevRow := 1 %Count for previous row in squareList array
	if soundToggle = "true" then
	    Music.PlayFile ("shine.mp3")
	else
	    delay (5)
	end if
	drawfillbox (x1, y1, x2, y2, blue)
	View.Update
    elsif x1 < squareList (19) and y1 < squareList (20) and x2 > squareList (19) and y2 > squareList (20) then
	cls
	rx := maxx - 30
	x1 := 0
	y1 := (maxy div 2) - 5
	x2 := 10
	y2 := (maxy div 2) + 5
	squareCount := 0         %Square count for red squares
	prevRow := 1 %Count for previous row in squareList array
	if soundToggle = "true" then
	    Music.PlayFile ("shine.mp3")
	else
	    delay (5)
	end if
	drawfillbox (x1, y1, x2, y2, blue)
	View.Update
    elsif x1 < squareList (21) and y1 < squareList (22) and x2 > squareList (21) and y2 > squareList (22) then
	cls
	rx := maxx - 30
	x1 := 0
	y1 := (maxy div 2) - 5
	x2 := 10
	y2 := (maxy div 2) + 5
	squareCount := 0         %Square count for red squares
	prevRow := 1 %Count for previous row in squareList array
	if soundToggle = "true" then
	    Music.PlayFile ("shine.mp3")
	else
	    delay (5)
	end if
	drawfillbox (x1, y1, x2, y2, blue)
	View.Update
    elsif x1 < squareList (23) and y1 < squareList (24) and x2 > squareList (23) and y2 > squareList (24) then
	cls
	rx := maxx - 30
	x1 := 0
	y1 := (maxy div 2) - 5
	x2 := 10
	y2 := (maxy div 2) + 5
	squareCount := 0         %Square count for red squares
	prevRow := 1 %Count for previous row in squareList array
	if soundToggle = "true" then
	    Music.PlayFile ("shine.mp3")
	else
	    delay (5)
	end if
	drawfillbox (x1, y1, x2, y2, blue)
	View.Update
    elsif x1 < squareList (25) and y1 < squareList (26) and x2 > squareList (25) and y2 > squareList (26) then
	cls
	rx := maxx - 30
	x1 := 0
	y1 := (maxy div 2) - 5
	x2 := 10
	y2 := (maxy div 2) + 5
	squareCount := 0         %Square count for red squares
	prevRow := 1 %Count for previous row in squareList array
	if soundToggle = "true" then
	    Music.PlayFile ("shine.mp3")
	else
	    delay (5)
	end if
	drawfillbox (x1, y1, x2, y2, blue)
	View.Update
    elsif x1 < squareList (27) and y1 < squareList (28) and x2 > squareList (27) and y2 > squareList (28) then
	cls
	rx := maxx - 30
	x1 := 0
	y1 := (maxy div 2) - 5
	x2 := 10
	y2 := (maxy div 2) + 5
	squareCount := 0         %Square count for red squares
	prevRow := 1 %Count for previous row in squareList array
	if soundToggle = "true" then
	    Music.PlayFile ("shine.mp3")
	else
	    delay (5)
	end if
	drawfillbox (x1, y1, x2, y2, blue)
	View.Update
    elsif x1 < squareList (29) and y1 < squareList (30) and x2 > squareList (29) and y2 > squareList (30) then
	cls
	rx := maxx - 30
	x1 := 0
	y1 := (maxy div 2) - 5
	x2 := 10
	y2 := (maxy div 2) + 5
	squareCount := 0         %Square count for red squares
	prevRow := 1 %Count for previous row in squareList array
	if soundToggle = "true" then
	    Music.PlayFile ("shine.mp3")
	else
	    delay (5)
	end if
	drawfillbox (x1, y1, x2, y2, blue)
	View.Update
    elsif x1 < squareList (31) and y1 < squareList (32) and x2 > squareList (31) and y2 > squareList (32) then
	cls
	rx := maxx - 30
	x1 := 0
	y1 := (maxy div 2) - 5
	x2 := 10
	y2 := (maxy div 2) + 5
	squareCount := 0         %Square count for red squares
	prevRow := 1 %Count for previous row in squareList array
	if soundToggle = "true" then
	    Music.PlayFile ("shine.mp3")
	else
	    delay (5)
	end if
	drawfillbox (x1, y1, x2, y2, blue)
	View.Update
    elsif x1 < squareList (33) and y1 < squareList (34) and x2 > squareList (33) and y2 > squareList (34) then
	cls
	rx := maxx - 30
	x1 := 0
	y1 := (maxy div 2) - 5
	x2 := 10
	y2 := (maxy div 2) + 5
	squareCount := 0         %Square count for red squares
	prevRow := 1 %Count for previous row in squareList array
	if soundToggle = "true" then
	    Music.PlayFile ("shine.mp3")
	else
	    delay (5)
	end if
	drawfillbox (x1, y1, x2, y2, blue)
	View.Update
    end if
end hitDetect

%-----------------------------------------

x1 := 0     %Player lower x coordinate
y1 := (maxy div 2) - 5     %Player lower y coordinate
x2 := 10     %Player upper x coordinate
y2 := (maxy div 2) + 5     %Player upper y coordinate

loop
    %Timer
    timer
    Input.KeyDown (chars)
    %Linear Movement
    if chars (KEY_UP_ARROW) or chars ('w') then
	delay (20)
	drawfillbox (px1, py1, px2, py2, grey)
	px1 := x1
	py1 := y1
	px2 := x2
	py2 := y2
	y1 := y1 + 10
	y2 := y2 + 10
	if y1 > maxy - 16 or y2 > maxy - 16 then
	    x1 := px1
	    y1 := py1
	    x2 := px2
	    y2 := py2
	else
	    drawfillbox (px1, py1, px2, py2, grey)
	    drawfillbox (x1, y1, x2, y2, grey)
	    drawfillbox (x1, y1, x2, y2, blue)
	    View.Update
	end if
    elsif chars (KEY_DOWN_ARROW) or chars ('s') then
	delay (20)
	drawfillbox (px1, py1, px2, py2, grey)
	px1 := x1
	py1 := y1
	px2 := x2
	py2 := y2
	y1 := y1 - 10
	y2 := y2 - 10
	if y1 < 0 or y2 < 0 then
	    x1 := px1
	    y1 := py1
	    x2 := px2
	    y2 := py2
	else
	    drawfillbox (px1, py1, px2, py2, grey)
	    drawfillbox (x1, y1, x2, y2, grey)
	    drawfillbox (x1, y1, x2, y2, blue)
	    View.Update
	end if
    elsif chars (KEY_LEFT_ARROW) or chars ('a') then
	delay (20)
	drawfillbox (px1, py1, px2, py2, grey)
	px1 := x1
	py1 := y1
	px2 := x2
	py2 := y2
	x1 := x1 - 10
	x2 := x2 - 10
	if x1 < 0 or x2 < 0 then
	    x1 := px1
	    y1 := py1
	    x2 := px2
	    y2 := py2
	else
	    drawfillbox (px1, py1, px2, py2, grey)
	    drawfillbox (x1, y1, x2, y2, grey)
	    drawfillbox (x1, y1, x2, y2, blue)
	    View.Update
	end if
    elsif chars (KEY_RIGHT_ARROW) or chars ('d') then
	delay (20)
	drawfillbox (px1, py1, px2, py2, grey)
	px1 := x1
	py1 := y1
	px2 := x2
	py2 := y2
	x1 := x1 + 10
	x2 := x2 + 10
	if x1 > maxx or x2 > maxx then
	    x1 := px1
	    y1 := py1
	    x2 := px2
	    y2 := py2
	else
	    drawfillbox (px1, py1, px2, py2, grey)
	    drawfillbox (x1, y1, x2, y2, grey)
	    drawfillbox (x1, y1, x2, y2, blue)
	    View.Update
	end if
    end if

    %Red Square Code
    if remainingTime > 0 then
	if squareCount < 17 then
	    randint (rx, 50, maxx - 50)
	    randint (ry, 40, maxy - 40)
	    squareList (prevRow) := rx
	    prevRow := prevRow + 1
	    squareList (prevRow) := ry
	    prevRow := prevRow + 1
	    rsquare := Pic.FileNew ("rsquare.jpg")
	    Pic.Draw (rsquare, rx, ry, 0)
	    squareCount := squareCount + 1
	    canhit := true
	end if
	View.Update
    elsif remainingTime = 0 then
	cls
	rx := maxx - 30
	rnum := rnum + 1
	rspd := rspd + 2
	rranddone := false
	squareCount := 0
	prevRow := 1
	prevRowHit := 1
	remainingTime := 500
	put "Level ", lvl
	View.Update
	%Music
	if soundToggle = "true" then
	    Music.PlayFile ("shine.mp3")
	else
	    delay (5)
	end if
	cls
	drawfillbox (x1, y1, x2, y2, grey)
	drawfillbox (x1, y1, x2, y2, blue)
	View.Update
    end if
    if x1 > maxx - 40 then
	cls
	x1 := 0
	y1 := (maxy div 2) - 5
	x2 := 10
	y2 := (maxy div 2) + 5
	rx := maxx - 30
	rnum := rnum + 1
	rspd := rspd + 2
	rranddone := false
	lvl := lvl + 1
	squareCount := 0
	prevRow := 1
	prevRowHit := 1
	remainingTime := 500
	put "Level ", lvl
	View.Update
	%Music
	if soundToggle = "true" then
	    Music.PlayFile ("Beat - Amp.mp3")
	else
	    delay (3450)
	end if
	cls
	drawfillbox (x1, y1, x2, y2, grey)
	drawfillbox (x1, y1, x2, y2, blue)
	View.Update
    elsif x2 > maxx - 40 then
	cls
	x1 := 0
	y1 := (maxy div 2) - 5
	x2 := 10
	y2 := (maxy div 2) + 5
	rx := maxx - 30
	rnum := rnum + 1
	rspd := rspd + 2
	rranddone := false
	lvl := lvl + 1
	squareCount := 0
	prevRow := 1
	prevRowHit := 1
	remainingTime := 500
	put "Level ", lvl
	View.Update
	%Music
	if soundToggle = "true" then
	    Music.PlayFile ("Beat - Amp.mp3")
	else
	    delay (3400)
	end if
	cls
	drawfillbox (x1, y1, x2, y2, grey)
	drawfillbox (x1, y1, x2, y2, blue)
	View.Update
    end if

    %Hit Detection
    hitDetect
end loop

























%Copy-Paste Zone

cls
rx := maxx - 30
x1 := 0
y1 := (maxy div 2) - 5
x2 := 10
y2 := (maxy div 2) + 5
if soundToggle = "true" then
    Music.PlayFile ("shine.mp3")
else
    delay (20)
end if
View.Update

cls
rx := maxx - 30
rnum := rnum + 1
rspd := rspd + 2
rranddone := false
lvl := lvl + 1
squareCount := 0
prevRow := 1
remainingTime := 1000
put "Level ", lvl
View.Update
%Music
if soundToggle = "true" then
    Music.PlayFile ("Beat - Amp.mp3")
else
    delay (3450)
end if
cls
drawfillbox (x1, y1, x2, y2, grey)
drawfillbox (x1, y1, x2, y2, blue)
View.Update

% var prevRowHit : int := 0
if canhit = true then
    for i : 1 .. 15
	prevRowHit := prevRowHit + 1
	if squareList (prevRowHit) = x1 then
	    if squareList (prevRowHit + 1) = x1 then
		cls
		rx := maxx - 30
		x1 := 0
		y1 := (maxy div 2) - 5
		x2 := 10
		y2 := (maxy div 2) + 5
		squareCount := 0 %Square count for red squares
		prevRow := 1 %Count for previous row in squareList array
		if soundToggle = "true" then
		    Music.PlayFile ("shine.mp3")
		else
		    delay (5)
		end if
		drawfillbox (x1, y1, x2, y2, blue)
		View.Update
	    end if
	elsif squareList (prevRowHit) = y1 then
	    if squareList (prevRowHit + 1) = y1 then
		cls
		rx := maxx - 30
		x1 := 0
		y1 := (maxy div 2) - 5
		x2 := 10
		y2 := (maxy div 2) + 5
		squareCount := 0 %Square count for red squares
		prevRow := 1 %Count for previous row in squareList array
		if soundToggle = "true" then
		    Music.PlayFile ("shine.mp3")
		else
		    delay (5)
		end if
		drawfillbox (x1, y1, x2, y2, blue)
		View.Update
	    end if
	elsif squareList (prevRowHit) = x2 then
	    if squareList (prevRowHit + 1) = x2 then
		cls
		rx := maxx - 30
		x1 := 0
		y1 := (maxy div 2) - 5
		x2 := 10
		y2 := (maxy div 2) + 5
		squareCount := 0 %Square count for red squares
		prevRow := 1 %Count for previous row in squareList array
		if soundToggle = "true" then
		    Music.PlayFile ("shine.mp3")
		else
		    delay (5)
		end if
		drawfillbox (x1, y1, x2, y2, blue)
		View.Update
	    end if
	elsif squareList (prevRowHit) = y2 then
	    if squareList (prevRowHit + 1) = y2 then
		cls
		rx := maxx - 30
		x1 := 0
		y1 := (maxy div 2) - 5
		x2 := 10
		y2 := (maxy div 2) + 5
		squareCount := 0 %Square count for red squares
		prevRow := 1 %Count for previous row in squareList array
		if soundToggle = "true" then
		    Music.PlayFile ("shine.mp3")
		else
		    delay (5)
		end if
		drawfillbox (x1, y1, x2, y2, blue)
		View.Update
	    end if
	end if
    end for
    prevRowHit := 0
end if

