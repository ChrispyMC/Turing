%program to show a logo picture
var mypic : int := Pic.FileNew ("rsquare.jpg")
Pic.Draw (mypic, maxx div 2, maxy div 2, 0)

delay (2000)
cls
Pic.Free (mypic)
