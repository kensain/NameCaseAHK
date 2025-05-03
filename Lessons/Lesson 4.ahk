#Requires AutoHotkey v2
/**
 * JSON ИСПОЛЬЗУЕТСЯ ИСКЛЮЧИТЕЛЬНО В ПРИМЕРАХ И В ОСНОВНОМ КОДЕ БИБЛИОТЕКИ
 * НЕ ЗАДЕЙСТВОВАН!
 */
#Include ../Lib/Json.ahk

/**
 * Подключаем библиотеку
 */
#Include ../Lib/NCLNameCaseRu.ahk

nc := NCLNameCaseRu()

OutputDebug(nc.q("АНДРЕЙ НИКОЛАЕВИЧ", NCL.RODITLN) "`n")
; АНДРЕЯ НИКОЛАЕВИЧА

OutputDebug(nc.q("королёв Никита ПЕТРОВИЧ", NCL.RODITLN) "`n")
; Королёва Никиты ПЕТРОВИЧА

OutputDebug(nc.q("ПороСЁнОК ПёТР", NCL.RODITLN) "`n")
; ПороСЁнКА ПёТРа