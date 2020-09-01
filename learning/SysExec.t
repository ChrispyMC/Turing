if not Sys.Exec ("KeyTest.exe") then
    put "The Sys.Exec call failed"
    put "Error: ", Error.LastMsg
end if

