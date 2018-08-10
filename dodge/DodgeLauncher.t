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
	guideWindow := Window.Open ("title:Guide,graphics:300;150,position:center;center")
	Window.SetPosition (guideWindow, 0, 0)
	windowCreated := 1
	Window.SetActive (guideWindow)
	locate (4, 1)
	put "Use the Arrow keys or WASD to move."
	put "Dodge the red squares and move to the"
	put "right. Have fun!"
	locate (maxrow, 1)
	put "Launcher v1.3"
	GWCB := GUI.CreateButton (maxx - 60, 1, 0, "Close", closeWindow)
    else
	Window.Show (guideWindow)
    end if
end Guide

var logo : int := Pic.FileNew ("Dodge.bmp")
Pic.Draw (logo, maxx div 2 - 45, maxy - 78, 0)
var playbutton : int := GUI.CreateButtonFull (maxx div 2 - 31, 110, 0, "Play",
    Start, 0, 'P', true)

var H2P : int := GUI.CreateButtonFull (maxx div 2 - 36, 60, 0, "Guide",
    Guide, 0, 'H', false)

var quitBtn : int := GUI.CreateButton (maxx - 60, 5, 0, "Quit", GUI.Quit)

var tempStr : string := "false"
var outputID : int

procedure doNothing (status : boolean)
end doNothing

var settingsCB : int := GUI.CreateCheckBox (8, 8, "Sounds On/Off",
    doNothing)
var CBStatus : boolean := GUI.GetCheckBox (settingsCB)

loop
    CBStatus := GUI.GetCheckBox (settingsCB)
    locate (1, 1)
    put "[DEBUG] Window ID: ", Window.GetActive, " CBStatus: ", CBStatus
    if CBStatus then
	tempStr := "var tempStr : string := false"
	open : outputID, "settings.txt", put
	put : outputID, tempStr
	close : outputID
    else
	tempStr := "var tempStr : boolean := false"
	open : outputID, "settings.txt", put
	put : outputID, tempStr
	close : outputID
    end if
    exit when GUI.ProcessEvent
end loop
