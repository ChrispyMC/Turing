% The "GUI.CreateButtonFull" program.
import GUI

procedure Start
    delay (1500)
    if not Sys.Exec ("KeyTest.exe") then
	put "The Sys.Exec call failed"
	put "Error: ", Error.LastMsg
    end if
end Start

View.Set ("graphics:300;200,nobuttonbar")
var startgame : int := GUI.CreateButtonFull (50, 30, 0, "Play Game",
    Start, 0, '^D', true)
var quitBtn : int := GUI.CreateButton (200, 30, 0, "Quit", GUI.Quit)
loop
    exit when GUI.ProcessEvent
end loop
