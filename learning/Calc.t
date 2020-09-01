var n1 : int
var n2 : int
var op : string

put " Operations are ADD, SUB, MUL, DIV"
put " Please enter numbers when entering numerical values."
put " Enter operation. (ADD, SUB, MUL, DIV, PER, EXP)"
get op
op := Str.Upper (op)
put " Enter number #1"
get n1
put " Enter number #2"
get n2

if op = "ADD" then
    put " ", n1 + n2

elsif op = "SUB" then
    put " ", n1 - n2

elsif op = "MUL" then
    put " ", n1 * n2

elsif op = "DIV" then
    put " True Quotient: ", n1 / n2
    put " Quotient: ", n1 div n2, " Remainder: ", n1 mod n2

elsif op = "PER" then
    put " Percent: ", (n1 / n2) * 100, "%"

elsif op = "EXP" then
    put " Exponent: ", n1 ** n2
end if
