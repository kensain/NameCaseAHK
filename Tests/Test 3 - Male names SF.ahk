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
Names := "../src/Tests/TestGenerator/Names/boy_SF.txt"

NamesArr := []
loop read names
    NamesArr.Push(A_LoopReadLine)

for name in NamesArr
    OutputDebug(JSON.stringify(NCLNameCaseRu().q(name)) "`n")

OutputDebug("`nSuccess!")