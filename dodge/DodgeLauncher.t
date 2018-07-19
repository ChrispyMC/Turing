% When compiling code to .exe file, Center Output window and close window
% when program terminates

% The "GUI.CreateButtonFull" program.
import GUI
View.Set ("graphics:400;300,nobuttonbar,position:center;center")
var playbutton : int := Pic.FileNew ("playbutton.bmp")
var x1 : int := maxx div 2 - 78
var y1 : int := 75
var x2 : int := x1 + Pic.Width (playbutton)
var y2 : int := y1 + Pic.Height (playbutton)
var x, y, button : int

procedure Start
    if not Sys.Exec ("DodgeGame.exe") then
	put "The Sys.Exec call failed"
	put "Error: ", Error.LastMsg
    end if
end Start

var logo : int := Pic.FileNew ("logo.jpg")
Pic.Draw (logo, maxx div 2 - 61, maxy - 85, 0)
Pic.Draw (playbutton, maxx div 2 - 78, 75, 0)
drawbox (x1, y1, x2, y2, black)

loop
    Mouse.Where (x, y, button)
    if x1 < x and y1 < x and x2 > x and y2 > x then
	Start
	exit
    end if
end loop
