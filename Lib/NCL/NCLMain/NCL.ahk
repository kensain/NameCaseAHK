#Requires AutoHotkey v2
; #Warn All, Off
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
     * @property {(Int)} MAN
     */
    static MAN := 1

    /**
     * Женский пол
     * @property {(Int)} WOMAN
     */
    static WOMAN := 2

    /**
     * Именительный падеж
     * @property {(Int)} IMENITLN
     */
    static IMENITLN := 0
    
    /**
     * Родительный падеж
     * @property {(Int)} RODITLN
     */
    static RODITLN := 1
    
    /**
     * Дательный падеж
     * @property {(Int)} DATELN
     */
    static DATELN := 2
    
    /**
     * Винительный падеж
     * @property {(Int)} VINITELN
     */
    static VINITELN := 3
    
    /**
     * Творительный падеж
     * @property {(Int)} TVORITELN
     */
    static TVORITELN := 4
    
    /**
     * Предложный падеж
     * @property {(Int)} PREDLOGN
     */
    static PREDLOGN := 5
    
    /**
     * Назвиний відмінок
     * @property {(Int)} UaNazyvnyi
     */
    static UaNazyvnyi := 0
    
    /**
     * Родовий відмінок
     * @property {(Int)} UaRodovyi
     */
    static UaRodovyi := 1
    
    /**
     * Давальний відмінок
     * @property {(Int)} UaDavalnyi
     */
    static UaDavalnyi := 2
    
    /**
     * Знахідний відмінок
     * @property {(Int)} UaZnahidnyi
     */
    static UaZnahidnyi := 3
    
    /**
     * Орудний відмінок
     * @property {(Int)} UaOrudnyi
     */
    static UaOrudnyi := 4
    
    /**
     * Місцевий відмінок
     * @property {(Int)} UaMiszevyi
     */
    static UaMiszevyi := 5
    
    /**
     * Кличний відмінок
     * @property {(Int)} UaKlychnyi
     */
    static UaKlychnyi := 6
}

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
     * @property {(String)} Charset
     */
    static Charset := 'utf-8'

    /**
     * Получить подстроку из строки
     * @deprecated
     * @param {(String)} str строка
     * @param {(Int)} start начало подстроки
     * @param {(Int)} length длина подстроки
     * @returns {(Int)} подстрока 
     */
    static substr(str, start, length:="") {
        return SubStr(str, start, length)
    }

    /**
     * Поиск подстроки в строке
     * @param {(String)} haystack строка, в которой искать
     * @param {(String)} needle подстрока, которую нужно найти
     * @param {(Int)} offset начало поиска
     * @returns {(Int)} позиция подстроки в строке
     */
    static strpos(haystack, needle, offset := 1) {
        return InStr(haystack, needle, CaseSense := 0, offset)
    }

    /**
     * Определение длины строки
     * @deprecated
     * @param {(String)} str строка
     * @returns {(Int)} длина строки
     */
    static strlen(str) {
        return StrLen(str)
    }

    /**
     * Переводит строку в нижний регистр
     * @deprecated
     * @param {(String)} $str строка
     * @returns {(String)} строка в нижнем регистре
     */
    static strtolower(str) {
        return StrLower(str)
    }
    
    /**
     * Переводит строку в верхний регистр
     * @deprecated
     * @param {(String)} str строка
     * @returns {(String)} строка в верхнем регистре
     */
    static strtoupper(str) {
        return StrUpper(str)
    }

    /**
     * Поиск подстроки в строке справа
     * @param {(String)} haystack строка, в которой искать
     * @param {(String)} needle подстрока, которую нужно найти
     * @param {(Int)} offset начало поиска
     * @returns {(Int)} позиция подстроки в строке
     */
    static strrpos(haystack, needle, offset:=0) {
        return InStr(haystack, needle,, StrLen(haystack-1), +1)
    }
    
    /**
     * Проверяет в нижнем ли регистре находится строка
     * @param {(String)} phrase строка
     * @returns {(Boolean)} в нижнем ли регистре строка 
     */
    static isLowerCase(phrase) {
        return (phrase == StrLower(phrase))
    }
    
     /**
     * Проверяет в верхнем ли регистре находится строка
     * @param {(String)} phrase строка
     * @returns {(Boolean)} в верхнем ли регистре строка 
     */
    static isUpperCase(phrase) {
        return (phrase == StrUpper(phrase))
    }
    
    /**
     * Превращает строку в массив букв
     * @param {(String)} phrase строка
     * @returns {(Array)} массив букв
     */
    static splitLetters(phrase) {
        lettersArr := []
        loop parse phrase
            lettersArr.Push(A_LoopField)
        return lettersArr
    }
    
    /**
     * Соединяет массив букв в строку
     * @param {(Array)} lettersArr массив букв
     * @returns {(String)} строка
     */
    static connectLetters(lettersArr) {
        res := ""
        for letter in lettersArr
            res .= letter
        return res
    }
    
    static implode(separator, lettersArr) {
        res := ""
        for letter in lettersArr {
            res .= letter
            if A_Index < lettersArr.Length
                res .= separator
        }
        return res
    }

    /**
     * Разбивает строку на части использую шаблон
     * @param {(String)} pattern шаблон разбития
     * @param {(String)} Str строка, которую нужно разбить
     * @returns {(Array)} разбитый массив 
     */
    static explode(pattern, Str) {

        return RegExSplit(Str, pattern)

        /**
         * @description {@link https://www.autohotkey.com/boards/viewtopic.php?p=331034#p331034}
         * @param String 
         * @param Delimiter 
         * @param OmitChars 
         * @param MaxParts 
         * @returns {(Array)} 
         */
        RegExSplit(String, Delimiter := "", OmitChars := "", MaxParts := -1) {
            uFFFF := Chr(0xFFFF)
        
            ; early exit, split by chars
            if (Delimiter = "")
                return StrSplit(String, Delimiter, OmitChars, MaxParts)
        
            return StrSplit(RegExReplace(String, Delimiter, uFFFF), uFFFF, OmitChars, MaxParts)
        }

    }
}

/**
 * <b>NCL NameCase Core</b>
 *
 * Набор основных функций, который позволяют сделать интерфейс слонения русского и украниского языка
 * абсолютно одинаковым. Содержит все функции для внешнего взаимодействия с библиотекой.
 *
 * @author Андрей Чайка <bymer3@gmail.com>
 * @version 0.4.1
 * @package NameCaseLib
 */
class NCLNameCaseCore extends NCL {

    /**
     * Версия библиотеки
     * @property {(String)} Version
     */
    Version => '0.4.1'
    /**
     * Версия языкового файла
     * @property {(String)} LanguageBuild
     */
    LanguageBuild => '0'

    __Init() {
       this._Ready := false
       this._Finished := false
       this._Words := []
       this._WorkingWord := ""
       this._WorkingLastCache := Map()
       this._LastRule := 0
       this._LastResult := []
       this._Index := Map()
       this._Gender_koef := 0 
    }
    /**
     * Готовность системы:
     * - Все слова идентифицированы (известо к какой части ФИО относится слово)
     * - У всех слов определен пол
     * Если все сделано стоит флаг `true`, при добавлении нового слова флаг сбрасывается на `false`
     * @property {(Boolean)} Ready
     */
    Ready {
        get {
            return this._Ready
        }
        set {
            this._Ready := Value
        }
    }
    /**
     * Если все текущие слова было просклонены и в каждом слове уже есть результат склонения,
     * тогда `true`. Если было добавлено новое слово флаг сбрасывается на `false`
     * @property {(Boolean)} Finished
     */
    Finished {
        get {
            return this._Finished
        }
        set {
            this._Finished := Value
        }
    }
    /**
     * Массив содержит елементы типа `NCLNameCaseWord`. Это все слова которые нужно обработать и просклонять
     * @property {(Array)} Words
     */
    Words {
        get {
            return this._Words
        }
        set {
            this._Words := Value
        }
    }
    /**
     * Переменная, в которую заносится слово с которым сейчас идет работа
     * @property {(String)} WorkingWord
     */
    WorkingWord {
        get {
            return this._WorkingWord
        }
        set {
            this._WorkingWord := Value
        }
    }
    /**
     * Метод `Last()` вырезает подстроки разной длины. Посколько одинаковых вызовов бывает несколько,
     * то все результаты выполнения кешируются в этом массиве.
     * @property {(Map)} WorkingLastCache
     */
    WorkingLastCache {
        get {
            return this._WorkingLastCache
        }
        set {
            this._WorkingLastCache := Value
        }
    }
    /**
     * Номер последнего использованого правила, устанавливается методом `Rule()`
     * @property {(Int)} LastRule
     */
    LastRule {
        get {
            return this._LastRule
        }
        set {
            this._LastRule := Value
        }
    }
    /**
     * Массив содержит результат склонения слова - слово во всех падежах
     * @property {(Array)} LastResult
     */
    LastResult {
        get {
            return this._LastResult
        }
        set {
            this._LastResult := Value
        }
    }
    /**
     * Словарь содержит информацию о том какие слова из массива `this.Words` относятся к
     * фамилии, какие к отчеству а какие к имени. Массив нужен потому, что при добавлении слов мы не
     * всегда знаем какая часть ФИО сейчас, поэтому после идентификации всех слов генерируется массив
     * индексов для быстрого поиска в дальнейшем.
     * @property {(Map)} Index
     */
    Index {
        get {
            return this._Index
        }
        set {
            this._Index := Value
        }
    }

    /**
     * Вероятность автоопредления пола [0..10]. Достаточно точно при 0.1
     * @property {(Float)} Gender_koef
     */
    Gender_koef {
        get {
            return this._Gender_koef
        }
        set {
            this._Gender_koef := Value
        }
    }

    /**
     * Метод очищает результаты последнего склонения слова. Нужен при склонении нескольких слов.
     */
    Reset() {
        this.LastRule := 0
        this.LastResult := []
    }

    /**
     * Сбрасывает все информацию на начальную. Очищает все слова добавленые в систему.
     * 
     * После выполнения система готова работать с начала.
     * @returns {(NCLNameCaseCore)}
     */
    FullReset() {
        this.Words := []
        this.Index := Map('N', [], 'F', [], 'S', [])
        this.Reset()
        this.NotReady()
        return this
    }

    /**
     * Устанавливает флаги о том, что система не готово и слова еще не были просклонены.
     */
    NotReady() {
        this.Ready := false
        this.Finished := false
    }

    /**
     * Устанавливает номер последнего правила.
     * @param {(Int)} Index номер правила которое нужно установить.
     */
    Rule(Index) {
        this.LastRule := Index
    }

    /**
     * Устанавливает слово текущим для работы системы. Очищает кеш слова.
     * @param {(String)} Word слово, которое нужно установить
     */
    SetWorkingWord(Word) {
        ; Сбрасываем настройки
        this.Reset()
        ; Ставим слово
        this.WorkingWord := Word
        ; Чистим кеш
        this.WorkingLastCache := Map()
    }

    /**
     * Если не нужно склонять слово, делает результат таким же, как и именительный падеж.
     */
    MakeResultTheSame() {
        loop this.CaseCount {
            this.LastResult[A_Index] := this.WorkingWord
        }
    }

    /**
     * Если `StopAfter = 0`, вырезает `Length` последних букв из текущего слова (`this.workingWord`).
     * 
     * Если нет, тогда вырезает `StopAfter` букв, начиная от `Length` с конца.
     * @param {(Int)} Length количество букв с конца
     * @param {(Int)} StopAfter количество букв, которое нужно вырезать (0 - все)
     * @returns {(String)} требуемая подстрока
     */
    Last(Length := 1, StopAfter := 0) {
        ; Сколько букв нужно вырезать все или только часть
        if (!StopAfter) {
            cut := Length
        } else {
            cut := StopAfter
        }

        ; return NCLStr.substr(this.workingWord, -length, cut) "`n"

        ; ПРИШЛОСЬ ЗАБИТЬ НА КЭШ, Т.К. НЕ РАЗОБРАЛСЯ С НИМ
        
        ; Initialize first-level if missing
        if !this.WorkingLastCache.Has(Length)
            this.WorkingLastCache[Length] := Map()

        ; Initialize value if missing
        if !this.WorkingLastCache[Length].Has(StopAfter) {
            ; Equivalent of PHP's substr($this->workingWord, -$length, $cut)
            startPos := StrLen(this.workingWord) - Length + 1
            substring := SubStr(this.workingWord, startPos, cut)
            this.WorkingLastCache[Length][StopAfter] := substring
        }

        return this.WorkingLastCache[Length][StopAfter]
        /*

        ;Проверяем кеш
        if (!(this.WorkingLastCache[length].Has(stopAfter))) {
            this.WorkingLastCache[length][stopAfter] := NCLStr.substr(this.workingWord, -length, cut)
        }
        
        return this.WorkingLastCache[length][stopAfter]
        */
    }

    /**
     * Над текущим словом (`this.WorkingWord`) выполняются правила в порядке указаном в `RulesArray`.
     * 
     * `Gender` служит для указания того, какие правила использовать мужские (`man`) или женские (`woman`).
     * @param {(String)} Gender префикс мужских/женских правил.
     * @param {(Array)} RulesArray массив, порядок выполнения правил.
     * @returns {(Boolean)} если правило было задествовано - `true`, если нет - `false`.
     */
    RulesChain(Gender, RulesArray) {
        for RuleID in RulesArray {
            RuleMethod := Gender . "Rule" . RuleID
            if this.%RuleMethod%() {
                return true
            }
        }
        return false
    }

    /**
     * Если `String` строка, тогда проверяется входит ли буква `Letter` в строку `String`.
     * 
     * Если `String` массив, тогда проверяется входит ли строка `Letter` в массив `String`.
     * @param {(String)} Letter буква или строка, которую нужно искать.
     * @param {(Array|String)} String строка или массив, в котором нужно искать.
     * @returns {(Boolean)} `true`, если искомое значение найдено.
     */
    Contains(Letter, String) {
        ; Если второй параметр массив
        if (Type(String) = "Array") {
            for k, v in String {
                if v = Letter {
                    return true
                }
            }
            return false
        } else {
            if (!Letter || NCLStr.strpos(String, Letter) == false) {
                return false
            } else {
                return true
            }
        }
    }

    /**
     * CUSTOM AHK COUNTERPART FOR in_array() in PHP
     * @param {(String)} Needle
     * @param {(Array)} Haystack
     * @param {(Boolean)} Strict
     * @returns {(Boolean)}
     */
    InArray(Needle, Haystack, Strict := false) {
        for k, v in Haystack {
            if strict {
                if v == Needle {
                    return true
                }
            } else {
                if v = Needle {
                    return true
                }
            }
        }
        return false
    }

    /**
     * Функция проверяет, входит ли имя `NameNeedle` в перечень имен `Names`.
     * @param {(String)} NameNeedle - имя которое нужно найти.
     * @param {(Array)} Names - перечень имен в котором нужно найти имя.
     * @returns {(Boolean)}
     */
    InNames(NameNeedle, Names) {
        if Type(Names) != "Array" {
            Names := Array(Names)
        }

        for name in Names {
            if (StrLower(NameNeedle) == StrLower(name)) {
                return true
            }
        }
        return false
    }

    /**
     * Склоняет слово `Word`, удаляя из него `ReplaceLast` последних букв
     * и добавляя в каждый падеж окончание из массива `Endings`.
     * @param {(String)} Word слово, к которому нужно добавить окончания
     * @param {(Array)} Endings массив окончаний
     * @param {(Int)} ReplaceLast сколько последних букв нужно убрать с начального слова
     */
    WordForms(Word, Endings, ReplaceLast := 0) {
        ; Создаем массив с именительный падежом
        Result := [this.WorkingWord]
        Result.Length := this.CaseCount
        ; Убираем в окончание лишние буквы
        Word := SubStr(Word, 1, StrLen(Word) - ReplaceLast)

        ; Добавляем окончания
        PadegIndex := 1
        while PadegIndex < this.CaseCount {
            Result[PadegIndex+1] := Word . Endings[PadegIndex]
            PadegIndex++
        }

        this.LastResult := Result
    }

    /**
     * В массив `this.Words` добавляется новый объект класса `NCLNameCaseWord`
     * со словом `Firstname` и пометкой, что это имя.
     * @param {(String)} Firstname имя.
     * @returns {(NCLNameCaseCore)}
     */
    SetFirstName(Firstname?) {
        if IsSet(Firstname) {
            Index := this.Words.Length + 1
            this.Words.Push(NCLNameCaseWord(Firstname))
            this.Words[-1].SetNamePart('N')
            this.NotReady()
        }
        return this
    }

    /**
     * В массив `this.Words` добавляется новый объект класса `NCLNameCaseWord`
     * со словом `Secondname` и пометкой, что это фамилия.
     * @param {(String)} Secondname фамилия.
     * @returns {(NCLNameCaseCore)}
     */
    SetSecondName(Secondname?) {
        if IsSet(Secondname) {
            Index := this.Words.Length + 1
            this.Words.Push(NCLNameCaseWord(Secondname))
            this.Words[Index].SetNamePart('S')
            this.NotReady()
        }
        return this
}

    /**
     * В массив `This.Words` добавляется новый объект класса `NCLNameCaseWord`
     * со словом `Fathername` и пометкой, что это отчество.
     * @param {(String)} Fathername отчество
     * @returns {(NCLNameCaseCore)}
     */
    SetFatherName(Fathername?) {
        if IsSet(Fathername) {
            Index := this.Words.Length + 1
            this.Words.Push(NCLNameCaseWord(Fathername))
            this.Words[Index].SetNamePart('F')
            this.NotReady()
        }
        return this
    }

    /**
     * Всем словам устанавливается пол, который может иметь следующие значения:
     * 
     * - `0` - не определено
     * - `NCL.MAN` - мужчина
     * - `NCL.WOMAN` - женщина
     * @param {(Int)} Gender пол, который нужно установить
     * @returns {(NCLNameCaseCore)}
     */
    SetGender(Gender := 0) {
        for word in this.Words {
            word.SetTrueGender(Gender)
        }
        return this
    }

    /**
     * В систему заносится сразу фамилия, имя, отчество.
     * @param {(String)} SecondName фамилия
     * @param {(String)} FirstName имя
     * @param {(String)} FatherName отчество
     * @returns {(NCLNameCaseCore)}
     */
    SetFullName(SecondName?, FirstName?, FatherName?) {
        this.SetFirstName(FirstName?)
        this.SetSecondName(SecondName?)
        this.SetFatherName(FatherName?)
        return this
    }

    /**
     * В массив `this.Words` добавляется новый объект класса `NCLNameCaseWord`.
     * со словом `Firstname` и пометкой, что это имя
     * @param {(String)} Firstname имя
     * @returns {(NCLNameCaseCore)}
     */
    SetName(Firstname?) => this.SetFirstName(Firstname?)
    

    /**
     * В массив `this.Words` добавляется новый объект класса `NCLNameCaseWord`
     * со словом `Secondname` и пометкой, что это фамилия.
     * @param {(String)} Secondname фамилия
     * @return {(NCLNameCaseCore)}
     */
    SetLastName(Secondname?) => this.SetSecondName(Secondname?)
    

    /**
     * В массив `this.Words` добавляется новый объект класса `NCLNameCaseWord`
     * со словом `Secondname` и пометкой, что это фамилия.
     * @param {(String)} Secondname фамилия
     * @return {(NCLNameCaseCore)}
     */
    SetSirName(Secondname?) => this.SetSecondName(Secondname?)

    /**
     * Если слово `Word` не идентифицировано, тогда определяется это имя, фамилия или отчество.
     * @param {(NCLNameCaseWord)} Word слово, которое нужно идентифицировать
     */
    PrepareNamePart(Word) {
        if (Word.GetNamePart() = "") {
            this.DetectNamePart(Word)
        }
    }

    /**
     * Проверяет все ли слова идентифицированы, если нет тогда для каждого определяется это имя, фамилия или отчество.
     */
    PrepareAllNameParts() {
        for word in this.Words {
            this.PrepareNamePart(word)
        }
    }

    /**
     * Определяет пол для слова `Word`.
     * @param {(NCLNameCaseWord)} Word слово для которого нужно определить пол
     */
    PrepareGender(Word) {
        if Type(Word) != "NCLNameCaseWord"
            throw TypeError(A_LineFile A_Tab A_ThisFunc A_Tab "Параметром должен был объект типа 'NCLNameCaseWord', но вместо него - " Type(Word))
        if (!Word.IsGenderSolved()) {
            NamePart := Word.getNamePart()
            Switch (NamePart) {
                Case 'N': this.GenderByFirstName(Word)
                Case 'F': this.GenderByFatherName(Word)
                Case 'S': this.GenderBySecondName(Word)
            }
        }
    }

    /**
     * Для всех слов проверяет определен ли пол, если нет - определяет его.
     * 
     * После этого расчитывает пол для всех слов и устанавливает такой пол всем словам.
     * @returns {(Boolean)} был ли определен пол
     */
    SolveGender() {
        ; Ищем, может гдето пол уже установлен
        for word in this.Words {
            if (word.IsGenderSolved()) {
                this.SetGender(word.Gender())
                return true
            }
        }

        ; Если нет тогда определяем у каждого слова и потом сумируем
        Man := 0
        Woman := 0

        for word in this.Words {
            this.PrepareGender(word)
            Gender := word.GetGender()
            Man += Gender[NCL.MAN]
            Woman += Gender[NCL.WOMAN]
        }

        if (Man > Woman) {
            this.SetGender(NCL.MAN)
        } else {
            this.SetGender(NCL.WOMAN)
        }

        return true
    }

    /**
     * Генерируется массив, который содержит информацию о том, какие слова из массива `this.Words` относятся к
     * фамилии, какие к отчеству, а какие к имени. Массив нужен потому, что при добавлении слов мы не
     * всегда знаем какая часть ФИО сейчас, поэтому после идентификации всех слов генерируется массив
     * индексов для быстрого поиска в дальнейшем.
     */
    GenerateIndex() {
        this.Index := Map("N", [], "S", [], "F", [])
        for index, word in this.Words {
            Namepart := word.GetNamePart()
            this.index[Namepart] := index
        }
    }

    /**
     * Выполнет все необходимые подготовления для склонения.
     * Все слова идентфицируются. Определяется пол.
     * Обновляется индекс.
     */
    PrepareEverything() {
        if (!this.Ready) {
            this.PrepareAllNameParts()
            this.SolveGender()
            this.GenerateIndex()
            this.Ready := true
        }
    }

    /**
     * По указаным словам определяется пол человека:
     * - `0` - не определено
     * - `NCL.MAN` - мужчина
     * - `NCL.WOMAN` - женщина
     * @returns {(Int)} текущий пол человека
     */
    GenderAutoDetect() {
        this.PrepareEverything()

        if (this.Words.Length != 0) {
            n :=-1
            MaxCoef :=-1
            for k, word in this.Words {
                Genders := word.GetGender()
                _min := Min(Genders)
                _max := Max(Genders)
                Coef := _max-_min
                if (Coef > MaxCoef) {
                    MaxCoef := Coef
                    n := k
                }
            }

            if (n >= 0) {
                if (this.Words.Has(n)) {
                    Genders := this.Words[n].GetGender()
                    _min := Min(Genders)
                    _max := Max(Genders)
                    this.Gender_koef := _max-_min

                    return this.Words[n].Gender()
                }
            }
        }
        return false
    }

    /**
     * Разбивает строку `Fullname` на слова и возвращает формат, в котором записано имя.
     * 
     * <b>Формат:</b>
     * - S - Фамилия
     * - N - Имя
     * - F - Отчество
     * @param {(String)} Fullname строка, для которой необходимо определить формат
     * @returns {(Array)} формат, в котором записано имя. Массив типа `this.Words`
     */
    SplitFullName(Fullname) {

        Fullname := Trim(Fullname)
        List := NCLStr.explode(" ", Fullname)
        
        for word in List {
            this.Words.Push(NCLNameCaseWord(word))
        }
        
        this.PrepareEverything()
        FormatArr := []
        
        for word in this.Words {
            FormatArr.Push(word.GetNamePart())
        }

        return this.Words
    }

    /**
     * Разбивает строку `Fullname` на слова и возвращает формат, в котором записано имя.
     * 
     * <b>Формат:</b>
     * - S - Фамилия
     * - N - Имя
     * - F - Отчество
     * @param {(String)} Fullname строка, для которой необходимо определить формат
     * @returns {(String)} формат в котором записано имя
     */
    GetFullNameFormat(Fullname) {
        this.FullReset()
        Words := this.SplitFullName(Fullname)
        Format := ""
        for word in Words {
            Format .= word.GetNamePart()
            if A_Index != Words.Length
                Format .= " "
        }
        return Format
    }

    /**
     * Склоняет слово `Word` по нужным правилам, в зависимости от пола и типа слова.
     * @param {(NCLNameCaseWord)} Word слово, которое нужно просклонять
     */
    WordCase(Word) {
        if Type(Word) != "NCLNameCaseWord"
            throw TypeError(A_LineFile A_Tab A_ThisFunc A_Tab "Параметром должен был объект типа 'NCLNameCaseWord', но вместо него - " Type(Word))
        Gender := (Word.Gender() == NCL.MAN ? "man" : "woman")
        
        NamePartLetter := Word.GetNamePart()
        switch NamePartLetter {
            case 'F': Namepart := "Father"
            case 'N': Namepart := "First"
            case 'S': Namepart := "Second"
        }

        Method := Gender . Namepart . "Name"

        /**
         * Если фамилия из 2х слов через дефис {@link http://new.gramota.ru/spravka/buro/search-answer?s=273912},  
         * разбиваем слово с дефисами на части
         */
        Temp := Word.GetWordOrig()
        CurWords := NCLStr.explode('-', Temp)
        OCurWords := []

        Result := []
        Result.Length := this.CaseCount
        LastRule := -1

        Count := CurWords.Length
        for k, cur_word in CurWords {
            IsNormalRules := true

            ONcw := NCLNameCaseWord(cur_word)
            if ((NamePartLetter == "S") && (Count > 1) && (k < Count - 1)) {
                ; если первая часть фамилии тоже фамилия, то склоняем по общим правилам
                ; иначе не склоняется

                Exclusion := ["тулуз"] ;исключения
                CurWord_ := StrLower(cur_word)

                HasExclusion := false
                for k, v in Exclusion {
                    if v = CurWord_ {
                        HasExclusion := true
                        break
                    }
                }

                if HasExclusion = false {
                    ONc := NCLNameCaseRu()
                    ONc.DetectNamePart(ONcw)
                    IsNormalRules := (ONcw.getNamePart() == "S")
                }
                else {
                    IsNormalRules := false
                }
            }

            this.SetWorkingWord(cur_word)

            ThisMethodResult := this.%Method%()
            if (IsNormalRules && ThisMethodResult) {
                ; склоняется
                ResultTemp := this.LastResult
                LastRule := this.LastRule
            } else {
                ; не склоняется. Заполняем что есть
                ResultTemp := []
                ResultTemp.Length := this.CaseCount
                loop this.CaseCount
                    ResultTemp[A_Index] := cur_word
                LastRule :=-1
            }

            ONcw.SetNameCases(ResultTemp)
            OCurWords.Push(ONcw)
        }

        ; объединение пачку частей слова в одно слово по каждому падежу
        for ONcw in OCurWords {
            Namecases := ONcw.GetNameCases()
            for k, namecase in Namecases {
                if Result.Has(k)
                    Result[k] := Result[k] . "-" . namecase
                else
                    Result[k] := namecase
            }
        }

        ; устанавливаем падежи для целого слова
        Word.SetNameCases(Result, false)
        Word.SetRule(LastRule)
    }

    /**
     * Производит склонение всех слов, который хранятся в массиве `this.Words`.
     */
    AllWordCases() {
        if (!this.Finished) {
            this.PrepareEverything()

            for word in this.Words {
                this.WordCase(word)
            }

            this.Finished := true
        }
    }

    /**
     * Если указан номер падежа `Number`, возвращается строка с таким номером падежа.  
     * Если нет - возвращается массив со всеми падежами текущего слова.
     * @param {(NCLNameCaseWord)} Word слово, для которого нужно вернуть падеж
     * @param {(Int)} Number номер падежа, который нужно вернуть
     * @return {(Array|String)} с нужным падежом
     */
    GetWordCase(Word, Number?) {
        if Type(Word) != "NCLNameCaseWord"
            throw TypeError(A_LineFile A_Tab A_ThisFunc A_Tab "Параметром должен был объект типа 'NCLNameCaseWord', но вместо него - " Type(Word))
        Cases := Word.GetNameCases()
        if (!IsSet(Number)) or (Number < 0) or (Number > this.CaseCount) {
            return Cases
        } else  {
            return Cases[Number]
        }
    }

    /**
     * Если нужно просклонять несколько слов, то их необходимо собрать в одну строку.
     * Эта функция собирает все слова, указанные в `IndexArray`  в одну строку.
     * @param {(Array)} IndexArray индексы слов, которые необходимо собрать вместе
     * @param {(Int)} Number номер падежа
     * @returns {(Array|String)} либо массив со всеми падежами, либо строка с одним падежом
     */
    GetCasesConnected(IndexArray, Number := unset) {
        ReadyArr := []
        if (Type(IndexArray) != "Array") {
            ; Convert to single-element array
            IndexArray := [IndexArray]
        }
        for index in IndexArray {
            ReadyArr.Push(this.getWordCase(this.words[index], Number?))
        }
        
        All := ReadyArr.Length
        if All {
            if (Type(ReadyArr[1]) = "Array") {
                ; Массив нужно скелить каждый падеж
                ResultArr := []
                ResultArr.Length := 6
                _Case := 1
                while (_Case <= this.CaseCount) {
                    Temp := []
                    i := 1
                    while i <= All {
                        Temp.Push(ReadyArr[i][_Case])
                        i++
                    }
                    ResultArr[_Case] := NCLStr.implode(' ', Temp)
                    _Case++
                }
                return ResultArr
            } else {
                return NCLStr.implode(' ', ReadyArr)
            }
        }
        return ""
    }

    /**
     * Функция ставит имя в нужный падеж.
     *
     * Если указан номер падежа `Number`, возвращается строка с таким номером падежа.
     * Если нет - возвращается массив со всеми падежами текущего слова.
     * @param {(Int)} Number номер падежа
     * @returns {(Array|String)} с нужным падежом
     */
    GetFirstNameCase(Number := unset) {
        this.AllWordCases()

        return this.GetCasesConnected(this.Index['N'], Number?)
    }

    /**
     * Функция ставит фамилию в нужный падеж.
     *
     * Если указан номер падежа `Number`, возвращается строка с таким номером падежа.
     * Если нет - возвращается массив со всеми падежами текущего слова.
     * @param {(Int)} Number номер падежа
     * @returns {(Array|String)} массив или строка с нужным падежом
     */
    GetSecondNameCase(Number := unset) {
        this.AllWordCases()

        return this.GetCasesConnected(this.Index['S'], Number?)
    }

    /**
     * Функция ставит отчество в нужный падеж.
     *
     * Если указан номер падежа `Number`, возвращается строка с таким номером падежа.  
     * Если нет - возвращается массив со всеми падежами текущего слова.
     * @param {(Int)} Number номер падежа
     * @returns {(Array|String)} массив или строка с нужным падежом
     */
    GetFatherNameCase(Number := unset) {
        this.AllWordCases()

        return this.GetCasesConnected(this.Index['F'], Number?)
    }

    /**
     * Функция ставит имя `FirstName` в нужный падеж `CaseNumber` по правилам пола `Gender`.
     *
     * Если указан номер падежа `CaseNumber`, возвращается строка с таким номером падежа.  
     * Если нет - возвращается массив со всеми падежами текущего слова.
     * @param {(String)} FirstName имя, которое нужно просклонять
     * @param {(Int)} CaseNumber номер падежа
     * @param {(Int)} Gender пол, который нужно использовать
     * @returns {(Array|String)} массив или строка с нужным падежом
     */
    qFirstName(FirstName, CaseNumber?, Gender := 0) {
        this.FullReset()
        this.SetFirstName(FirstName)
        if (Gender) {
            this.SetGender(Gender)
        }
        return this.GetFirstNameCase(CaseNumber?)
    }

    /**
     * Функция ставит фамилию `SecondName` в нужный падеж `CaseNumber` по правилам пола `Gender`.
     *
     * Если указан номер падежа `CaseNumber`, возвращается строка с таким номером падежа.
     * Если нет - возвращается массив со всеми падежами текущего слова.
     * @param {(String)} SecondName фамилия, которую нужно просклонять
     * @param {(Int)} CaseNumber номер падежа
     * @param {(Int)} Gender пол, который нужно использовать
     * @returns {(Array|String)} массив или строка с нужным падежом
     */
    qSecondName(SecondName, CaseNumber := unset, Gender := 0) {
        this.FullReset()
        this.SetSecondName(SecondName)
        if (Gender) {
            this.SetGender(Gender)
        }

        return this.GetSecondNameCase(CaseNumber?)
    }

    /**
     * Функция ставит отчество `FatherName` в нужный падеж `CaseNumber` по правилам пола `Gender`.
     *
     * Если указан номер падежа `CaseNumber`, тогда возвращается строка с таким номером падежа.
     * Если нет - возвращается массив со всеми падежами текущего слова.
     * @param {(String)} FatherName отчество, которое нужно просклонять
     * @param {(Int)} CaseNumber номер падежа
     * @param {(Int)} Gender пол, который нужно использовать
     * @returns {(Array|String)} массив или строка с нужным падежом
     */
    qFatherName(FatherName, CaseNumber := unset, Gender := 0) {
        this.FullReset()
        this.SetFatherName(FatherName)
        if (Gender) {
            this.SetGender(Gender)
        }
        return this.GetFatherNameCase(CaseNumber?)
}

    /**
     * Склоняет текущие слова во все падежи и форматирует слово по шаблону `Format`
     * <b>Формат:</b>
     * - S - Фамилия
     * - N - Имя
     * - F - Отчество
     * @param {(String)} Format строка формат
     * @returns {(Array)} массив со всеми падежами
     */
    GetFormattedArray(Format) {
        if (Type(Format) = "Array") {
            return this.GetFormattedArrayHard(Format)
        }

        Length := StrLen(Format)
        Result := []
        Cases := Map()
        Cases.Set('S', this.GetCasesConnected(this.Index['S']))
        Cases.Set('N', this.GetCasesConnected(this.Index['N']))
        Cases.Set('F', this.GetCasesConnected(this.Index['F']))

        CurCase := 1
        while (CurCase <= this.CaseCount) {
            Line := ""
            i := 1
            while (i <= Length) {
                symbol := SubStr(Format, i, 1)
                switch symbol {
                    case "S": Line .= Cases["S"][CurCase]
                    case "N": Line .= Cases["N"][CurCase]
                    case "F": Line .= Cases["F"][CurCase]
                    default: Line .= symbol
                }
                /**
                if (symbol == 'S') {
                    Line .= Cases['S'][CurCase]
                } else if (symbol == 'N') {
                    Line .= Cases['N'][CurCase]
                } else if (symbol == 'F') {
                    Line .= Cases['F'][CurCase]
                } else {
                    Line .= symbol
                }
                */
                i++
            }
            Result.Push(Line)
            CurCase++
        }
        return Result
    }

    /**
     * Склоняет текущие слова во все падежи и форматирует слово по шаблону `Format`.
     * 
     * <b>Формат:</b>
     * - S - Фамилия
     * - N - Имя
     * - F - Отчество
     * @param {(Array)} Format массив с форматом
     * @returns {(Array)} массив со всеми падежами
     */
    GetFormattedArrayHard(Format) {
        Result := []
        Cases := []
        for word in Format {
            Cases.Push(word.GetNameCases())
        }
        CurCase := 1
        while (CurCase < this.CaseCount) {
            Line := ""
            for value in Cases {
                Line .= value[CurCase] . " "
            }
            Result.Push(Trim(Line))
            CurCase++
        }
        return Result
    }

    /**
     * Склоняет текущие слова в падеж `CaseNum` и форматирует слово по шаблону `Format`.
     * 
     * <b>Формат:</b>
     * - S - Фамилия
     * - N - Имя
     * - F - Отчество
     * @param {(Int)} CaseNum номер падежа
     * @param {(Array)} Format массив с форматом
     * @returns {(String)} строка в нужном падеже
     */
    GetFormattedHard(CaseNum?, Format := []) {
        Result := ""
        for word in Format {
            Cases := word.GetNameCases()
            Result .= Cases[IsSet(CaseNum) ? CaseNum : 1] . " "
        }
        return Trim(Result)
    }

    /**
     * Склоняет текущие слова в падеж `CaseNum` и форматирует слово по шаблону `Format`.  
     * <b>Формат:</b>
     * - S - Фамилия
     * - N - Имя
     * - F - Отчество
     * @param {(Int)} CaseNum номер падежа
     * @param {(String)} Format строка с форматом
     * @returns {(String)} строка в нужном падеже
     */
    GetFormatted(CaseNum?, Format := "S N F") {
        this.AllWordCases()
        ; Если не указан падеж используем другую функцию
        if !IsSet(CaseNum) {
            return this.GetFormattedArray(Format)
        }
        ; Если формат сложный
        else if (Type(Format) = "Array") {
            return this.GetFormattedHard(CaseNum?, Format)
        }
        else {
            Result := ""
            
            Loop Parse Format {
                Switch A_LoopField {
                    Case "S":
                        v := this.GetSecondNameCase(CaseNum)
                        Result .= Type(v) = "Array" ? v[CaseNum] : v
                    Case "N":
                        v := this.GetFirstNameCase(CaseNum)
                        Result .= Type(v) = "Array" ? v[CaseNum] : v
                    Case "F":
                        v := this.GetFatherNameCase(CaseNum)
                        Result .= Type(v) = "Array" ? v[CaseNum] : v
                    Default: Result .= A_LoopField
                }
            }
            return Result
        }
    }

    /**
     * Склоняет фамилию `SecondName`, имя `FirstName`, отчество `FatherName`
     * в падеж `CaseNum` по правилам пола `Gender` и форматирует результат по шаблону `Format`.  
     * <b>Формат:</b>
     * - S - Фамилия
     * - N - Имя
     * - F - Отчество
     * @param {(String)} SecondName фамилия
     * @param {(String)} FirstName имя
     * @param {(String)} FatherName отчество
     * @param {(Int)} Gender пол
     * @param {(Int)} CaseNum номер падежа
     * @param {(String)} Format формат
     * @returns {(Array|String)} либо массив со всеми падежами, либо строка
     */
    qFullName(SecondName?, FirstName?, FatherName?, Gender?, CaseNum?, Format := "S N F") {
        this.FullReset()
        this.SetFirstName(FirstName?)
        this.SetSecondName(SecondName?)
        this.SetFatherName(FatherName?)
        if IsSet(Gender) {
            this.SetGender(Gender)
        }

        return this.GetFormatted(CaseNum?, Format)
    }

    /**
     * Склоняет ФИО `FullName` в падеж `CaseNum` по правилам пола `Gender`.
     * Возвращает результат в таком же формате, как он и был.
     * @param {(String)} FullName ФИО
     * @param {(Int)} CaseNum номер падежа
     * @param {(Int)} Gender пол человека
     * @returns {(Array|String)} либо массив со всеми падежами, либо строка
     */
    q(FullName, CaseNum?, Gender?) {
        this.FullReset()
        Format := this.GetFullNameFormat(FullName)
        if IsSet(Gender) {
            this.SetGender(Gender)
        }
        return this.GetFormatted(CaseNum?, Format)
    }

    /**
     * Определяет пол человека по ФИО
     * @param {(String)} Fullname ФИО
     * @returns {(Int)} пол человека
     */
    GenderDetect(Fullname) {
        this.FullReset()
        this.SplitFullName(Fullname)
        return this.GenderAutoDetect()
    }

    /**
     * Возвращает внутренний массив `this.Words`, каждая запись имеет тип `NCLNameCaseWord`.
     * @returns {Array.<NCLNameCaseWord>} Массив всех слов в системе
     */
    GetWordsArray() => this.Words

    /**
     * Функция пытается применить цепочку правил для мужских имен.
     * @returns {(Boolean)} `true` - если было использовано правило из списка, `false` - если правило не было найденым
     */
    ManFirstName() => false

    /**
     * Функция пытается применить цепочку правил для женских имен.
     * @returns {(Boolean)} `true` - если было использовано правило из списка, `false` - если правило не было найденым
     */
    WomanFirstName() => false


    /**
     * Функция пытается применить цепочку правил для мужских фамилий.
     * @returns {(Boolean)} `true` - если было использовано правило из списка, `false` - если правило не было найденым
     */
    ManSecondName() => false

    /**
     * Функция пытается применить цепочку правил для женских фамилий.
     * @returns {(Boolean)} `true` - если было использовано правило из списка, `false` - если правило не было найденым
     */
    WomanSecondName() => false

    /**
     * Функция склоняет мужский отчества.
     * @returns {(Boolean)} `true` - если слово было успешно изменено, `false` - если не получилось этого сделать
     */
    ManFatherName() => false

    /**
     * Функция склоняет женские отчества.
     * @returns {(Boolean)} `true` - если слово было успешно изменено, `false` - если не получилось этого сделать
     */
    WomanFatherName() => false

    /**
     * ИЗНАЧАЛЬНО МЕТОД БЫЛ ПУСТОЙ ИЗ-ЗА НАСЛЕДОВАНИЯ. В КЛАССЕ NCLNAMECASERU ОПИСЫВАЛСЯ МЕТОД ПОД РУССКИЕ ИМЕНА, НО В AHK ОБРАТНОЙ НАСЛЕДТСВЕННОСТИ НЕТ (?) И ПУСТОЙ МЕТОД НЕ РАБОТАЛ.
     * 
     * Определение пола по правилам имен.
     * @param {(NCLNameCaseWord)} Word обьект класса слов, для которого нужно определить пол
     */
    GenderByFirstName(Word) {
        if Type(Word) != "NCLNameCaseWord"
            throw TypeError(A_LineFile A_Tab A_ThisFunc A_Tab "Параметром должен был объект типа 'NCLNameCaseWord', но вместо него - " Type(Word))
        this.setWorkingWord(Word.getWord())

        Man := 0 ; Мужчина
        Woman := 0 ; Женщина
        ; Попробуем выжать максимум из имени
        ; Если имя заканчивается на й, то скорее всего мужчина
        if (this.Last(1) == 'й') {
            Man += 0.9
        }

        ; 'по'=Филиппо; 'до'=Леонардо
        if (this.Contains(this.Last(2), ['он', 'ов', 'ав', 'ам', 'ол', 'ан', 'рд', 'мп', 'по', 'до', 'др', 'рт'])) {
            Man += 0.3
        }
        
        if (this.Contains(this.Last(1), this.consonant)) {
            Man += 0.01
        }

        if (this.Last(1) == 'ь') {
            Man += 0.02
        }

        if (this.Contains(this.Last(2), ['вь', 'фь', 'ль', 'на'])) {
            Woman += 0.1
        }

        if (this.Contains(this.Last(2), ['ла'])) {
            Woman += 0.04
        }

        if (this.Contains(this.Last(2), ['то', 'ма'])) {
            Man += 0.01
        }

        ; 'эль' =Рафаэль, Габриэль; 'реа'=Андреа
        if (this.Contains(this.Last(3), ['лья', 'вва', 'ока', 'ука', 'ита', 'эль', 'реа'])) {
            Man += 0.2
        }

        if (this.Contains(this.Last(3), ['има'])) {
            Woman += 0.15
        }

        if (this.Contains(this.Last(3), ['лия', 'ния', 'сия', 'дра', 'лла', 'кла', 'опа', 'вия'])) {
            Woman += 0.5
        }

        if (this.Contains(this.Last(4), ['льда', 'фира', 'нина', 'лита', 'алья'])) {
            Woman += 0.5
        }
        
        if (this.InNames(this.workingWord, this.names_man)) {
            Man += 10
        }
        
        if (this.InNames(this.workingWord, ['Бриджет', 'Элизабет', 'Маргарет', 'Джанет', 'Жаклин', 'Эвелин'])) {
            Woman += 10
        }

        ; Исключение для Берил Кук, которая женщина
        if (this.InNames(this.workingWord, ['Берил'])) {
            Woman += 0.05
        }

        Word.SetGender(Man, Woman)
    }

    /**
     * ИЗНАЧАЛЬНО МЕТОД БЫЛ ПУСТОЙ ИЗ-ЗА НАСЛЕДОВАНИЯ. В КЛАССЕ NCLNAMECASERU ОПИСЫВАЛСЯ МЕТОД ПОД РУССКИЕ ИМЕНА, НО В AHK ОБРАТНОЙ НАСЛЕДТСВЕННОСТИ НЕТ (?) И ПУСТОЙ МЕТОД НЕ РАБОТАЛ.
     * 
     * Определение пола по правилам фамилий.
     * @param {(NCLNameCaseWord)} Word обьект класса слов, для которого нужно определить пол
     */
    GenderBySecondName(Word) {
        if Type(Word) != "NCLNameCaseWord"
            throw TypeError(A_LineFile A_Tab A_ThisFunc A_Tab "Параметром должен был объект типа 'NCLNameCaseWord', но вместо него - " Type(Word))
        this.SetWorkingWord(Word.GetWord())

        Man := 0 ; Мужчина
        Woman := 0 ; Женщина

        if (this.Contains(this.Last(2), ['ов', 'ин', 'ев', 'ий', 'ёв', 'ый', 'ын', 'ой'])) {
            Man += 0.4
        }

        if (this.Contains(this.Last(3), ['ова', 'ина', 'ева', 'ёва', 'ына', 'мин'])) {
            Woman += 0.4
        }

        if (this.Contains(this.Last(2), ['ая'])) {
            Woman += 0.4
        }

        Word.SetGender(Man, Woman)
    }

    /**
     * ИЗНАЧАЛЬНО МЕТОД БЫЛ ПУСТОЙ ИЗ-ЗА НАСЛЕДОВАНИЯ. В КЛАССЕ NCLNAMECASERU ОПИСЫВАЛСЯ МЕТОД ПОД РУССКИЕ ИМЕНА, НО В AHK ОБРАТНОЙ НАСЛЕДТСВЕННОСТИ НЕТ (?) И ПУСТОЙ МЕТОД НЕ РАБОТАЛ.
     * 
     * Определение пола по правилам отчеств.
     * @param {(NCLNameCaseWord)} Word обьект класса слов, для которого нужно определить пол
     */
    GenderByFatherName(Word) {
        if Type(Word) != "NCLNameCaseWord"
            throw TypeError(A_LineFile A_Tab A_ThisFunc A_Tab "Параметром должен был объект типа 'NCLNameCaseWord', но вместо него - " Type(Word))
        this.SetWorkingWord(Word.GetWord())

        if (this.Last(2) == 'ич') {
            Word.SetGender(10, 0) ; мужчина
        }
        if (this.Last(2) == 'на') {
            Word.SetGender(0, 12) ; женщина
        }
    }

    /**
     * ИЗНАЧАЛЬНО МЕТОД БЫЛ ПУСТОЙ ИЗ-ЗА НАСЛЕДОВАНИЯ. В КЛАССЕ NCLNAMECASERU ОПИСЫВАЛСЯ МЕТОД ПОД РУССКИЕ ИМЕНА, НО В AHK ОБРАТНОЙ НАСЛЕДСТВЕННОСТИ НЕТ (?) И ПУСТОЙ МЕТОД НЕ РАБОТАЛ.  
     * Идентифицирует слово определя имя это, или фамилия, или отчество.
     * - <b>N</b> - имя
     * - <b>S</b> - фамилия
     * - <b>F</b> - отчество
     * @param {(NCLNameCaseWord)} Word обьект класса слов, который необходимо идентифицировать
     */
    DetectNamePart(Word) {
        if Type(Word) != "NCLNameCaseWord"
            throw TypeError(A_LineFile A_Tab A_ThisFunc A_Tab "Параметром должен был объект типа 'NCLNameCaseWord', но вместо него - " Type(Word))
        Namepart := Word.GetWord()
        Length := StrLen(Namepart)
        this.SetWorkingWord(Namepart)

        ; Считаем вероятность
        First := 0
        Second := 0
        Father := 0

        ; если смахивает на отчество
        if (this.Contains(this.Last(3), ['вна', 'чна', 'вич', 'ьич'])) {
            Father += 3
        }

        if (this.Contains(this.Last(2), ['ша'])) {
            First += 0.5
        }

        ; 'эль'=Рафаэль, Габриэль
        if (this.Contains(this.Last(3), ['эль'])) {
            First += 0.5
        }

        /**
         * буквы на которые никогда не заканчиваются имена
         */
        if (this.Contains(this.Last(1), 'еёжхцочшщъыэю')) {
            /**
             * Просто исключения
             */
            if (this.InNames(Namepart, ['Мауриц'])) {
                First += 10
            } else {
                Second += 0.3
            }
        }

        /**
         * Используем массив характерных окончаний
         */
        if ((this.SplitSecondExclude.Has(this.Last(2, 1)))) {
            if (!this.Contains(this.Last(1), this.SplitSecondExclude[this.Last(2, 1)])) {
                Second += 0.4
            }
        }

        /**
         * Сокращенные ласкательные имена типя Аня Галя и.т.д.
         */
        if (this.Last(1) == 'я' and this.Contains(this.Last(3, 1), this.vowels)) {
            First += 0.5
        }

        /**
         * Не бывает имен с такими предпоследними буквами
         */
        if (this.Contains(this.Last(2, 1), 'жчщъэю')) {
            Second += 0.3
        }

        /**
         * Слова на мягкий знак. Существует очень мало имен на мягкий знак. Все остальное фамилии
         */
        if (this.Last(1) == 'ь') {
            /**
             * Имена типа нинЕЛь адЕЛь асЕЛь
             */
            if (this.Last(3, 2) == 'ел') {
                First += 0.7
            }
            /**
             * Просто исключения
             */
            else if (this.InNames(Namepart, ['Лазарь', 'Игорь', 'Любовь'])) {
                First += 10
            }
            /**
             * Если не то и не другое, тогда фамилия
             */
            else {
                Second += 0.3
            }
        }
        /**
         * Если две последних букв согласные то скорее всего это фамилия
         */
        else if (this.Contains(this.Last(1), this.consonant . 'ь') and this.Contains(this.Last(2, 1), this.consonant . 'ь')) {
            /**
             * Практически все кроме тех которые оканчиваются на следующие буквы
             */
            if (!this.Contains(this.Last(2), ['др', 'кт', 'лл', 'пп', 'рд', 'рк', 'рп', 'рт', 'тр'])) {
                Second += 0.25
            }
        }

        /**
         * Слова, которые заканчиваются на тин
         */
        if (this.Last(3) == 'тин' and this.Contains(this.Last(4, 1), 'нст')) {
            First += 0.5
        }

        ; Исключения
        ; 'Мариа'=Альфонс Мариа Муха
        ; 'Эвелин'=женские иностранные
        Names := ['Лев', 'Яков', 'Вова', 'Маша', 'Ольга', 'Еремей','Исак', 'Исаак', 'Ева', 'Ирина', 'Элькин', 'Мерлин', 'Макс', 'Алекс', 'Мариа', 'Бриджет', 'Элизабет', 'Маргарет', 'Джанет', 'Жаклин', 'Эвелин']
        if (this.InNames(Namepart, Names) || this.InNames(Namepart, this.Names_man)
        ) {
            First += 10
        }

        /**
         * Фамилии которые заканчиваются на -ли кроме тех что типа натАли и.т.д.
         */
        if (this.Last(2) == 'ли' and this.Last(3, 1) != 'а') {
            Second += 0.4
        }

        /**
         * Фамилии на -як кроме тех что типа Касьян Куприян + Ян и.т.д.
         */
        if (this.Last(2) == 'ян' and Length > 2 and !this.Contains(this.Last(3, 1), 'ьи')) {
            Second += 0.4
        }

        /**
         * Фамилии на -ур кроме имен Артур Тимур
         */
        if (this.Last(2) == 'ур') {
            if (!this.InNames(Namepart, ['Артур', 'Тимур'])) {
                Second += 0.4
            }
        }

        /**
         * Разбор ласкательных имен на -ик
         */
        if (this.Last(2) == 'ик') {
            /**
             * Ласкательные буквы перед ик
             */
            if (this.Contains(this.Last(3, 1), 'лшхд')) {
                First += 0.3
            } else {
                Second += 0.4
            }
        }

        /**
         * Разбор имен и фамилий, который заканчиваются на ина
         */
        if (this.Last(3) == 'ина') {
            /**
             * Все похожие на Катерина и Кристина
             */
            if (this.Contains(this.Last(7), ['атерина', 'ристина'])) {
                First += 10
            }
            /**
             * Исключения
             */
            else if (this.InNames(Namepart, ['Мальвина', 'Антонина', 'Альбина', 'Агриппина', 'Фаина', 'Карина', 'Марина', 'Валентина', 'Калина', 'Аделина', 'Алина', 'Ангелина', 'Галина', 'Каролина', 'Павлина', 'Полина', 'Элина', 'Мина', 'Нина', 'Дина'])) {
                First += 10
            }
            /**
             * Иначе фамилия
             */
            else {
                Second += 0.4
            }
        }

        /**
         * Имена типа Николай
         */
        if (this.Last(4) == 'олай') {
            First += 0.6
        }

        /**
         * Фамильные окончания
         */
        if (this.Contains(this.Last(2), ['ов', 'ин', 'ев', 'ёв', 'ый', 'ын', 'ой', 'ук', 'як', 'ца', 'ун', 'ок', 'ая', 'ёк', 'ив', 'ус', 'ак', 'яр', 'уз', 'ах', 'ай'])) {
            Second += 0.4
        }

        if (this.Contains(this.Last(3), ['ова', 'ева', 'ёва', 'ына', 'шен', 'мей', 'вка', 'шир', 'бан', 'чий', 'кий', 'бей', 'чан', 'ган', 'ким', 'кан', 'мар', 'лис'])) {
            Second += 0.4
        }

        if (this.Contains(this.Last(4), ['шена'])) {
            Second += 0.4
        }

        ; исключения и частички
        if (this.InNames(Namepart, ['да', 'валадон', 'Данбар'])){
            Second += 10
        }


        Maximum := Max([First, Second, Father]*)

        if (First == Maximum) {
            Word.SetNamePart('N')
        } else if (Second == Maximum) {
            Word.SetNamePart('S')
        } else {
            Word.SetNamePart('F')
        }
    }

    /**
     * Возвращает версию библиотеки.
     * @returns {(String)} версия библиотеки
     */
    Version() => this.Version

    /**
     * Возвращает версию использованого языкового файла
     * @returns {(String)} версия языкового файла
     */
    LanguageVersion() => this.LanguageBuild

}

/**
 * NCLNameCaseWord - класс, который служит для хранения всей информации о каждом слове
 *
 * @author Андрей Чайка <bymer3@gmail.com>
 * @version 0.4.1
 * @package NameCaseLib
 */
class NCLNameCaseWord {

    __Init() {
        this._Word := ""
        this._WordOrig := ""
        this._NamePart := ""
        this._GenderMan := 0
        this._GenderWoman := 0
        this._GenderSolved := 0
        this._LetterMask := []
        this._IsUpperCase := false
        this._NameCases := []
        this._Rule := 0
    }

    /**
     * Слово в нижнем регистре, которое хранится в объекте класса.
     * @property {(String)} Word
     */
    Word {
        get {
            return this._Word
        }
        set {
            this._Word := Value
        }
    }

    /**
     * Оригинальное слово.
     * @property {(String)} WordOrig
     */
    WordOrig {
        get {
            return this._WordOrig
        }
        set {
            this._WordOrig := Value
        }
    }

    /**
     * Тип текущей записи (Фамилия/Имя/Отчество).
     * - <b>N</b> - имя
     * - <b>S</b> - фамилия
     * - <b>F</b> - отчество
     * @property {(String)} NamePart
     */
    NamePart {
        get {
            return this._NamePart
        }
        set {
            this._NamePart := Value
        }
    }

    /**
     * Вероятность того, что текущее слово относится к мужскому полу.
     * @property {(Int)} GenderMan
     */
    GenderMan {
        get {
            return this._GenderMan
        }
        set {
            this._GenderMan := Value
        }
    }

    /**
     * Вероятность того, что текущее слово относится к женскому полу.
     * @property {(Int)} GenderWoman
     */
    GenderWoman {
        get {
            return this._GenderWoman
        }
        set {
            this._GenderWoman := Value
        }
    }

    /**
     * Окончательное решение, к какому полу относится слово.
     * - `0` - не определено
     * - `NCL.MAN` - мужской пол
     * - `NCL.WOMAN` - женский пол
     * @property {(Int)} GenderSolved
     */
    GenderSolved {
        get {
            return this._GenderSolved
        }
        set {
            this._GenderSolved := Value
        }
    }

    /**
     * Маска больших букв в слове.
     *
     * Содержит информацию о том, какие буквы в слове были большими, а какие маленькими:
     * - `x` - маленькая буква
     * - `X` - большая буква
     * @property {(Array.<String>)} LetterMask Массив строк типа `["X", "x", "x", "x", "x", "x",]`
     */
    LetterMask {
        get {
            return this._LetterMask
        }
        set {
            this._LetterMask := Value
        }
    }

    /**
     * Содержит `true`, если все слово было в верхнем регистре и false, если не было.
     * @property {(Boolean)} IsUpperCase
     */
    IsUpperCase {
        get {
            return this._IsUpperCase
        }
        set {
            this._IsUpperCase := Value
        }
    }

    /**
     * Массив содержит все падежи слова, полученые после склонения текущего слова.
     * @property {(Array)} NameCases
     */
    NameCases {
        get {
            return this._NameCases
        }
        set {
            this._NameCases := Value
        }
    }

    /**
     * Номер правила, по которому было произведено склонение текущего слова.
     * @property {(Int)} Rule
     */
    Rule {
        get {
            return this._Rule
        }
        set {
            this._Rule := Value
        }
    }

    /**
     * Создание нового обьекта со словом `Word`
     * @property {(String)} Word слово
     */
    __New(Word) {
        this.WordOrig := Word
        this.GenerateMask(Word)
        this.Word := StrLower(Word)
    }

    /**
     * Генерирует маску, которая содержит информацию о том, какие буквы в слове были большими, а какие маленькими:
     * - `x` - маленькая буква
     * - `X` - большая буква
     * @param {(String)} Word слово, для которого будет создаваться маска
     */
    GenerateMask(Word) {
        Letters := NCLStr.SplitLetters(word)
        Mask := []
        this.IsUpperCase := true
        for letter in Letters {
            if (NCLStr.IsLowerCase(letter)) {
                Mask.Push("x")
                this.IsUpperCase := false
            } else {
                Mask.Push("X")
            }
        }
        this.LetterMask := Mask
    }

    /**
     * Возвращает все падежи слова в начальную маску:
     * - `x` - маленькая буква
     * - `X` - большая буква
     */
    ReturnMask() {
        if this.IsUpperCase {
            for index, _case in this.NameCases {
                this.NameCases[index] := StrUpper(_case)
            }
        } else {
            SplittedMask := this.LetterMask
            MaskLength := SplittedMask.Length
            for index, _case in this.NameCases {
                CaseLength := StrLen(_case)
                _Max := Min([CaseLength, MaskLength]*)
                this.NameCases[index] := ''
                LetterIndex := 1
                while (LetterIndex <= _Max) {
                    Letter := SubStr(_case, LetterIndex, 1)
                    if (SplittedMask[LetterIndex] == 'X') {
                        Letter := StrUpper(Letter)
                    }
                    this.NameCases[index] .= Letter
                    LetterIndex++
                }
                if StrLen(_case) = StrLen(this.NameCases[index])
                    continue
                this.NameCases[index] .= SubStr(_case, _Max + 1)
            }
        }
    }

    /**
     * Сохраняет результат склонения текущего слова.
     * @param {(Array)} NameCases массив со всеми падежами
     * @param {(Boolean)} IsReturnMask Флаг необходимости возврата к начальной маске
     */
    SetNameCases(NameCases, IsReturnMask := true) {
        this.NameCases := NameCases
        if IsReturnMask
            this.returnMask()
    }

    /**
     * Возвращает массив со всеми падежами текущего слова.
     * @returns {(Array)} массив со всеми падежами
     */
    GetNameCases() => this.NameCases

    /**
     * Возвращает строку с нужным падежом текущего слова.
     * @param {(Int)} Number нужный падеж
     * @returns {(String)} строка с нужным падежом текущего слова
     */
    getNameCase(Number) {
        if this.NameCases.Has(Number) {
            return this.NameCases[Number]
        }
        return false
    }

    /**
     * Расчитывает и возвращает пол текущего слова.
     * @returns {(Int)} пол текущего слова
     */
    Gender() {
        if !this.GenderSolved {
            if this.GenderMan >= this.GenderWoman {
                this.GenderSolved := NCL.MAN
            } else {
                this.GenderSolved := NCL.WOMAN
            }
        }
        return this.GenderSolved
    }

    /**
     * Устанавливает вероятности того, что даное слово является мужчиной или женщиной.
     * @param {(Int)} Man вероятность того, что слово мужчина
     * @param {(Int)} Woman верятность того, что слово женщина
     */
    SetGender(Man, Woman) {
        this.GenderMan := Man
        this.GenderWoman := Woman
    }

    /**
     * Окончательно устанавливает пол человека.
     * - `0` - не определено
     * - `NCL.MAN` - мужчина
     * - `NCL.WOMAN` - женщина
     * @param {(Int)} Gender пол человека
     */
    SetTrueGender(Gender) {
        this.GenderSolved := Gender
    }

    /**
     * Возвращает массив вероятности того, что даное слово относится к мужчине или женщине.
     * @returns {(Map)} массив вероятностей
     */
    GetGender() => Map(NCL.MAN, this.genderMan, NCL.WOMAN, this.GenderWoman)

    /**
     * Устанавливает тип текущего слова.  
     * <b>Тип слова:</b>
     * - `S` - Фамилия
     * - `N` - Имя
     * - `F` - Отчество
     * @param {(String)} NamePart тип слова
     */
    SetNamePart(NamePart) {
        this.NamePart := NamePart
    }

    /**
     * Возвращает тип текущего слова.  
     * <b>Тип слова:</b>
     * - `S` - Фамилия
     * - `N` - Имя
     * - `F` - Отчество
     * @returns {(String)} тип слова
     */
    GetNamePart() => this.namePart
    

    /**
     * Возвращает текущее слово.
     * @returns {(String)} Текущее слово
     */
    GetWord() => this.Word

    /**
     * Возвращает текущее оригинальное слово.
     * @returns {(String)} текущее слово
     */
    GetWordOrig() => this.WordOrig

    /**
     * Если уже был расчитан пол для всех слов системы, тогда каждому слову предается окончательное
     * решение.  
     * Эта функция определяет было ли принято окончательное решение.
     * @returns {(Boolean)} было ли принято окончательное решение по поводу пола текущего слова
     */
    IsGenderSolved() => this.GenderSolved ? true : false

    /**
     * Устанавливает номер правила, по которому склонялось текущее слово.
     * @param {(Int)} RuleID номер правила
     */
    SetRule(RuleID) {
        this.Rule := RuleID
    }
}

/**
 * <b>NCL NameCase Russian Language</b>
 * 
 * Русские правила склонения ФИО.
 * 
 * Правила определения пола человека по ФИО для русского языка.
 * 
 * Система разделения фамилий имен и отчеств для русского языка.
 * 
 * @author Андрей Чайка <bymer3@gmail.com>
 * @version 0.4.1
 * @package NameCaseLib
 */
class NCLNameCaseRu extends NCLNameCaseCore {

    /**
     * Версия языкового файла.
     * @property {(String)} LanguageBuild
     */
    LanguageBuild => "11072716"

    /**
     * Количество падежей в языке.
     * @property {(Int)} CaseCount
     */
    CaseCount => 6

    /**
     * Список гласных русского языка.
     * @property {(String)} Vowels
     */
    Vowels => "аеёиоуыэюя"

    /**
     * Список согласных русского языка.
     * @property {(String)} Consonant
     */
    Consonant => "бвгджзйклмнпрстфхцчшщ"
    
    /**
     * Окончания имен/фамилий, который не склоняются
     * @var array 
     */
    ovo := [ 'ово', 'аго', 'яго', 'ирь']
    /**
     * Окончания имен/фамилий, который не склоняются
     * @var array 
     */
    ih := ['их', 'ых', 'ко', 'уа'] ; Бенуа, Франсуа
    /**
     * Список окончаний характерных для фамилий 
     * По шаблону {letter}* где * любой символ кроме тех, что в {exclude}
     * @var array of {letter}=>{exclude}
     */
    splitSecondExclude := Map(
        'а', 'взйкмнпрстфя',
        'б', 'а',
        'в', 'аь',
        'г', 'а',
        'д', 'ар',
        'е', 'бвгдйлмня',
        'ё', 'бвгдйлмня',
        'ж', '',
        'з', 'а',
        'и', 'гдйклмнопрсфя',
        'й', 'ля',
        'к', 'аст',
        'л', 'аилоья',
        'м', 'аип',
        'н', 'ат',
        'о', 'вдлнпря',
        'п', 'п',
        'р', 'адикпть',
        'с', 'атуя',
        'т', 'аор',
        'у', 'дмр',
        'ф', 'аь',
        'х', 'а',
        'ц', 'а',
        'ч', '',
        'ш', 'а',
        'щ', '',
        'ъ', '',
        'ы', 'дн',
        'ь', 'я',
        'э', '',
        'ю', '',
        'я', 'нс'
    )

        names_man := [
            'Вова', 'Анри', 'Питер', 'Пауль', 'Франц', 'Вильям', 'Уильям',
            'Альфонс', 'Ганс', 'Франс', 'Филиппо', 'Андреа', 'Корнелис', 'Фрэнк', 'Леонардо',
            'Джеймс', 'Отто', 'жан-пьер', 'Джованни', 'Джозеф', 'Педро', 'Адольф', 'Уолтер',
            'Антонио', 'Якоб', 'Эсташ', 'Адрианс', 'Франческо', 'Доменико', 'Ханс', 'Гун',
            'Шарль', 'Хендрик', 'Амброзиус', 'Таддео', 'Фердинанд', 'Джошуа', 'Изак', 'Иоганн',
            'Фридрих', 'Эмиль', 'Умберто', 'Франсуа', 'Ян', 'Эрнст', 'Георг', 'Карл'
        ]

    /**
     * Мужские имена, оканчивающиеся на любой ь и -й, 
     * скло­няются так же, как обычные существительные мужского рода
     * @return bool true если правило было задействовано и false если нет. 
     */
    manRule1() {
        /*
        МЕТОД THIS.IN() БЫЛ ПЕРЕИМЕНОВАН в THIS.CONTAINS()
        */
        if (this.Contains(this.Last(1), 'ьй')) {
            if (this.inNames(this.workingWord, ["Дель"])) {
                this.Rule(101)
                this.makeResultTheSame()
                return true
            }

            if (this.Last(2, 1) != "и") {
                this.wordForms(this.workingWord, ['я', 'ю', 'я', 'ем', 'е'], 1)
                this.Rule(102)
                return true
            } else {
                this.wordForms(this.workingWord, ['я', 'ю', 'я', 'ем', 'и'], 1)
                this.Rule(103)
                return true
            }
        }
        return false
    }

    /**
     * Мужские имена, оканчивающиеся на любой твердый согласный, 
     * склоняются так же, как обычные существительные мужского рода
     * @return bool true если правило было задействовано и false если нет. 
     */
    manRule2() {
        if (this.Contains(this.Last(1), this.consonant)) {
            if (this.inNames(this.workingWord, "Павел")) {
                this.lastResult := ["Павел", "Павла", "Павлу", "Павла", "Павлом", "Павле"]
                this.Rule(201)
                return true
            } else if (this.inNames(this.workingWord, "Лев")) {
                this.lastResult := ["Лев", "Льва", "Льву", "Льва", "Львом", "Льве"]
                this.Rule(202)
                return true
            } else if (this.inNames(this.workingWord, 'ван')) {
                this.Rule(203)
                this.makeResultTheSame()
                return true
            } else {
                this.wordForms(this.workingWord, ['а', 'у', 'а', 'ом', 'е'])
                this.Rule(204)
                return true
            }
        }
        return false
    }

    /**
     * Мужские и женские имена, оканчивающиеся на -а, склоняются, как и любые 
     * существительные с таким же окончанием
     * Мужские и женские имена, оканчивающиеся иа -я, -ья, -ия, -ея, независимо от языка, 
     * из которого они происходят, склоняются как существительные с соответствующими окончаниями
     * @return bool true если правило было задействовано и false если нет. 
     */
    manRule3() {
        if (this.Last(1) == "а") {
                if (this.inNames(this.workingWord, ['фра', 'Дега', 'Андреа', 'Сёра', 'Сера'])) {
                this.Rule(301)
                this.makeResultTheSame()
                return true
            } else if (!this.Contains(this.Last(2, 1), 'кшгх')) {
                this.wordForms(this.workingWord, ['ы', 'е', 'у', 'ой', 'е'], 1)
                this.Rule(302)
                return true
            } else {
                this.wordForms(this.workingWord, ['и', 'е', 'у', 'ой', 'е'], 1)
                this.Rule(303)
                return true
            }
        } else if (this.Last(1) == "я")  {
            this.wordForms(this.workingWord, ['и', 'е', 'ю', 'ей', 'е'], 1)
            this.Rule(303)
            return true
        }
        return false
    }

    /**
     * Мужские фамилии, оканчивающиеся на -ь -й, склоняются так же, 
     * как обычные существительные мужского рода
     * @return bool true если правило было задействовано и false если нет. 
     */
    manRule4() {
        if (this.Contains(this.Last(1), 'ьй')) {

        ; Слова типа Воробей
            if (this.Last(3) == 'бей') {
                this.wordForms(this.workingWord, ['ья', 'ью', 'ья', 'ьем', 'ье'], 2)
                this.Rule(400)
                return true
            } else if (this.Last(3, 1) == 'а' or this.Contains(this.Last(2, 1), 'ел')) {
                this.wordForms(this.workingWord, ['я', 'ю', 'я', 'ем', 'е'], 1)
                this.Rule(401)
                return true
            }
        ; Толстой -» ТолстЫм 
            else if (this.Last(2, 1) == 'ы' or this.Last(3, 1) == 'т')
            {
                this.wordForms(this.workingWord, ['ого', 'ому', 'ого', 'ым', 'ом'], 2)
                this.Rule(402)
                return true
            }
        ; Лесничий
            else if (this.Last(3) == 'чий') {
                this.wordForms(this.workingWord, ['ьего', 'ьему', 'ьего', 'ьим', 'ьем'], 2)
                this.Rule(403)
                return true
            } else if (!this.Contains(this.Last(2, 1), this.vowels) or this.Last(2, 1) == 'и') {
                this.wordForms(this.workingWord, ['ого', 'ому', 'ого', 'им', 'ом'], 2)
                this.Rule(404)
                return true
            } else {
                this.makeResultTheSame()
                this.Rule(405)
                return true
            }
        }
        return false
    }

    /**
     * Мужские фамилии, оканчивающиеся на -к
     * @return bool true если правило было задействовано и false если нет. 
     */
    manRule5() {
        if (this.Last(1) == 'к') {
            ; https://www.analizfamilii.ru/Gudachek/skloneniye.html
            if (this.Contains(this.Last(3), 'чек')) {
                this.wordForms(this.workingWord, ['а', 'у', 'а', 'ом', 'е'])
                this.Rule(503)
                return true
            }
            ; Если перед слово на ок, то нужно убрать о
            ; Поллок
            if (this.Last(4)=='енок' || this.Last(4)=='ёнок') {
                this.wordForms(this.workingWord, ['ка', 'ку', 'ка', 'ком', 'ке'], 2)
                this.Rule(501)
                return true
            }
            ; Лотрек
            if (this.Last(2, 1) == 'е' && !this.InArray(this.Last(3, 1), ['р'])) {
                this.wordForms(this.workingWord, ['ька', 'ьку', 'ька', 'ьком', 'ьке'], 2)
                this.Rule(502)
                return true
            } else {
                this.wordForms(this.workingWord, ['а', 'у', 'а', 'ом', 'е'])
                this.Rule(503)
                return true
            }
        }
        return false
    }

    /**
     * Мужские фамили на согласный выбираем ем/ом/ым
     * @return bool true если правило было задействовано и false если нет. 
     */
    manRule6() {
        if (this.Last(1) == 'ч') {
            this.wordForms(this.workingWord, ['а', 'у', 'а', 'ем', 'е'])
            this.Rule(601)
            return true
        }
        ; е перед ц выпадает
        else if (this.Last(2) == 'ец') {
            this.wordForms(this.workingWord, ['ца', 'цу', 'ца', 'цом', 'це'], 2)
            this.Rule(604)
            return true
        } else if (this.Contains(this.Last(1), 'цсршмхт')) {
            this.wordForms(this.workingWord, ['а', 'у', 'а', 'ом', 'е'])
            this.Rule(602)
            return true
        } else if (this.Contains(this.Last(1), this.consonant)) {
            this.wordForms(this.workingWord, ['а', 'у', 'а', 'ым', 'е'])
            this.Rule(603)
            return true
        }
        return false
    }

    /**
     * Мужские фамили на -а -я
     * @return bool true если правило было задействовано и false если нет.  
     */
    manRule7() {
        if (this.Last(1) == "а")  {
            if (this.inNames(this.workingWord, ['да'])) {
                this.Rule(701)
                this.makeResultTheSame()
                return true
            }
            ; Если основа на ш, то нужно и, ей
            if (this.Last(2, 1) == 'ш')  {
                this.wordForms(this.workingWord, ['и', 'е', 'у', 'ей', 'е'], 1)
                                this.Rule(702)
                return true
            } else if (this.Contains(this.Last(2, 1), 'хкг')) {
                this.wordForms(this.workingWord, ['и', 'е', 'у', 'ой', 'е'], 1)
                                this.Rule(703)
                return true
            } else {
                this.wordForms(this.workingWord, ['ы', 'е', 'у', 'ой', 'е'], 1)
                                this.Rule(704)
                return true
            }
        } else if (this.Last(1) == "я") {
            this.wordForms(this.workingWord, ['ой', 'ой', 'ую', 'ой', 'ой'], 2)
                        this.Rule(705)
            return true
        }
        return false
    }

    /**
     * Не склоняются мужский фамилии
     * @return bool true если правило было задействовано и false если нет.  
     */
    manRule8() {
        if (this.Contains(this.Last(3), this.ovo) || this.Contains(this.Last(2), this.ih)) {
            if ( this.inNames(this.workingWord, ['рерих']) )
                return false
            this.Rule(8)
            this.makeResultTheSame()
            return true
        }
        return false
    }

    /**
     * Мужские и женские имена, оканчивающиеся на `-а`, склоняются, 
     * как и любые существительные с таким же окончанием.
     * @returns bool true если правило было задействовано и false если нет. 
     */
    womanRule1() {
        if (this.Last(1) == "а" and this.Last(2, 1) != 'и') {
            if (!this.Contains(this.Last(2, 1), 'шхкг')) {
                this.wordForms(this.workingWord, ['ы', 'е', 'у', 'ой', 'е'], 1)
                this.Rule(101)
                return true
            } else {
                ; ей посля шипящего
                if (this.Last(2, 1) == 'ш') {
                    this.wordForms(this.workingWord, ['и', 'е', 'у', 'ей', 'е'], 1)
                    this.Rule(102)
                    return true
                } else {
                    this.wordForms(this.workingWord, ['и', 'е', 'у', 'ой', 'е'], 1)
                    this.Rule(103)
                    return true
                }
            }
        }
        return false
    }

    /**
     * Мужские и женские имена, оканчивающиеся иа -я, -ья, -ия, -ея, независимо от языка, 
     * из которого они происходят, склоняются как сущест­вительные с соответствующими окончаниями
     * @return bool true если правило было задействовано и false если нет.  
     */
    womanRule2() {
        if (this.Last(1) == "я") {
            if (this.Last(2, 1) != "и") {
                this.wordForms(this.workingWord, ['и', 'е', 'ю', 'ей', 'е'], 1)
                this.Rule(201)
                return true
            } else {
                this.wordForms(this.workingWord, ['и', 'и', 'ю', 'ей', 'и'], 1)
                this.Rule(202)
                return true
            }
        }
        return false
    }

    /**
     * Русские женские имена, оканчивающиеся на мягкий согласный, склоняются, 
     * как существительные женского рода типа дочь, тень
     * @return bool true если правило было задействовано и false если нет. 
     */
    womanRule3() {
        if (this.Last(1) == "ь") {
            this.wordForms(this.workingWord, ['и', 'и', 'ь', 'ью', 'и'], 1)
            this.Rule(3)
            return true
        }
        return false
    }

    /**
     * Женские фамилия, оканчивающиеся на -а -я, склоняются,
     * как и любые существительные с таким же окончанием
     * @return bool true если правило было задействовано и false если нет. 
     */
    womanRule4() {
        if (this.Last(1) == "а") {
            if (this.Contains(this.Last(2, 1), 'гк')) {
                this.wordForms(this.workingWord, ['и', 'е', 'у', 'ой', 'е'], 1)
                this.Rule(401)
                return true
            }  else if (this.Contains(this.Last(2, 1), 'ш')) {
                this.wordForms(this.workingWord, ['и', 'е', 'у', 'ей', 'е'], 1)
                this.Rule(402)
                return true
            } else {
                this.wordForms(this.workingWord, ['ой', 'ой', 'у', 'ой', 'ой'], 1)
                this.Rule(403)
                return true
            }
        } else if (this.Last(1) == "я") {
            this.wordForms(this.workingWord, array('ой', 'ой', 'ую', 'ой', 'ой'), 2)
            this.Rule(404)
            return true
        }
        return false
    }

    /**
     * Функция пытается применить цепочку правил для мужских имен
     * @return boolean true - если было использовано правило из списка, false - если правило не было найденым
     */
    manFirstName() {
        if (this.inNames(this.workingWord, ['Старший', 'Младший'])) {
            this.wordForms(this.workingWord, ['его', 'ему', 'его', 'им', 'ем'], 2)
            return true
        }
        if (this.inNames(this.workingWord, ['Мариа'])) {
            ; Альфонс Мария Муха
            this.wordForms(this.workingWord, ['и', 'и', 'ю', 'ей', 'ии'], 1)
            return true
        }
        return this.RulesChain('man',[ 1, 2, 3])
    }

    /**
     * Функция пытается применить цепочку правил для женских имен
     * @return boolean true - если было использовано правило из списка, false - если правило не было найденым
     */
    womanFirstName() => this.RulesChain('woman', [1, 2, 3])

    /**
     * Функция пытается применить цепочку правил для мужских фамилий
     * @return boolean true - если было использовано правило из списка, false - если правило не было найденым
     */
    manSecondName() => this.RulesChain('man', [8, 4, 5, 6, 7])

    /**
     * Функция пытается применить цепочку правил для женских фамилий
     * @return boolean true - если было использовано правило из списка, false - если правило не было найденым
     */
    womanSecondName() => this.RulesChain('woman', [4])

    /**
     * Функция склоняет мужские отчества
     * @return boolean true - если слово было успешно изменено, false - если не получилось этого сделать
     */
    manFatherName() { 
        ; Проверяем действительно ли отчество
        if (this.inNames(this.workingWord, 'Ильич'))  {
            this.wordForms(this.workingWord, ['а', 'у', 'а', 'ом', 'е'])
            return true
        } else if (this.Last(2) == 'ич') {
            this.wordForms(this.workingWord, ['а', 'у', 'а', 'ем', 'е'])
            return true
        }
        return false
    }

    /**
     * Функция склоняет женские отчества
     * @return boolean true - если слово было успешно изменено, false - если не получилось этого сделать
     */
    womanFatherName() {
        ; Проверяем действительно ли отчество
        if (this.Last(2) == 'на') {
            this.wordForms(this.workingWord, ['ы', 'е', 'у', 'ой', 'е'], 1)
            return true
        }
        return false
    }

    /**
     * Определение пола по правилам имен
     * @param NCLNameCaseWord word обьект класса слов, для которого нужно определить пол
     */
    GenderByFirstName(word) {
        if Type(word) != "NCLNameCaseWord"
            throw TypeError(A_LineFile A_Tab A_ThisFunc A_Tab "Параметром должен был объект типа 'NCLNameCaseWord', но вместо него - " Type(word))
        this.setWorkingWord(word.getWord())

        man := 0 ; Мужчина
        woman := 0 ; Женщина
        ; Попробуем выжать максимум из имени
        ; Если имя заканчивается на й, то скорее всего мужчина
        if (this.Last(1) == 'й') {
            man+=0.9
        }

        ; 'по'=Филиппо; 'до'=Леонардо
        if (this.Contains(this.Last(2), ['он', 'ов', 'ав', 'ам', 'ол', 'ан', 'рд', 'мп', 'по', 'до', 'др', 'рт'])) {
            man+=0.3
        }
        
        if (this.Contains(this.Last(1), this.consonant)) {
            man+=0.01
        }

        if (this.Last(1) == 'ь') {
            man+=0.02
        }

        if (this.Contains(this.Last(2), ['вь', 'фь', 'ль', 'на'])) {
            woman+=0.1
        }

        if (this.Contains(this.Last(2), ['ла'])) {
            woman+=0.04
        }

        if (this.Contains(this.Last(2), ['то', 'ма'])) {
            man+=0.01
        }

        ; 'эль' =Рафаэль, Габриэль; 'реа'=Андреа
        if (this.Contains(this.Last(3), ['лья', 'вва', 'ока', 'ука', 'ита', 'эль', 'реа'])) {
            man+=0.2
        }

        if (this.Contains(this.Last(3), ['има'])) {
            woman+=0.15
        }

        if (this.Contains(this.Last(3), ['лия', 'ния', 'сия', 'дра', 'лла', 'кла', 'опа', 'вия'])) {
            woman+=0.5
        }

        if (this.Contains(this.Last(4), ['льда', 'фира', 'нина', 'лита', 'алья'])) {
            woman+=0.5
        }
        
        if (this.inNames(this.workingWord, this.names_man)) {
            man += 10
        }
        
        if (this.inNames(this.workingWord, ['Бриджет', 'Элизабет', 'Маргарет', 'Джанет', 'Жаклин', 'Эвелин'])) {
            woman += 10
        }

        ; Исключение для Берил Кук, которая женщина
        if (this.inNames(this.workingWord, ['Берил'])) {
            woman += 0.05
        }

        word.setGender(man, woman)
    }

    /**
     * Определение пола по правилам фамилий
     * @param NCLNameCaseWord word обьект класса слов, для которого нужно определить пол
     */
    GenderBySecondName(word) {
        if Type(word) != "NCLNameCaseWord"
            throw TypeError(A_LineFile A_Tab A_ThisFunc A_Tab "Параметром должен был объект типа 'NCLNameCaseWord', но вместо него - " Type(word))
        this.setWorkingWord(word.getWord())

        man := 0 ; Мужчина
        woman := 0 ; Женщина

        if (this.Contains(this.Last(2), ['ов', 'ин', 'ев', 'ий', 'ёв', 'ый', 'ын', 'ой'])) {
            man+=0.4
        }

        if (this.Contains(this.Last(3), ['ова', 'ина', 'ева', 'ёва', 'ына', 'мин'])) {
            woman+=0.4
        }

        if (this.Contains(this.Last(2), ['ая'])) {
            woman+=0.4
        }

        word.setGender(man, woman)
    }

    /**
     * Определение пола по правилам отчеств
     * @param NCLNameCaseWord word обьект класса слов, для которого нужно определить пол
     */
    GenderByFatherName(word) {
        if Type(word) != "NCLNameCaseWord"
            throw TypeError(A_LineFile A_Tab A_ThisFunc A_Tab "Параметром должен был объект типа 'NCLNameCaseWord', но вместо него - " Type(word))
        this.setWorkingWord(word.getWord())

        if (this.Last(2) == 'ич') {
            word.setGender(10, 0) ; мужчина
        }
        if (this.Last(2) == 'на') {
            word.setGender(0, 12) ; женщина
        }
    }

    /**
     * Идетифицирует слово определяе имя это, или фамилия, или отчество 
     * - <b>N</b> - имя
     * - <b>S</b> - фамилия
     * - <b>F</b> - отчество
     * @param NCLNameCaseWord word обьект класса слов, который необходимо идентифицировать
     */
    /*
    detectNamePart(word) {
        if Type(word) != "NCLNameCaseWord"
            throw TypeError(A_LineFile A_Tab A_ThisFunc A_Tab "Параметром должен был объект типа 'NCLNameCaseWord', но вместо него - " Type(word))
        namepart := word.getWord()
        length := NCLStr.strlen(namepart)
        this.setWorkingWord(namepart)

        ; Считаем вероятность
        first := 0
        second := 0
        father := 0

        ; если смахивает на отчество
        if (this.Contains(this.Last(3), ['вна', 'чна', 'вич', 'ьич'])) {
            father+=3
        }

        if (this.Contains(this.Last(2), ['ша'])) {
            first+=0.5
        }

        ; 'эль'=Рафаэль, Габриэль
        if (this.Contains(this.Last(3), ['эль'])) {
            first+=0.5
        }

        ; буквы на которые никогда не заканчиваются имена
        if (this.Contains(this.Last(1), 'еёжхцочшщъыэю')) {
            ; Просто исключения
            if (this.inNames(namepart, ['Мауриц'])) {
                first += 10
            } else {
                second += 0.3
            }
        }

        ; Используем массив характерных окончаний
        if ((this.splitSecondExclude.Has(this.Last(2, 1)))) {
            if (!this.Contains(this.Last(1), this.splitSecondExclude[this.Last(2, 1)])) {
                second += 0.4
            }
        }

        ; Сокращенные ласкательные имена типя Аня Галя и.т.д.
        if (this.Last(1) == 'я' and this.Contains(this.Last(3, 1), this.vowels)) {
            first += 0.5
        }

         ; Не бывает имен с такими предпоследними буквами
        if (this.Contains(this.Last(2, 1), 'жчщъэю')) {
            second += 0.3
        }

        ; Слова на мягкий знак. Существует очень мало имен на мягкий знак. Все остальное фамилии
        if (this.Last(1) == 'ь') {
            ; Имена типа нинЕЛь адЕЛь асЕЛь
            if (this.Last(3, 2) == 'ел') {
                first += 0.7
            }
            ; Просто исключения
            else if (this.inNames(namepart, ['Лазарь', 'Игорь', 'Любовь'])) {
                first += 10
            }
            ; Если не то и не другое, тогда фамилия
            else {
                second += 0.3
            }
        }
        ; Если две последних букв согласные то скорее всего это фамилия
        else if (this.Contains(this.Last(1), this.consonant . 'ь') and this.Contains(this.Last(2, 1), this.consonant . 'ь')) {
            ; Практически все кроме тех которые оканчиваются на следующие буквы
            if (!this.Contains(this.Last(2), ['др', 'кт', 'лл', 'пп', 'рд', 'рк', 'рп', 'рт', 'тр'])) {
                second += 0.25
            }
        }

        ; Слова, которые заканчиваются на тин
        if (this.Last(3) == 'тин' and this.Contains(this.Last(4, 1), 'нст')) {
            first += 0.5
        }

        ; Исключения
        ; 'Мариа'=Альфонс Мариа Муха
        ; 'Эвелин'=женские иностранные
        names := ['Лев', 'Яков', 'Вова', 'Маша', 'Ольга', 'Еремей','Исак', 'Исаак', 'Ева', 'Ирина', 'Элькин', 'Мерлин', 'Макс', 'Алекс', 'Мариа', 'Бриджет', 'Элизабет', 'Маргарет', 'Джанет', 'Жаклин', 'Эвелин']
        if (this.inNames(namepart, names) || this.inNames(namepart, this.names_man)
        ) {
            first+=10
        }

        ; Фамилии которые заканчиваются на -ли кроме тех что типа натАли и.т.д.
        if (this.Last(2) == 'ли' and this.Last(3, 1) != 'а') {
            second+=0.4
        }

        ; Фамилии на -як кроме тех что типа Касьян Куприян + Ян и.т.д.
        if (this.Last(2) == 'ян' and length > 2 and !this.Contains(this.Last(3, 1), 'ьи')) {
            second+=0.4
        }

        ; Фамилии на -ур кроме имен Артур Тимур
        if (this.Last(2) == 'ур') {
            if (!this.inNames(namepart, ['Артур', 'Тимур'])) {
                second += 0.4
            }
        }

        ; Разбор ласкательных имен на -ик
        if (this.Last(2) == 'ик') {
            ; Ласкательные буквы перед ик
            if (this.Contains(this.Last(3, 1), 'лшхд')) {
                first += 0.3
            } else {
                second += 0.4
            }
        }

        ; Разбор имен и фамилий, который заканчиваются на ина
        if (this.Last(3) == 'ина') {
            ; Все похожие на Катерина и Кристина
            if (this.Contains(this.Last(7), ['атерина', 'ристина'])) {
                first+=10
            }
             ; Исключения
            else if (this.inNames(namepart, ['Мальвина', 'Антонина', 'Альбина', 'Агриппина', 'Фаина', 'Карина', 'Марина', 'Валентина', 'Калина', 'Аделина', 'Алина', 'Ангелина', 'Галина', 'Каролина', 'Павлина', 'Полина', 'Элина', 'Мина', 'Нина', 'Дина'])) {
                first+=10
            }
            ; Иначе фамилия
            else {
                second += 0.4
            }
        }

        ; Имена типа Николай
        if (this.Last(4) == 'олай') {
            first += 0.6
        }

        ; Фамильные окончания
        if (this.Contains(this.Last(2), ['ов', 'ин', 'ев', 'ёв', 'ый', 'ын', 'ой', 'ук', 'як', 'ца', 'ун', 'ок', 'ая', 'ёк', 'ив', 'ус', 'ак', 'яр', 'уз', 'ах', 'ай'])) {
            second+=0.4
        }

        if (this.Contains(this.Last(3), ['ова', 'ева', 'ёва', 'ына', 'шен', 'мей', 'вка', 'шир', 'бан', 'чий', 'кий', 'бей', 'чан', 'ган', 'ким', 'кан', 'мар', 'лис'])) {
            second+=0.4
        }

        if (this.Contains(this.Last(4), ['шена'])) {
            second+=0.4
        }

        ; исключения и частички
        if (this.inNames(namepart, ['да', 'валадон', 'Данбар'])){
            second += 10
        }


        maximum := Max([first, second, father]*)

        if (first == maximum) {
            word.setNamePart('N')
        } else if (second == maximum) {
            word.setNamePart('S')
        } else {
            word.setNamePart('F')
        }
    }
    */
}

TestNames := [
    "Портнов Максим Дмитриевич",
    "Лаптева Елена Витальевна",
    "Возчиков Никита Сергеевич",
    "Белова Анна Михайловна",
    "Беспалов Андрей Михайлович",
    "Мубаракшина Камилла Булатовна"
]
#Include <AHKv2_Scripts\Json>
TestMethods(TestNames) {
    OutputDebug "Testing method: q() without specific case:`n"
    a := NCLNameCaseRu()
    for name in TestNames {
            OutputDebug(JSON.stringify(a.q(name)))
            OutputDebug("`n")
    }

    OutputDebug "Testing method: q() with specific case:`n"
    a := NCLNameCaseRu()
    for name in TestNames {
        loop 6 {
            OutputDebug a.q(name, A_Index) "`n"
        }
        OutputDebug "`n"
    }

    OutputDebug "Testing method: qFullName() without specific case:`n"
    a := NCLNameCaseRu()
    for name in TestNames {
        n := StrSplit(name, A_Space)
        OutputDebug(JSON.stringify(a.qFullName(n*)))
        OutputDebug "`n"
    }

    OutputDebug "Testing method: qFullName() with specific case:`n"
    a := NCLNameCaseRu()
    for name in TestNames {
        n := StrSplit(name, A_Space)
        loop 6 {
            OutputDebug a.qFullName(n[1], n[2], n[3],, A_Index) "`n"
        }
        OutputDebug "`n"
    }

    OutputDebug "Testing method: qFirstName() without specific case:`n"
    a := NCLNameCaseRu()
    for name in TestNames {
        n := StrSplit(name, A_Space)
        OutputDebug(JSON.stringify(a.qFirstName(n[2])))
        OutputDebug "`n"
    }

    OutputDebug "Testing method: qFirstName() with specific case:`n"
    a := NCLNameCaseRu()
    for name in TestNames {
        n := StrSplit(name, A_Space)
        loop 6 {
            OutputDebug a.qFirstName(n[2], A_Index) "`n"
        }
        OutputDebug "`n"
    }

    OutputDebug "Testing method: qSecondName() without specific case:`n"
    a := NCLNameCaseRu()
    for name in TestNames {
        n := StrSplit(name, A_Space)
        OutputDebug(JSON.stringify(a.qSecondName(n[1])))
        OutputDebug "`n"
    }

    OutputDebug "Testing method: qSecondName() with specific case:`n"
    a := NCLNameCaseRu()
    for name in TestNames {
        n := StrSplit(name, A_Space)
        loop 6 {
            OutputDebug a.qSecondName(n[1], A_Index) "`n"
        }
        OutputDebug "`n"
    }

    OutputDebug "Testing method: qFatherName() without specific case:`n"
    a := NCLNameCaseRu()
    for name in TestNames {
        n := StrSplit(name, A_Space)
        OutputDebug(JSON.stringify(a.qFatherName(n[3])))
        OutputDebug "`n"
    }

    OutputDebug "Testing method: qFatherName() with specific case:`n"
    a := NCLNameCaseRu()
    for name in TestNames {
        n := StrSplit(name, A_Space)
        loop 6 {
            OutputDebug a.qFatherName(n[3], A_Index) "`n"
        }
        OutputDebug "`n"
    }

    OutputDebug "Methods successfully tested!"
}

TestMethods(TestNames)