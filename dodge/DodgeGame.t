%Dodging Game
%2018-07-08
%By Chris
%Game about dodging obstacles

%Set window size and background colour
View.Set ("title:Dodge,graphics:560;340,nobuttonbar,position:center;center")
colourback (white)
cls

%Arrays
var squareList1 : flexible array 1 .. 1 of int
var squareList2 : flexible array 1 .. 1 of int
var squareList3 : flexible array 1 .. 1 of int
var squareList4 : flexible array 1 .. 1 of int
var squareList5 : flexible array 1 .. 1 of int
var chars : array char of boolean

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
var lvl : int := 1     %Game level
var canhit : boolean := false %Check for if the player can get hit.
var squareCount : int := 0 %Square count for red squares
var prevRow : int := 1 %Count for previous row in squareList array
var prevRowHit : int := 1 %Count for previous row in squareList array. Unused.
var L1FileID, L2FileID, L3FileID, L4FileID, L5FileID : int %File ID variables so I can read from each file.
% Level Data filenames: "L1Data", "L2Data", "L3Data", "L4Data", "L5Data"
var temp : string

%Add Launcher variables
include "settings.txt"

%Loading screen
var barx1 : int := 80
var barx2 : int := 95
var randms : int

loop
    randint (randms, 120, 140)
    delay (randms)
    put "Loading: "
    for i : 1 .. 10
	delay (16)
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
    delay (180)
    put "Finished loading."
    exit
end loop

%Settings
var soundToggle : string := "true"
if tempStr = true then
    soundToggle := "true"
else
    soundToggle := "false"
end if

put "Level 1"
delay (1000)
put "Get Ready... 3"
delay (1000)
put "Get Ready... 2"
delay (1000)
put "Get Ready... 1"
delay (1000)
put "GO!"
delay (400)
cls

%Graphics Settings
View.Set ("offscreenonly")
colourback (grey)
cls
drawfillbox (px1, py1, px2, py2, grey)
drawfillbox (x1, y1, x2, y2, grey)
drawfillbox (x1, y1, x2, y2, blue)
View.Update

%Procedures & Process

%View.Update Refresh
process Refresh
    delay (10)
    View.Update
end Refresh

%Timer Procedure
var remainingTime : int := 500
procedure timer
    Time.Delay (50)
    remainingTime := remainingTime - 1
    locate (1, 1)
    put "Time: ", remainingTime
    if remainingTime < 0 then
	squareCount := 0
	prevRow := 1
	prevRowHit := 1
	remainingTime := 500
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
end timer

%Loads collision through files
procedure loadCollision
    if remainingTime > 0 then
	if lvl = 1 then
	    open : L1FileID, "L1Data.txt", get
	    loop
		get : L1FileID, temp
		squareList1 (upper (squareList1)) := strint (temp)
		exit when eof (L1FileID)
		new squareList1, upper (squareList1) + 1
	    end loop
	    close : L1FileID
	elsif lvl = 2 then
	    open : L2FileID, "L2Data.txt", get
	    loop
		get : L2FileID, temp
		squareList2 (upper (squareList2)) := strint (temp)
		exit when eof (L2FileID)
		new squareList2, upper (squareList2) + 1
	    end loop
	    close : L2FileID
	elsif lvl = 3 then
	    open : L3FileID, "L3Data.txt", get
	    loop
		get : L3FileID, temp
		squareList3 (upper (squareList3)) := strint (temp)
		exit when eof (L3FileID)
		new squareList3, upper (squareList3) + 1
	    end loop
	    close : L3FileID
	elsif lvl = 4 then
	    open : L4FileID, "L4Data.txt", get
	    loop
		get : L4FileID, temp
		squareList4 (upper (squareList4)) := strint (temp)
		exit when eof (L4FileID)
		new squareList4, upper (squareList4) + 1
	    end loop
	    close : L4FileID
	elsif lvl = 5 then
	    open : L5FileID, "L5Data.txt", get
	    loop
		get : L5FileID, temp
		squareList5 (upper (squareList5)) := strint (temp)
		exit when eof (L5FileID)
		new squareList5, upper (squareList5) + 1
	    end loop
	    close : L5FileID
	end if
    end if
end loadCollision

%Draws collision
procedure drawCollision
    if lvl = 1 then
	for count : 1 .. upper (squareList1) - 1 by 2
	    rx := squareList1 (count) %Sets variable to first number of a set of 4
	    ry := squareList1 (count + 1) %Sets variable to second number of a set of 4
	    Pic.Draw (rsquare, rx, ry, 0)
	end for
    elsif lvl = 2 then
	for count : 1 .. upper (squareList2) - 1 by 2
	    rx := squareList2 (count) %Sets variable to first number of a set of 4
	    ry := squareList2 (count + 1) %Sets variable to second number of a set of 4
	    Pic.Draw (rsquare, rx, ry, 0)
	end for
    elsif lvl = 3 then
	for count : 1 .. upper (squareList3) - 1 by 2
	    rx := squareList3 (count) %Sets variable to first number of a set of 4
	    ry := squareList3 (count + 1) %Sets variable to second number of a set of 4
	    Pic.Draw (rsquare, rx, ry, 0)
	end for
    elsif lvl = 4 then
	for count : 1 .. upper (squareList4) - 1 by 2
	    rx := squareList4 (count) %Sets variable to first number of a set of 4
	    ry := squareList4 (count + 1) %Sets variable to second number of a set of 4
	    Pic.Draw (rsquare, rx, ry, 0)
	end for
    elsif lvl = 5 then
	for count : 1 .. upper (squareList5) - 1 by 2
	    rx := squareList5 (count) %Sets variable to first number of a set of 4
	    ry := squareList5 (count + 1) %Sets variable to second number of a set of 4
	    Pic.Draw (rsquare, rx, ry, 0)
	end for
    end if
end drawCollision

%Properly starts a level
procedure startGame
    if lvl < 6 then
	loadCollision
	drawCollision
    else
	quit
    end if
end startGame

%Checks for level completion
procedure levelComplete
    if x1 > maxx - 40 then %Finish level procedure
	cls
	x1 := 0
	y1 := (maxy div 2) - 5
	x2 := 10
	y2 := (maxy div 2) + 5
	lvl := lvl + 1
	squareCount := 0
	prevRow := 1
	prevRowHit := 1
	remainingTime := 500
	put "Level ", lvl
	%Music
	if soundToggle = "true" then
	    Music.PlayFile ("Beat - Amp.mp3")
	else
	    delay (3450)
	end if
	cls
	drawfillbox (x1, y1, x2, y2, grey)
	drawfillbox (x1, y1, x2, y2, blue)
	startGame
    elsif x2 > maxx - 40 then
	cls
	x1 := 0
	y1 := (maxy div 2) - 5
	x2 := 10
	y2 := (maxy div 2) + 5
	lvl := lvl + 1
	squareCount := 0
	prevRow := 1
	prevRowHit := 1
	remainingTime := 500
	put "Level ", lvl
	%Music
	if soundToggle = "true" then
	    Music.PlayFile ("Beat - Amp.mp3")
	else
	    delay (3400)
	end if
	cls
	drawfillbox (x1, y1, x2, y2, grey)
	drawfillbox (x1, y1, x2, y2, blue)
	startGame
    end if
end levelComplete

%Hit detection
procedure hitDetect
    if lvl = 1 then
	for count : 1 .. upper (squareList1) - 1 by 2
	    locate (1, 12)
	    put upper (squareList1)
	    if x1 < squareList1 (count) and y1 < squareList1 (count + 1) and x2 > squareList1 (count) + 10 and y2 > squareList1 (count + 1) + 10 then
		%Checks x1, y1, x2, y2 coords have collided with a square
		cls
		rx := maxx - 30
		x1 := 0
		y1 := (maxy div 2) - 5
		x2 := 10
		y2 := (maxy div 2) + 5
		squareCount := 0     %Square count for red squares
		prevRow := 1     %Count for previous row in squareList array
		if soundToggle = "true" then
		    Music.PlayFile ("shine.mp3")
		else
		    delay (5)
		end if
		drawfillbox (x1, y1, x2, y2, blue)
		drawCollision
	    end if
	end for
    elsif lvl = 2 then
	for count : 1 .. upper (squareList2) - 1 by 2
	    locate (1, 12)
	    put upper (squareList2)
	    if x1 < squareList2 (count) and y1 < squareList2 (count + 1) and x2 > squareList2 (count) + 10 and y2 > squareList2 (count + 1) + 10 then
		%Checks x1, y1, x2, y2 coords have collided with a square
		cls
		rx := maxx - 30
		x1 := 0
		y1 := (maxy div 2) - 5
		x2 := 10
		y2 := (maxy div 2) + 5
		squareCount := 0     %Square count for red squares
		prevRow := 1     %Count for previous row in squareList array
		if soundToggle = "true" then
		    Music.PlayFile ("shine.mp3")
		else
		    delay (5)
		end if
		drawfillbox (x1, y1, x2, y2, blue)
		drawCollision
	    end if
	end for
    elsif lvl = 3 then
	for count : 1 .. upper (squareList3) - 1 by 2
	    locate (1, 12)
	    put upper (squareList3)
	    if x1 < squareList3 (count) and y1 < squareList3 (count + 1) and x2 > squareList3 (count) + 10 and y2 > squareList3 (count + 1) + 10 then
		%Checks x1, y1, x2, y2 coords have collided with a square
		cls
		rx := maxx - 30
		x1 := 0
		y1 := (maxy div 2) - 5
		x2 := 10
		y2 := (maxy div 2) + 5
		squareCount := 0     %Square count for red squares
		prevRow := 1     %Count for previous row in squareList array
		if soundToggle = "true" then
		    Music.PlayFile ("shine.mp3")
		else
		    delay (5)
		end if
		drawfillbox (x1, y1, x2, y2, blue)
		drawCollision
	    end if
	end for
    elsif lvl = 4 then
	for count : 1 .. upper (squareList4) - 1 by 2
	    locate (1, 12)
	    put upper (squareList4)
	    if x1 < squareList4 (count) and y1 < squareList4 (count + 1) and x2 > squareList4 (count) + 10 and y2 > squareList4 (count + 1) + 10 then
		%Checks x1, y1, x2, y2 coords have collided with a square
		cls
		rx := maxx - 30
		x1 := 0
		y1 := (maxy div 2) - 5
		x2 := 10
		y2 := (maxy div 2) + 5
		squareCount := 0     %Square count for red squares
		prevRow := 1     %Count for previous row in squareList array
		if soundToggle = "true" then
		    Music.PlayFile ("shine.mp3")
		else
		    delay (5)
		end if
		drawfillbox (x1, y1, x2, y2, blue)
		drawCollision
	    end if
	end for
    elsif lvl = 5 then
	for count : 1 .. upper (squareList5) - 1 by 2
	    locate (1, 12)
	    put upper (squareList5)
	    if x1 < squareList5 (count) and y1 < squareList5 (count + 1) and x2 > squareList5 (count) + 10 and y2 > squareList5 (count + 1) + 10 then
		%Checks x1, y1, x2, y2 coords have collided with a square
		cls
		rx := maxx - 30
		x1 := 0
		y1 := (maxy div 2) - 5
		x2 := 10
		y2 := (maxy div 2) + 5
		squareCount := 0     %Square count for red squares
		prevRow := 1     %Count for previous row in squareList array
		if soundToggle = "true" then
		    Music.PlayFile ("shine.mp3")
		else
		    delay (5)
		end if
		drawfillbox (x1, y1, x2, y2, blue)
		drawCollision
	    end if
	end for
    end if
end hitDetect

procedure Movement
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
	end if
    end if
end Movement

%-----------------------------------------

x1 := 0     %Player lower x coordinate
y1 := (maxy div 2) - 5     %Player lower y coordinate
x2 := 10     %Player upper x coordinate
y2 := (maxy div 2) + 5     %Player upper y coordinate

startGame

loop
    %Refresh
    fork Refresh

    %Timer
    timer

    %Check for level completion
    levelComplete

    %Hit Detection
    hitDetect

    %Movement script
    Movement
end loop







% %Copy-Paste Zone
%
% cls
% rx := maxx - 30
% x1 := 0
% y1 := (maxy div 2) - 5
% x2 := 10
% y2 := (maxy div 2) + 5
% if soundToggle = "true" then
%     Music.PlayFile ("shine.mp3")
% else
%     delay (20)
% end if
% View.Update
%
% cls
% rx := maxx - 30
% rnum := rnum + 1
% rspd := rspd + 2
% rranddone := false
% lvl := lvl + 1
% squareCount := 0
% prevRow := 1
% remainingTime := 1000
% put "Level ", lvl
% View.Update
% %Music
% if soundToggle = "true" then
%     Music.PlayFile ("Beat - Amp.mp3")
% else
%     delay (3450)
% end if
% cls
% drawfillbox (x1, y1, x2, y2, grey)
% drawfillbox (x1, y1, x2, y2, blue)
% View.Update
%
% % var prevRowHit : int := 0
% if canhit = true then
%     for i : 1 .. 15
%         prevRowHit := prevRowHit + 1
%         if squareList (prevRowHit) = x1 then
%             if squareList (prevRowHit + 1) = x1 then
%                 cls
%                 rx := maxx - 30
%                 x1 := 0
%                 y1 := (maxy div 2) - 5
%                 x2 := 10
%                 y2 := (maxy div 2) + 5
%                 squareCount := 0     %Square count for red squares
%                 prevRow := 1     %Count for previous row in squareList array
%                 if soundToggle = "true" then
%                     Music.PlayFile ("shine.mp3")
%                 else
%                     delay (5)
%                 end if
%                 drawfillbox (x1, y1, x2, y2, blue)
%                 View.Update
%             end if
%         elsif squareList (prevRowHit) = y1 then
%             if squareList (prevRowHit + 1) = y1 then
%                 cls
%                 rx := maxx - 30
%                 x1 := 0
%                 y1 := (maxy div 2) - 5
%                 x2 := 10
%                 y2 := (maxy div 2) + 5
%                 squareCount := 0     %Square count for red squares
%                 prevRow := 1     %Count for previous row in squareList array
%                 if soundToggle = "true" then
%                     Music.PlayFile ("shine.mp3")
%                 else
%                     delay (5)
%                 end if
%                 drawfillbox (x1, y1, x2, y2, blue)
%                 View.Update
%             end if
%         elsif squareList (prevRowHit) = x2 then
%             if squareList (prevRowHit + 1) = x2 then
%                 cls
%                 rx := maxx - 30
%                 x1 := 0
%                 y1 := (maxy div 2) - 5
%                 x2 := 10
%                 y2 := (maxy div 2) + 5
%                 squareCount := 0     %Square count for red squares
%                 prevRow := 1     %Count for previous row in squareList array
%                 if soundToggle = "true" then
%                     Music.PlayFile ("shine.mp3")
%                 else
%                     delay (5)
%                 end if
%                 drawfillbox (x1, y1, x2, y2, blue)
%                 View.Update
%             end if
%         elsif squareList (prevRowHit) = y2 then
%             if squareList (prevRowHit + 1) = y2 then
%                 cls
%                 rx := maxx - 30
%                 x1 := 0
%                 y1 := (maxy div 2) - 5
%                 x2 := 10
%                 y2 := (maxy div 2) + 5
%                 squareCount := 0     %Square count for red squares
%                 prevRow := 1     %Count for previous row in squareList array
%                 if soundToggle = "true" then
%                     Music.PlayFile ("shine.mp3")
%                 else
%                     delay (5)
%                 end if
%                 drawfillbox (x1, y1, x2, y2, blue)
%                 View.Update
%             end if
%         end if
%     end for
%     prevRowHit := 0
% end if

