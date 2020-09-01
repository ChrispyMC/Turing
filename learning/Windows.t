import GUI
View.Set ("graphics:700;525,nobuttonbar")
colourback (grey)
cls

put " -- WINDOWS CMD-LINE --"

put " What is your name?"
var name : string
get name : *
put " Hello ", name
put " What is your age?"
var age : nat
get age
put " You are age ", age, "."
put " [!] You are in OFFLINE MODE."
put " Welcome ", name, " to a COMMAND-LINE INTERFACE. Type STOP to end this program."
put " Type HELP to show the help menu."
var cmd : string
loop
    get cmd
    cmd := Str.Upper (cmd)
    if cmd = "HELP" then
	put " Commands --"
	put " STOP -- Stop this program."
	put " HELP -- Bring the HELP menu up."
	put " DISPLAY -- Bring up information about your display. (Does not include taskbar.)"
	put " TIME -- Displays the current time."
    elsif cmd = "DISPLAY" then
	% The "Config.Display" program.
	const width : int := Config.Display (cdScreenWidth)
	const height : int := Config.Display (cdScreenHeight)
	put " The screen width is ", width, " and the screen height is ", height
	put " (note that the height does not include the task bar, if applicable)"
    elsif cmd = "TIME" then
	var ToD : string
	time (ToD)
	put " The current time is ", ToD
    end if
    exit when cmd = "STOP"
end loop
