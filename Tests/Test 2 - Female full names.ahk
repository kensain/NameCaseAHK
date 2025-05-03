#Requires AutoHotkey v2

#Include ../Lib/NCLNameCaseRu.ahk

/**
 * JSON ИСПОЛЬЗУЕТСЯ ИСКЛЮЧИТЕЛЬНО В ПРИМЕРАХ И В ОСНОВНОМ КОДЕ БИБЛИОТЕКИ
 * НЕ ЗАДЕЙСТВОВАН!
 */
#Include ../Lib/Json.ahk

/**
 * Список имён из родной библиотеки NCLCaseNameLib.
 */
names := "../src/Tests/TestGenerator/Names/girl_full.txt"

namesArr := []
loop read names
    namesArr.Push(A_LoopReadLine)

for name in namesArr
    OutputDebug(JSON.stringify(NCLNameCaseRu().q(name)) "`n")

OutputDebug("`nSuccess!")