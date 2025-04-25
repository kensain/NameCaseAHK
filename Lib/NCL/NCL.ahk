#Requires AutoHotkey v2

/**
 * @license Dual licensed under the MIT or GPL Version 2 licenses.
 * @package NameCaseLib
 */

/**
 * Класс, который содержит основные константы библиотеки:
 * - индексы мужского и женского пола
 * - индексы всех падежей
 * 
 * @author Андрей Чайка <bymer3@gmail.com>
 * @version 0.4.1
 * @package NameCaseLib
 */

class NCL {
    /**
     * Мужской пол
     * @static Integer
     */
    static MAN := 1

    /**
     * Женский пол
     * @static Integer 
     */
    static WOMAN := 2

    /**
     * Именительный падеж
     * @static Integer 
     */
    static IMENITLN := 0
    
    /**
     * Родительный падеж
     * @static Integer 
     */
    static RODITLN := 1
    
    /**
     * Дательный падеж
     * @static Integer 
     */
    static DATELN := 2
    
    /**
     * Винительный падеж
     * @static Integer 
     */
    static VINITELN := 3
    
    /**
     * Творительный падеж
     * @static Integer 
     */
    static TVORITELN := 4
    
    /**
     * Предложный падеж
     * @static Integer 
     */
    static PREDLOGN := 5
    
    /**
     * Назвиний відмінок
     * @static Integer 
     */
    static UaNazyvnyi := 0
    
    /**
     * Родовий відмінок
     * @static Integer 
     */
    static UaRodovyi := 1
    
    /**
     * Давальний відмінок
     * @static Integer 
     */
    static UaDavalnyi := 2
    
    /**
     * Знахідний відмінок
     * @static Integer 
     */
    static UaZnahidnyi := 3
    
    /**
     * Орудний відмінок
     * @static Integer 
     */
    static UaOrudnyi := 4
    
    /**
     * Місцевий відмінок
     * @static Integer 
     */
    static UaMiszevyi := 5
    
    /**
     * Кличний відмінок
     * @static Integer 
     */
    static UaKlychnyi := 6

}