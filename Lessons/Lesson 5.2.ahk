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

/**
 * Пол можно не указывать
 */
OutputDebug(nc.qFatherName("Николаевич", NCL.DATELN) "`n")
; Николаевичу

/**
 * Если не указать падеж, получим массив со всеми падежами.
 */
OutputDebug(JSON.stringify(nc.qFirstName("Андрей")) "`n")
; [
; 	"Андрей",
; 	"Андрея",
; 	"Андрею",
; 	"Андрея",
; 	"Андреем",
; 	"Андрее"
; ]

/**
 * В ситуациях, когда невозможно определить пол, его полезно указать.
 */
OutputDebug(nc.qSecondName("Касюк", NCL.DATELN, NCL.MAN) "`n")
; Касюку