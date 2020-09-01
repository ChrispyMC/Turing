var list : array 1 .. 6 of int
for i : 1 .. 6
    list (i) := i * i
end for

for i : 1 .. 6
    put list (i)
end for

put " "

%%%%%

var listTwo : array 1 .. 4, 1 .. 6 of int
var a, b : int

for i : 1 .. 4
    for j : 1 .. 6
	listTwo (i, j) := i * 2 + i * j + 1
    end for
end for

loop
    put "Enter a number between 1 and 4"
    get a
    exit when a < 1 or a > 4
    put "Enter a number between 1 and 6"
    get b
    exit when b < 1 or b > 6
    put listTwo (a, b)
end loop

put " "

procedure hit
    put "HIT"
end hit

var rows : int := 4
var columns : int := 2

loop
    var x, y : int
    put "Enter x value (1-5)"
    get x
    exit when x > 5 or x < 1
    put "Enter y value (1-5)"
    get y
    exit when y > 5 or y < 1
    var Alist : array 1 .. rows, 1 .. columns of int
    Alist (1, 1) := 1 %x value
    Alist (1, 2) := 2 %y value
    for r : 1 .. 4
	for c : 1 .. 2
	    if Alist (1, 1) = x and Alist (1, 2) = y then
		hit
	    end if
	end for
    end for
    if Alist (1, 1) = 1 then
	put "hi"
    end if
end loop

var Blist : array 1 .. 4 of string
Blist (1) := "1"
put Blist (1)
