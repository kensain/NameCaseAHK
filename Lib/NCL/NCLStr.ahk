#Requires AutoHotkey v2

/**
 * @license Dual licensed under the MIT or GPL Version 2 licenses.
 * @package NameCaseLib
 */

/**
 * Класс содержит функции для работы со строками, которые используются в NCLNameCaseLib
 * 
 * @author Андрей Чайка <bymer3@gmail.com>
 * @version 0.4.1
 * @package NameCaseLib
 */
class NCLStr {
    /**
     * Кодировка, в котороя работает система
     * @var {String} 
     */
    static charset := 'utf-8'

    /**
     * @description Получить подстроку из строки
     * @param {String} str строка
     * @param {Integer} start начало подстроки
     * @param {Integer} length длина подстроки
     * @return {Integer} подстрока 
     */
    static substr(str, start, length?) {
        return SubStr(str, start, length?)
    }

    /**
     * Поиск подстроки в строке
     * @param string $haystack строка, в которой искать
     * @param string $needle подстрока, которую нужно найти
     * @param int $offset начало поиска
     * @return int позиция подстроки в строке
     */
    static strpos(haystack, needle, offset := 1) {
        return InStr(haystack, needle,, offset)
    }

    /**
     * Определение длины строки
     * @param string $str строка
     * @return int длина строки
     */
    static strlen(str) {
        return StrLen(str)
    }

    /**
     * Переводит строку в нижний регистр
     * @param string $str строка
     * @return string строка в нижнем регистре
     */
    static strtolower(str) {
        return StrLower(str)
    }
    
    /**
     * Переводит строку в верхний регистр
     * @param string $str строка
     * @return string строка в верхнем регистре
     */
    static strtoupper(str) {
        return StrUpper(str)
    }

    /**
     * Поиск подстроки в строке справа
     * @param string $haystack строка, в которой искать
     * @param string $needle подстрока, которую нужно найти
     * @param int $offset начало поиска
     * @return int позиция подстроки в строке
     */
    static strrpos(haystack, needle, offset:=0) {
        return InStr(haystack, needle,, StrLen(haystack-1), +1)
    }
    
    /**
     * Проверяет в нижнем ли регистре находится строка
     * @param string $phrase строка
     * @return bool в нижнем ли регистре строка 
     */
    static isLowerCase(phrase) {
        return (phrase == NCLStr.strtolower(phrase))
    }
    
     /**
     * Проверяет в верхнем ли регистре находится строка
     * @param string $phrase строка
     * @return bool в верхнем ли регистре строка 
     */
    static isUpperCase(phrase) {
        return (phrase == NCLStr.strtoupper(phrase))
    }
    
    /**
     * Превращает строку в массив букв
     * @param string $phrase строка
     * @return array массив букв
     */
    static splitLetters(phrase) {
        lettersArr := []
        loop parse phrase
            lettersArr.Push(A_LoopField)
        return lettersArr
    }
    
    /**
     * @description Соединяет массив букв в строку
     * @param {Array} lettersArr массив букв
     * @return {String} строка
     */
    static connectLetters(lettersArr) {
        res := ""
        for letter in lettersArr
            res .= letter
        return res
    }
    
    /**
     * @description Разбивает строку на части использую шаблон
     * @param {String} pattern шаблон разбития
     * @param {String} Str строка, которую нужно разбить
     * @return {Array} разбитый массив 
     */
    static explode(pattern, Str) {

        return RegExSplit(Str, pattern)

        /**
         * @description {@link https://www.autohotkey.com/boards/viewtopic.php?p=331034#p331034}
         * @param String 
         * @param Delimiter 
         * @param OmitChars 
         * @param MaxParts 
         * @returns {Array} 
         */
        RegExSplit(String, Delimiter := "", OmitChars := "", MaxParts := -1) {
            static uFFFF := Chr(0xFFFF)
        
            ; early exit, split by chars
            if (Delimiter = "")
                return StrSplit(String, Delimiter, OmitChars, MaxParts)
        
            return StrSplit(RegExReplace(String, Delimiter, uFFFF), uFFFF, OmitChars, MaxParts)
        }

    }
}

OutputDebug NCLStr.strpos("this is his coat", "is")