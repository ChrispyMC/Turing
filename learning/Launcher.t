% When compiling code to .exe file, Center Output window and close window
% when program terminates

% The "GUI.CreateButtonFull" program.
import GUI
View.Set ("graphics:400;400,nobuttonbar,position:center;center")
var playbutton : int := Pic.FileNew ("P.jpg")
var x1 : int := 0
var y1 : int := 0
var x2 : int := x1 + Pic.Width (playbutton)
var y2 : int := y1 + Pic.Height (playbutton)
var x, y, button : int

procedure Start
    if not Sys.Exec ("ReactionTest.exe") then
	locate (1, 1)
	put "The Sys.Exec call failed"
	put "Error: ", Error.LastMsg
    end if
end Start

Pic.Draw (playbutton, 0, 0, 0)
drawbox (x1, y1, x2, y2, black)

loop
    Mouse.Where (x, y, button)
    if x1 < x and y1 < x and x2 > x and y2 > x and button = 1 then
	Start
	exit
    end if
end loop
