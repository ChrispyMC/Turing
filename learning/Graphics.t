View.Set ("offscreenonly")
loop
    delay (1500)
    colourback (white)
    cls
    drawfillbox (0, 0, 10, 10, red)
    drawfillbox (10, 10, 20, 20, blue)
    delay (100)
    View.Update
    put " Graphics have been updated"
end loop
