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
 * В цепочках может вызываться любое количество методов
 */
OutputDebug(
    nc.FullReset()
    .SetFirstName("Андрей")
    .SetFatherName("Николаевич")
    .getFormatted(NCL.RODITLN, "N F")
    "`n"
)
; Андрея Николаевича

/**
 * Заканчиваются методы вызовом метода GetFormatted(), который возвращает
 * искомую строку.
 */
OutputDebug(
    JSON.stringify(
        nc.FullReset()
        .SetFullName("Афросинин", "Павел", "Илларионович")
        .GetFormatted(, "N F S")
    ) "`n"
)
; [
; 	"Павел Илларионович Афросинин",
; 	"Павла Илларионовича Афросинина",
; 	"Павлу Илларионовичу Афросинину",
; 	"Павла Илларионовича Афросинина",
; 	"Павлом Илларионовичем Афросининым",
; 	"Павле Илларионовиче Афросинине"
; ]

/**
 * Начинаются все цепочки с вызова метода FullReset();
 */
OutputDebug(
    nc.FullReset()
    .SetSecondName("Романчук")
    .SetGender(NCL.MAN)
    .GetFormatted(NCL.DATELN)
)
; Романчуку