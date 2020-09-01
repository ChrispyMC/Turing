drawbox (0, 0, maxx, maxy, grey)
colour (red)
colourback (white)
cls
put " What is your name, student?"
var name : string
get name
put " -------------"
put " Hello ", name
colour (black)
put " Input your 1st test mark."
var a : int
get a
if a >= 80 then
    colour (black)
    colourback (green)
    cls
    put " A Mark | Please wait 5 seconds"
elsif a < 80 and a > 50 then
    colour (black)
    colourback (yellow)
    cls
    put " B Mark | Please wait 5 seconds"
elsif a <= 50 then
    colour (black)
    colourback (brightred)
    cls
    put " C Mark | Please wait 5 seconds"
end if
delay (5000)
colourback (white)
cls

colour (black)
put " Input your 2nd test mark."
var b : int
get b
if b >= 80 then
    colour (black)
    colourback (green)
    cls
    put " A Mark | Please wait 5 seconds"
elsif b < 80 and b > 50 then
    colour (black)
    colourback (yellow)
    cls
    put " B Mark | Please wait 5 seconds"
elsif b <= 50 then
    colour (black)
    colourback (brightred)
    cls
    put " C Mark | Please wait 5 seconds"
end if
delay (5000)
colourback (white)
cls

colour (black)
put " Input your 3rd test mark."
var c : int
get c
if c >= 80 then
    colour (black)
    colourback (green)
    cls
    put " A Mark | Please wait 5 seconds"
elsif c < 80 and c > 50 then
    colour (black)
    colourback (yellow)
    cls
    put " B Mark | Please wait 5 seconds"
elsif c <= 50 then
    colour (black)
    colourback (brightred)
    cls
    put " C Mark | Please wait 5 seconds"
end if
delay (5000)
colourback (white)
cls

colour (black)
put " Thank you for your time. Have a nice day!"
