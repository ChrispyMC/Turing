%Christobum Ying
%2018-07-03
%Loops exercise

var word : string %Word the user input
var n : int := 0 %Word counter
put " -------"
loop
    get word : *
    word := Str.Lower (word) %Sets word var to lowercase 
    exit when word = "exit"
    put word
    n := n + 1 %Increases word count var
end loop
if n = 1 then %Detects if 1 word was inputed and prints correct grammer
    put n, " word was inputed"
else
    put n, " words were inputed"
end if
