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

name := "Ефиопский Аркадий Васильевич"

/**
 * Склоняем слово любыми методами
 */
nc.q(name)

/**
 * Получаем массив объектов типа NCLNameCaseWord
 */
words := nc.GetWordsArray()


for word in words {
    /**
     * Выводим тип каждого слова на экран
     */
    OutputDebug(word.GetNamePart() ' ' word.GetNameCase(NCL.TVORITELN) "`n")
}

/**
 * Получаем:
 * S Ефиопским
 * N Аркадием
 * F Василеьвичем
 */
