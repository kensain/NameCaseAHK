#Requires AutoHotkey v2.0
#Include <AHKv2_Scripts\Json>
#Include NCL.ahk

names := "./src/Tests/TestGenerator/Names/boy_full.txt"
; loop read names 
    ; OutputDebug(JSON.stringify(NCLNameCaseRu().q(A_LoopReadLine)) "`n"
    
    
namesArr := []
loop read names
    namesArr.Push(A_LoopReadLine)
for name in namesArr
    OutputDebug((NCLNameCaseRu().q(name, 3)) "`n")
OutputDebug("`nSuccess!")
; OutputDebug(JSON.stringify(NCLNameCaseRu().q(namesArr[78])) "`n")