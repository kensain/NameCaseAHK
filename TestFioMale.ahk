#Requires AutoHotkey v2.0

#Requires AutoHotkey v2.0
#Include <AHKv2_Scripts\Json>
#Include NCL.ahk

; names := "./src/Tests/TestGenerator/Names/boy_full.txt"
names := "./src/Tests/TestGenerator/Names/girl_full.txt"
; loop read names 
    ; OutputDebug(JSON.stringify(NCLNameCaseRu().q(A_LoopReadLine)) "`n"
    
    
namesArr := []
loop read names
    namesArr.Push(A_LoopReadLine)
for name in namesArr
    OutputDebug(JSON.stringify(NCLNameCaseRu().q(name)) "`n")
OutputDebug("`nSuccess!")
; OutputDebug(JSON.stringify(NCLNameCaseRu().q(namesArr[78])) "`n")