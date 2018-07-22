% When compiling code to .exe file, Center Output window and close window
% when program terminates

% The "GUI.CreateButtonFull" program.
import GUI
View.Set ("title:Dodge Launcher,graphics:350;250,nobuttonbar,position:center;center")

put "[DEBUG] Window ID: ", Window.GetActive

procedure Start
    if not Sys.Exec ("DodgeGame.exe") then
	put "The Sys.Exec call failed"
	put "Error: ", Error.LastMsg
    end if
end Start

var windowCreated : int := 0
var guideWindow : int := 0
var GWCB : int
procedure closeWindow
    Window.Hide (guideWindow)
end closeWindow
procedure Guide
    if windowCreated = 0 then
	guideWindow := Window.Open ("title:Guide,graphics:300;100,position:center;center")
	Window.SetPosition (guideWindow, 0, 0)
	windowCreated := 1
	Window.SetActive (guideWindow)
	put "Use the Arrow keys or WASD to move."
	put "Dodge the red squares and move to the"
	put "right. Have fun!"
	GWCB := GUI.CreateButton (maxx - 60, 1, 0, "Close", closeWindow)
    else
	Window.Show (guideWindow)
    end if
end Guide

var logo : int := Pic.FileNew ("logo.jpg")
Pic.Draw (logo, maxx div 2 - 63, maxy - 79, 0)
var playbutton : int := GUI.CreateButtonFull (maxx div 2 - 31, 110, 0, "Play",
    Start, 0, '^P', false)

var H2P : int := GUI.CreateButtonFull (maxx div 2 - 76, 52, 0, "Guide",
    Guide, 0, '^H', false)

var quitBtn : int := GUI.CreateButton (maxx div 2 + 5, 52, 0, "Quit", GUI.Quit)

loop
    exit when GUI.ProcessEvent
end loop
