%Program Run Window Settings
View.Set ("title:Chrispy's Reaction Tester,graphics:1024;768,position:center;center")
colourback (black)
colour (white)
cls

%Variables & Constants

const size : int := 128
var ms : int := 0
var testcount : int := 1


%Procedures

procedure timer
    delay (1)
    ms := ms + 1
end timer

%Code
locate (1, 1)
put " Click anywhere in the window when the square is blue."

procedure Code
    locate (2, 1)
    put " Test Count: ", testcount
    locate (3, 1)
    put ""
    drawfillbox (maxx div 2 - size, maxy div 2 - size, maxx div 2 + size, maxy div 2 + size, brightred)
    var x, y, button : int
    var randms : int
    randint (randms, 4000, 5000)
    delay (randms)
    drawfillbox (maxx div 2 - size, maxy div 2 - size, maxx div 2 + size, maxy div 2 + size, brightblue)

    loop
	Mouse.Where (x, y, button)
	timer
	if button = 1 then
	    locate (3, 1)
	    put " Milliseconds: ", ms, " | 5 seconds until next test."
	    ms := 0
	    testcount := testcount + 1
	    exit
	end if
    end loop
    delay (5000)
end Code

loop
    Code
end loop
