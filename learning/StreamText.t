View.Set ("graphics:300;20,title:Stream Text,position:centre;centre")
View.Set ("nobuttonbar")
colour (white)
colourback (black)
cls

var font : int := Font.New ("Kongtext:10")
assert font > 0

var textDelay : int := 5000

loop

    locate (1, 1)
    Font.Draw ("twitch.tv/Estyric", 38, 15, font, purple)

    delay (textDelay)
    cls

    locate (1, 2)
    Font.Draw ("twitter.com/Estyria", 25, 15, font, cyan)

    delay (textDelay)
    cls

    locate (1, 3)
    Font.Draw ("chrispy.us.to", 65, 15, font, green)

    delay (textDelay)
    cls
    
    locate (1, 4)
    Font.Draw ("adriftus.com", 42, 15, font, yellow)
    
    delay (textDelay)
    cls

end loop
