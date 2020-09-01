var x1 : int := 80
var x2 : int := 95
cls
put "Loading: "
delay (400)
drawfillbox (80, maxy - 16, 95, maxy - 1, blue)
delay (400)
drawfillbox (100, maxy - 16, 115, maxy - 1, blue)
delay (400)
drawfillbox (120, maxy - 16, 135, maxy - 1, blue)
delay (400)
drawfillbox (140, maxy - 16, 155, maxy - 1, blue)
delay (400)
drawfillbox (160, maxy - 16, 175, maxy - 1, blue)
delay (400)

cls
put "Loading: "
for i : 1 .. 5
    delay (400)
    drawfillbox (x1, maxy - 16, x2, maxy - 1, blue)
    x1 := x1 + 20
    x2 := x2 + 20
end for
delay (200)
