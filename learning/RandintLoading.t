%Randint & Loading
%2018-07-07
%By Chris
%Exercise for randint function. Displays a loading interger.

var progress : int := 0
var randms : int
var done : int := 0

loop
    if done = 0 then
	randint (randms, 975, 1500)
	delay (randms)
	if progress < 10 then
	    progress := progress + 1
	    locate (1, 1)
	    put "Loading: ", progress, " / 10"
	elsif progress = 10 then
	    progress := 10
	    delay (1500)
	    locate (1, 1)
	    put "Finished loading."
	    done := 1
	end if
    end if
    exit when done = 1
end loop
