#Requires AutoHotkey v2

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
    static IMENITLN := 1
    
    /**
     * Родительный падеж
     * @property {(Int)} RODITLN
     */
    static RODITLN := 2
    
    /**
     * Дательный падеж
     * @property {(Int)} DATELN
     */
    static DATELN := 3
    
    /**
     * Винительный падеж
     * @property {(Int)} VINITELN
     */
    static VINITELN := 4
    
    /**
     * Творительный падеж
     * @property {(Int)} TVORITELN
     */
    static TVORITELN := 5
    
    /**
     * Предложный падеж
     * @property {(Int)} PREDLOGN
     */
    static PREDLOGN := 6
    
    /**
     * Назвиний відмінок
     * @property {(Int)} UaNazyvnyi
     */
    static UaNazyvnyi := 1
    
    /**
     * Родовий відмінок
     * @property {(Int)} UaRodovyi
     */
    static UaRodovyi := 2
    
    /**
     * Давальний відмінок
     * @property {(Int)} UaDavalnyi
     */
    static UaDavalnyi := 3
    
    /**
     * Знахідний відмінок
     * @property {(Int)} UaZnahidnyi
     */
    static UaZnahidnyi := 4
    
    /**
     * Орудний відмінок
     * @property {(Int)} UaOrudnyi
     */
    static UaOrudnyi := 5
    
    /**
     * Місцевий відмінок
     * @property {(Int)} UaMiszevyi
     */
    static UaMiszevyi := 6
    
    /**
     * Кличний відмінок
     * @property {(Int)} UaKlychnyi
     */
    static UaKlychnyi := 7
}

/**
 * Класс содержит функции для работы со строками, которые используются в NCLNameCaseLib.
 * 
 * @author Андрей Чайка <bymer3@gmail.com>
 * @version 0.4.1
 * @package NameCaseLib
 */
class NCLStr {
    /**
     * Кодировка, в котороя работает система
     * @deprecated
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
     * Поиск подстроки в строке.
     * @param {(String)} Haystack Строка, в которой искать
     * @param {(String)} Needle Подстрока, которую нужно найти.
     * @param {(Int)} Offset Начало поиска.
     * @returns {(Int)} Позиция подстроки в строке.
     */
    static strpos(Haystack, Needle, Offset := 1) {
        return InStr(Haystack, Needle, CaseSense := 0, Offset)
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
     * @param {(String)} str строка
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
     * @deprecated
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
     * @deprecated
     * @param {(String)} phrase строка
     * @returns {(Boolean)} в нижнем ли регистре строка 
     */
    static isLowerCase(phrase) {
        return (phrase == StrLower(phrase))
    }
    
     /**
     * Проверяет в верхнем ли регистре находится строка
     * @deprecated
     * @param {(String)} phrase строка
     * @returns {(Boolean)} в верхнем ли регистре строка 
     */
    static isUpperCase(phrase) {
        return (phrase == StrUpper(phrase))
    }
    
    /**
     * Превращает строку в массив букв.
     * @param {(String)} Phrase Строка.
     * @returns {(Array.<String>)} Массив букв.
     */
    static SplitLetters(Phrase) {
        LettersArr := []
        loop parse Phrase
            LettersArr.Push(A_LoopField)
        return LettersArr
    }
    
    /**
     * Соединяет массив букв в строку
     * @deprecated
     * @param {(Array)} lettersArr массив букв
     * @returns {(String)} строка
     */
    static connectLetters(lettersArr) {
        res := ""
        for letter in lettersArr
            res .= letter
        return res
    }
    
    /**
     * Соединяет буквы друг с другом через разделитель
     * @param {(String)} Separator Разделитель, например, `"-"`.
     * @param {(Array.<String>)} LettersArr Массив букв, например, `["а", "б"]`.
     * @returns {(String)} Результат объединения - `"а-б"`.
     */
    static Implode(Separator, LettersArr) {
        res := ""
        for letter in LettersArr {
            res .= letter
            if A_Index < LettersArr.Length
                res .= Separator
        }
        return res
    }

    /**
     * Разбивает строку на части, использую шаблон.
     * @param {(String)} Pattern Шаблон разбития.
     * @param {(String)} Str Строка, которую нужно разбить.
     * @returns {(Array.<String>)} Разбитый массив.
     */
    static Explode(Pattern, Str) {

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

        return RegExSplit(Str, Pattern)
    }
}

/**
 * <b>NCL NameCase Core</b>  
 * Набор основных функций, который позволяют сделать интерфейс склонения
 * русского и украинского языка абсолютно одинаковым. Содержит все функции для
 * внешнего взаимодействия с библиотекой.
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
       this._GenderCoef := 0 
    }
    /**
     * Готовность системы:
     * - Все слова идентифицированы (известо к какой части ФИО относится слово)
     * - У всех слов определен пол  
     * Если все сделано стоит флаг `true`, при добавлении нового слова флаг сбрасывается на `false`.
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
     * Если все текущие слова были просклонены, и в каждом слове уже есть
     * результат склонения, тогда `true`.  
     * Если было добавлено новое слово, флаг сбрасывается на `false`.
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
     * Массив содержит елементы типа `NCLNameCaseWord`.  
     * Это все слова которые нужно обработать и просклонять.
     * @property {(Array.<NCLNameCaseWord>)} Words
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
     * Переменная, в которую заносится слово с которым сейчас идет работа.
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
     * Метод `Last()` вырезает подстроки разной длины. Поскольку одинаковых  
     * вызовов бывает несколько, все результаты выполнения кэшируются в этом
     * массиве.
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
     * Номер последнего использованого правила.  
     * Устанавливается методом `Rule()`.
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
     * Массив содержит результат склонения слова  во всех падежах.
     * @property {(Array.<String>)} LastResult
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
     * Словарь содержит информацию о том, какие слова из массива `this.Words`
     * относятся к фамилии, какие к отчеству, а какие к имени.  
     * Массив нужен потому, что при добавлении слов мы не всегда знаем, какая
     * часть ФИО сейчас, поэтому после идентификации всех слов генерируется
     * массив индексов для быстрого поиска в дальнейшем.
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
     * Вероятность автоопредления пола `[0..10]`. Достаточно точно при `0.1`.
     * @property {(Float)} GenderCoef
     */
    GenderCoef {
        get {
            return this._GenderCoef
        }
        set {
            this._GenderCoef := Value
        }
    }

    /**
     * Метод очищает результаты последнего склонения слова. Нужен при склонении
     * нескольких слов.
     */
    Reset() {
        this.LastRule := 0
        this.LastResult := []
    }

    /**
     * Сбрасывает всю информацию на начальную. Очищает все слова добавленые в
     * систему.  
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
     * Устанавливает флаги о том, что система не готова и слова еще не были
     * просклонены.
     */
    NotReady() {
        this.Ready := false
        this.Finished := false
    }

    /**
     * Устанавливает номер последнего правила.
     * @param {(Int)} Index Номер правила которое нужно установить.
     */
    Rule(Index) {
        this.LastRule := Index
    }

    /**
     * Устанавливает слово текущим для работы системы. Очищает кэш слова.
     * @param {(String)} Word Слово, которое нужно установить.
     */
    SetWorkingWord(Word) {
        ; Сбрасываем настройки
        this.Reset()
        ; Ставим слово
        this.WorkingWord := StrTitle(Word)
        ; Чистим кэш
        this.WorkingLastCache := Map()
    }

    /**
     * Если не нужно склонять слово, делает результат таким же, как и
     * именительный падеж.
     */
    MakeResultTheSame() {
        /**
         * Выдавало ошибку, что нет такого индекса, поэтому заранее устаналиваю
         * длину 6
         */ 
        if this.LastResult.Length = 0
            this.LastResult.Length := this.CASECOUNT
        loop this.CASECOUNT {
            this.LastResult[A_Index] := this.WorkingWord
        }
    }

    /**
     * Если `StopAfter = 0`, вырезает `Length` последних букв из текущего слов
     * `this.WorkingWord`.  
     * Если нет - вырезает `StopAfter` букв, начиная от `Length` с конца.
     * @param {(Int)} Length Количество букв с конца.
     * @param {(Int)} StopAfter Количество вырезанных букв (`0` = все).
     * @returns {(String)} Требуемая подстрока.
     */
    Last(Length := 1, StopAfter := 0) {
        ; Сколько букв нужно вырезать все или только часть
        if (!StopAfter) {
            cut := Length
        } else {
            cut := StopAfter
        }

        ; Initialize first-level if missing
        if !this.WorkingLastCache.Has(Length)
            this.WorkingLastCache[Length] := Map()

        ; Initialize value if missing
        if !this.WorkingLastCache[Length].Has(StopAfter) {
            ; Equivalent of PHP's substr($this->workingWord, -$length, $cut)
            startPos := StrLen(this.WorkingWord) - Length + 1
            substring := SubStr(this.WorkingWord, startPos, cut)
            this.WorkingLastCache[Length][StopAfter] := substring
        }

        return this.WorkingLastCache[Length][StopAfter]
    }

    /**
     * Над текущим словом (`this.WorkingWord`) выполняются правила в порядке указаном в `RulesArray`.  
     * `Gender` служит для указания того, какие правила использовать: мужские
     * (`man`) или женские (`woman`).
     * @param {(String)} Gender Префикс мужских/женских правил.
     * @param {(Array.<Int>)} RulesArray Массив, порядок выполнения правил.
     * @returns {(Boolean)} Если правило было использовано - `true`, если нет -
     * `false`.
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
     * Если `String` - строка, проверяется входит ли буква `Letter` в строку
     * `String`.  
     * Если `String` - массив, проверяется входит ли строка `Letter` в массив
     * `String`.
     * @param {(String)} Letter Буква или строка, которую нужно искать.
     * @param {(Array|String)} String Строка или массив, в котором нужно искать.
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
     * Мой аналог функции in_array() из PHP:
     * {@link https://www.php.net/manual/en/function.in-array.php}
     * @param {(String)} Needle Искомое значение.
     * @param {(Array.<String>)} Haystack Массив.
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
     * @param {(String)} NameNeedle Имя, которое нужно найти.
     * @param {(Array)} Names Перечень имён, в котором нужно найти имя.
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
     * Склоняет слово `Word`, удаляя из него `ReplaceLast` последних букв,
     * и добавляя в каждый падеж окончание из массива `Endings`.
     * @param {(String)} Word Слово, к которому нужно добавить окончания.
     * @param {(Array.<String>)} Endings Массив окончаний.
     * @param {(Int)} ReplaceLast Сколько последних букв нужно убрать из
     * начального слова.
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
     * @param {(String)} Firstname Имя.
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
     * @param {(String)} Secondname Фамилия.
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
     * @param {(String)} Fathername Отчество.
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
     * Устанавливает пол для всех слов. Может иметь следующие значения:
     * - `0` - не определено
     * - `NCL.MAN` - мужчина
     * - `NCL.WOMAN` - женщина
     * @param {(Int)} Gender Пол, который нужно установить.
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
     * @param {(String)} SecondName Фамилия.
     * @param {(String)} FirstName Имя.
     * @param {(String)} FatherName Отчество.
     * @returns {(NCLNameCaseCore)}
     */
    SetFullName(SecondName?, FirstName?, FatherName?) {
        this.SetFirstName(FirstName?)
        this.SetSecondName(SecondName?)
        this.SetFatherName(FatherName?)
        return this
    }

    /**
     * В массив `this.Words` добавляется новый объект класса `NCLNameCaseWord`
     * со словом `Firstname` и пометкой, что это имя.
     * @param {(String)} Firstname Имя.
     * @returns {(NCLNameCaseCore)}
     */
    SetName(Firstname?) => this.SetFirstName(Firstname?)
    

    /**
     * В массив `this.Words` добавляется новый объект класса `NCLNameCaseWord`
     * со словом `Secondname` и пометкой, что это фамилия.
     * @param {(String)} Secondname Фамилия.
     * @returns {(NCLNameCaseCore)}
     */
    SetLastName(Secondname?) => this.SetSecondName(Secondname?)
    

    /**
     * В массив `this.Words` добавляется новый объект класса `NCLNameCaseWord`
     * со словом `Secondname` и пометкой, что это фамилия.
     * @deprecated Вроде бы нигде не используется, но пока оставлю тут.
     * @param {(String)} Secondname Фамилия.
     * @returns {(NCLNameCaseCore)}
     */
    SetSirName(Secondname?) => this.SetSecondName(Secondname?)

    /**
     * Если слово `Word` не идентифицировано, определяется имя это, фамилия
     * или отчество.
     * @param {(NCLNameCaseWord)} Word Слово, которое нужно идентифицировать.
     */
    PrepareNamePart(Word) {
        if (Word.GetNamePart() = "") {
            this.DetectNamePart(Word)
        }
    }

    /**
     * Проверяет все ли слова идентифицированы. Если нет, для каждого слова
     * определяется имя это, фамилия или отчество.
     */
    PrepareAllNameParts() {
        for word in this.Words {
            this.PrepareNamePart(word)
        }
    }

    /**
     * Определяет пол для слова `Word`.
     * @param {(NCLNameCaseWord)} Word Слово, для которого нужно определить пол.
     */
    PrepareGender(Word) {
        if (!Word.IsGenderSolved()) {
            NamePart := Word.GetNamePart()
            Switch (NamePart) {
                Case 'N': this.GenderByFirstName(Word)
                Case 'F': this.GenderByFatherName(Word)
                Case 'S': this.GenderBySecondName(Word)
            }
        }
    }

    /**
     * Для всех слов проверяет определен ли пол, если нет - определяет его.  
     * После этого расчитывает пол для всех слов, и устанавливает такой пол
     * всем словам.
     * @returns {(Boolean)} Был ли определен пол.
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
     * Генерируется массив, который содержит информацию о том, какие слова из
     * массива `this.Words` относятся к фамилии, какие к отчеству, а какие к
     * имени. Массив нужен потому, что при добавлении слов мы не всегда знаем
     * какая часть ФИО  обрабатывается сейчас, поэтому после идентификации всех
     * слов генерируется массив индексов для их быстрого поиска в дальнейшем.
     */
    GenerateIndex() {
        this.Index := Map("N", [], "S", [], "F", [])
        for index, word in this.Words {
            Namepart := word.GetNamePart()
            this.Index[Namepart] := index
        }
    }

    /**
     * Выполнет все необходимые подготовления для склонения.  
     * Идентфицируются все слова.  
     * Определяется пол.  
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
     * @returns {(Int)} Текущий пол человека.
     */
    GenderAutoDetect() {
        this.PrepareEverything()

        if (this.Words.Length != 0) {
            n :=-1
            MaxCoef :=-1
            for k, word in this.Words {
                Genders := word.GetGender()
                _min := Min(Genders[1], Genders[2])
                _max := Max(Genders[1], Genders[2])
                Coef := _max-_min
                if (Coef > MaxCoef) {
                    MaxCoef := Coef
                    n := k
                }
            }

            if (n >= 0) {
                if (this.Words.Has(n)) {
                    Genders := this.Words[n].GetGender()
                    _min := Min(Genders[1], Genders[2])
                    _max := Max(Genders[1], Genders[2])
                    this.GenderCoef := _max-_min

                    return this.Words[n].Gender()
                }
            }
        }
        return false
    }

    /**
     * Разбивает строку `Fullname` на слова и возвращает формат, в котором
     * записано имя.  
     * <b>Формат:</b>
     * - S - Фамилия
     * - N - Имя
     * - F - Отчество
     * @param {(String)} Fullname Cтрока, для которой необходимо определить
     * формат.
     * @returns {(Array)} Формат, в котором записано имя. Массив типа
     * `this.Words`.
     */
    SplitFullName(Fullname) {

        Fullname := Trim(Fullname)
        List := NCLStr.Explode(" ", Fullname)
        
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
     * Разбивает строку `Fullname` на слова и возвращает формат, в котором
     * записано имя.  
     * <b>Формат:</b>
     * - S - Фамилия
     * - N - Имя
     * - F - Отчество
     * @param {(String)} Fullname Строка, для которой нужно определить формат.
     * @returns {(String)} Формат, в котором записано имя.
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
     * Склоняет `Word` по нужным правилам, в зависимости от пола и типа слова.
     * @param {(NCLNameCaseWord)} Word Слово, которое нужно просклонять.
     */
    WordCase(Word) {
        Gender := (Word.Gender() == NCL.MAN ? "man" : "woman")
        
        NamePartLetter := Word.GetNamePart()
        switch NamePartLetter {
            case 'F': Namepart := "Father"
            case 'N': Namepart := "First"
            case 'S': Namepart := "Second"
        }

        Method := Gender . Namepart . "Name"

        /**
         * Если фамилия из 2х слов через дефис, разбиваем слово с дефисами
         * на части:  
         * {@link http://new.gramota.ru/spravka/buro/search-answer?s=273912}  
         */
        Temp := Word.GetWordOrig()
        CurWords := NCLStr.Explode('-', Temp)
        OCurWords := []

        Result := []
        Result.Length := this.CaseCount
        LastRule := -1

        Count := CurWords.Length
        for k, cur_word in CurWords {
            IsNormalRules := true

            ONcw := NCLNameCaseWord(cur_word)
            if ((NamePartLetter == "S") && (Count > 1) && (k < Count - 1)) {
                /**
                 * Если первая часть фамилии тоже фамилия, то склоняем по общим
                 * правилам, иначе не склоняется.
                 */
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
                    IsNormalRules := (ONcw.GetNamePart() == "S")
                } else {
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
                ; Если не склоняется, заполняем что есть.
                ResultTemp := []
                ResultTemp.Length := this.CaseCount
                loop this.CaseCount
                    ResultTemp[A_Index] := cur_word
                LastRule :=-1
            }

            ONcw.SetNameCases(ResultTemp)
            OCurWords.Push(ONcw)
        }

        ; Объединение пачки частей слова в одно слово по каждому падежу
        for ONcw in OCurWords {
            Namecases := ONcw.GetNameCases()
            for k, namecase in Namecases {
                if Result.Has(k)
                    Result[k] := Result[k] . "-" . namecase
                else
                    Result[k] := namecase
            }
        }

        ; Устанавливаем падежи для целого слова.
        Word.SetNameCases(Result, false)
        Word.SetRule(LastRule)
    }

    /**
     * Производит склонение всех слов, которые хранятся в массиве `this.Words`.
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
     * Если указан номер падежа `Number`, возвращается строка с таким номером
     * падежа.  
     * Если нет - возвращает массив со всеми падежами текущего слова.
     * @param {(NCLNameCaseWord)} Word Слово, для которого нужно вернуть падеж.
     * @param {(Int)} Number Номер падежа, который нужно вернуть.
     * @returns {(Array.<String>|String)} Массив|строка с нужным падежом.
     */
    GetWordCase(Word, Number?) {
        Cases := Word.GetNameCases()
        if (!IsSet(Number)) or (Number < 0) or (Number > this.CaseCount) {
            return Cases
        } else {
            return Cases[Number]
        }
    }

    /**
     * Если нужно просклонять несколько слов, их необходимо собрать в одну
     * строку.  
     * Эта функция собирает все слова из `IndexArray` в одну строку.
     * @param {(Array)} IndexArray Слова, которые необходимо собрать вместе.
     * @param {(Int)} Number Номер падежа.
     * @returns {(Array.<String>|String)} Массив со всеми падежами, либо строка
     * с одним падежом.
     */
    GetCasesConnected(IndexArray, Number?) {
        ReadyArr := []
        if (Type(IndexArray) != "Array") {
            ; Convert to single-element array
            IndexArray := [IndexArray]
        }
        for index in IndexArray {
            ReadyArr.Push(this.GetWordCase(this.Words[index], Number?))
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
                    ResultArr[_Case] := NCLStr.Implode(' ', Temp)
                    _Case++
                }
                return ResultArr
            } else {
                return NCLStr.Implode(' ', ReadyArr)
            }
        }
        return ""
    }

    /**
     * Функция ставит имя в нужный падеж.  
     * Если указан `Number` падежа, возвращает строку с указанным падежом.  
     * Если нет - возвращает массив со всеми падежами текущего слова.
     * @param {(Int)} Number Номер падежа.
     * @returns {(Array.<String>|String)} Массив со всеми падежами, либо строка
     * с одним падежом.
     */
    GetFirstNameCase(Number?) {
        this.AllWordCases()

        return this.GetCasesConnected(this.Index['N'], Number?)
    }

    /**
     * Функция ставит фамилию в нужный падеж.  
     * Если указан `Number` падежа, возвращает строку с указанным падежом.  
     * Если нет - возвращает массив со всеми падежами текущего слова.
     * @param {(Int)} Number Номер падежа.
     * @returns {(Array.<String>|String)} Массив со всеми падежами, либо строка
     * с одним падежом.
     */
    GetSecondNameCase(Number?) {
        this.AllWordCases()

        return this.GetCasesConnected(this.Index['S'], Number?)
    }

    /**
     * Функция ставит отчество в нужный падеж.  
     * Если указан `Number` падежа, возвращает строку с указанным падежом.  
     * Если нет - возвращает массив со всеми падежами текущего слова.
     * @param {(Int)} Number Номер падежа.
     * @returns {(Array.<String>|String)} Массив со всеми падежами, либо строка
     * с одним падежом.
     */
    GetFatherNameCase(Number?) {
        this.AllWordCases()

        return this.GetCasesConnected(this.Index['F'], Number?)
    }

    /**
     * Функция ставит имя `FirstName` в падеж `CaseNumber` по правилам пола
     * `Gender`.  
     * Если номер падежа `CaseNumber` указан, возвращает строку с таким номером
     * падежа.  
     * Если нет - возвращает массив со всеми падежами текущего слова.
     * @param {(String)} FirstName Имя, которое нужно просклонять.
     * @param {(Int)} CaseNumber Номер падежа.
     * @param {(Int)} Gender Пол, который нужно использовать.
     * @returns {(Array.<String>|String)} Массив со всеми падежами, либо строка
     * с одним падежом.
     */
    qFirstName(FirstName, CaseNumber?, Gender := 0) {
        this.FullReset()
        this.SetFirstName(FirstName)
        if IsSet(Gender) {
            this.SetGender(Gender)
        }
        return this.GetFirstNameCase(CaseNumber?)
    }

    /**
     * Функция ставит фамилию `SecondName` в нужный падеж `CaseNumber` по
     * правилам пола `Gender`.  
     * Если номер падежа `CaseNumber` указан, возвращает строку с таким номером
     * падежа.  
     * Если нет - возвращает массив со всеми падежами текущего слова.
     * @param {(String)} SecondName Фамилия, которую нужно просклонять.
     * @param {(Int)} CaseNumber Номер падежа.
     * @param {(Int)} Gender Пол, который нужно использовать.
     * @returns {(Array.<String>|String)} Массив со всеми падежами, либо строка
     * с одним падежом.
     */
    qSecondName(SecondName, CaseNumber?, Gender := 0) {
        this.FullReset()
        this.SetSecondName(SecondName)
        if (Gender) {
            this.SetGender(Gender)
        }

        return this.GetSecondNameCase(CaseNumber?)
    }

    /**
     * Функция ставит отчество `FatherName` в нужный падеж `CaseNumber` по
     * правилам пола `Gender`.  
     * Если номер падежа `CaseNumber` указан, возвращает строку с таким номером
     * падежа.  
     * Если нет - возвращает массив со всеми падежами текущего слова.
     * @param {(String)} FatherName Отчество, которое нужно просклонять.
     * @param {(Int)} CaseNumber Номер падежа.
     * @param {(Int)} Gender Пол, который нужно использовать.
     * @returns {(Array.<String>|String)} Массив со всеми падежами, либо строка
     * с одним падежом.
     */
    qFatherName(FatherName, CaseNumber?, Gender := 0) {
        this.FullReset()
        this.SetFatherName(FatherName)
        if (Gender) {
            this.SetGender(Gender)
        }
        return this.GetFatherNameCase(CaseNumber?)
}

    /**
     * Склоняет текущие слова во все падежи и форматирует слово по шаблону
     * `Format`.  
     * <b>Формат:</b>
     * - S - Фамилия
     * - N - Имя
     * - F - Отчество
     * @param {(String)} Format Формат. Например `"S N F"`.
     * @returns {(Array.<String>)} Массив со всеми падежами.
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
                i++
            }
            Result.Push(Line)
            CurCase++
        }
        return Result
    }

    /**
     * Склоняет текущие слова во все падежи и форматирует слово по шаблону
     * `Format`.  
     * <b>Формат:</b>
     * - S - Фамилия
     * - N - Имя
     * - F - Отчество
     * @param {(Array)} Format Массив с форматом.
     * @returns {(Array.<String>)} Массив со всеми падежами.
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
     * <b>Формат:</b>
     * - S - Фамилия
     * - N - Имя
     * - F - Отчество
     * @param {(Int)} CaseNum Номер падежа.
     * @param {(Array)} Format Массив с форматом.
     * @returns {(String)} Строка в нужном падеже.
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
     * @param {(Int)} CaseNum Номер падежа.
     * @param {(String)} Format Строка с форматом.
     * @returns {(String)} Строка в нужном падеже.
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
     * @param {(String)} SecondName Фамилия.
     * @param {(String)} FirstName Имя.
     * @param {(String)} FatherName Отчество.
     * @param {(Int)} Gender Пол.
     * @param {(Int)} CaseNum Номер падежа.
     * @param {(String)} Format Формат.
     * @returns {(Array.<String>|String)} Массив со всеми падежами, либо строка
     * с одним падежом.
     */
    qFullName(SecondName?, FirstName?, FatherName?, CaseNum?, Gender?,
              Format := "S N F") {
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
     * Возвращает результат в таком же формате, каком он и был.
     * @param {(String)} FullName ФИО.
     * @param {(Int)} CaseNum Номер падежа.
     * @param {(Int)} Gender Пол человека.
     * @returns {(Array.<String>|String)} Массив со всеми падежами, либо строка
     * с одним падежом.
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
     * @param {(String)} FullName ФИО.
     * @returns {(Int)} Пол человека.
     */
    GenderDetect(FullName) {
        this.FullReset()
        this.SplitFullName(FullName)
        return this.GenderAutoDetect()
    }

    /**
     * Возвращает внутренний массив `this.Words`, каждая запись имеет тип
     * `NCLNameCaseWord`.
     * @returns {Array.<NCLNameCaseWord>} Массив всех слов в системе.
     */
    GetWordsArray() => this.Words

    /**
     * Функция пытается применить цепочку правил для мужских имен.
     * @returns {(Boolean)} `true` - если было использовано правило из списка,
     * `false` - если правило не было найдено.
     */
    ManFirstName() => false

    /**
     * Функция пытается применить цепочку правил для женских имен.
     * @returns {(Boolean)} `true` - если было использовано правило из списка,
     * `false` - если правило не было найдено.
     */
    WomanFirstName() => false


    /**
     * Функция пытается применить цепочку правил для мужских фамилий.
     * @returns {(Boolean)} `true` - если было использовано правило из списка,
     * `false` - если правило не было найдено.
     */
    ManSecondName() => false

    /**
     * Функция пытается применить цепочку правил для женских фамилий.
     * @returns {(Boolean)} `true` - если было использовано правило из списка,
     * `false` - если правило не было найдено.
     */
    WomanSecondName() => false

    /**
     * Функция склоняет мужские отчества.
     * @returns {(Boolean)} `true` - если слово было успешно изменено, `false` -
     * если не получилось этого сделать.
     */
    ManFatherName() => false

    /**
     * Функция склоняет женские отчества.
     * @returns {(Boolean)} `true` - если слово было успешно изменено, `false` -
     * если не получилось этого сделать.
     */
    WomanFatherName() => false

    /**
     * Определение пола по правилам имен.
     * @param {(NCLNameCaseWord)} Word Объект класса слов, для которого нужно
     * определить пол.
     */
    GenderByFirstName(Word) {
        /**
         * Метод-пустышка, реализуется в классах NCLNameCaseRu/NCLNameCaseRu
         */
    }

    /**
     * Определение пола по правилам фамилий.
     * @param {(NCLNameCaseWord)} Word Объект класса слов, для которого нужно
     * определить пол.
     */
    GenderBySecondName(Word) {
        /**
         * Метод-пустышка, реализуется в классах NCLNameCaseRu/NCLNameCaseRu
         */
    }

    /**
     * Определение пола по правилам отчеств.
     * @param {(NCLNameCaseWord)} Word Объект класса слов, для которого нужно определить пол.
     */
    GenderByFatherName(Word) {
        /**
         * Метод-пустышка, реализуется в классах NCLNameCaseRu/NCLNameCaseRu
         */
    }

    /**
     * Идентифицирует слово определя имя это, фамилия, или отчество.
     * - <b>N</b> - имя
     * - <b>S</b> - фамилия
     * - <b>F</b> - отчество
     * @param {(NCLNameCaseWord)} Word Объект класса слов, который необходимо идентифицировать.
     */
    DetectNamePart(Word) {
        /**
         * Метод-пустышка, реализуется в классах NCLNameCaseRu/NCLNameCaseRu
         */
    }

    /**
     * Возвращает версию библиотеки.
     * @returns {(String)} Версия библиотеки
     */
    Version() => this.Version

    /**
     * Возвращает версию использованого языкового файла
     * @returns {(String)} Версия языкового файла
     */
    LanguageVersion() => this.LanguageBuild

}

/**
 * NCLNameCaseWord - класс, который служит для хранения всей информации о каждом
 * слове.  
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
     * Изначальное слово.
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
     * Содержит информацию о том, какие буквы в слове были большими, а какие
     * маленькими:  
     * - `x` - маленькая буква
     * - `X` - большая буква
     * @property {(Array.<String>)} LetterMask Массив строк типа `["X", "x", "x", "x", "x", "x",]`.
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
     * Содержит `true`, если все слово было в верхнем регистре и `false`, если
     * не было.
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
     * Массив содержит все падежи слова, полученые после склонения текущего
     * слова.
     * @property {(Array.<String>)} NameCases
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
     * Создание нового объекта со словом `Word`.
     * @property {(String)} Word Слово.
     */
    __New(Word) {
        this.WordOrig := Word
        this.GenerateMask(Word)
        this.Word := StrLower(Word)
    }

    /**
     * Генерирует маску, которая содержит информацию о том, какие буквы в слове
     * были большими, а какие маленькими:  
     * - `X` - большая буква
     * - `x` - маленькая буква
     * @param {(String)} Word Слово, для которого будет создаваться маска.
     */
    GenerateMask(Word) {
        Letters := NCLStr.SplitLetters(word)
        Mask := []
        this.IsUpperCase := true
        for letter in Letters {
            if (IsLower(letter, "Locale")) {
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
     * - `X` - большая буква
     * - `x` - маленькая буква
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
     * @param {(Array)} NameCases Массив со всеми падежами.
     * @param {(Boolean)} IsReturnMask Флаг необходимости возврата к начальной
     * маске.
     */
    SetNameCases(NameCases, IsReturnMask := true) {
        this.NameCases := NameCases
        if IsReturnMask
            this.ReturnMask()
    }

    /**
     * Возвращает массив со всеми падежами текущего слова.
     * @returns {(Array.<String>)} Массив со всеми падежами
     */
    GetNameCases() => this.NameCases

    /**
     * Возвращает строку с нужным падежом текущего слова.
     * @param {(Int)} Number Нужный падеж.
     * @returns {(String)} Строка с нужным падежом текущего слова.
     */
    getNameCase(Number) {
        if this.NameCases.Has(Number) {
            return this.NameCases[Number]
        }
        return false
    }

    /**
     * Расчитывает и возвращает пол текущего слова.
     * @returns {(Int)} Пол текущего слова.
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
     * Устанавливает вероятности того, что даное слово является мужчиной или
     * женщиной.
     * @param {(Int)} Man Вероятность того, что слово мужчина.
     * @param {(Int)} Woman Верятность того, что слово женщина.
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
     * @param {(Int)} Gender Пол человека.
     */
    SetTrueGender(Gender) {
        this.GenderSolved := Gender
    }

    /**
     * Возвращает массив вероятности того, что даное слово относится к мужчине
     * или женщине.
     * @returns {(Map)} Массив вероятностей.
     */
    GetGender() => Map(NCL.MAN, this.GenderMan, NCL.WOMAN, this.GenderWoman)

    /**
     * Устанавливает тип текущего слова.  
     * <b>Тип слова:</b>
     * - `S` - Фамилия
     * - `N` - Имя
     * - `F` - Отчество
     * @param {(String)} NamePart Тип слова.
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
     * @returns {(String)} Тип слова.
     */
    GetNamePart() => this.NamePart
    

    /**
     * Возвращает текущее слово.
     * @returns {(String)} Текущее слово.
     */
    GetWord() => this.Word

    /**
     * Возвращает текущее изначальное слово.
     * @returns {(String)} Текущее слово.
     */
    GetWordOrig() => this.WordOrig

    /**
     * Если уже был расчитан пол для всех слов системы, тогда каждому слову
     * предается окончательное решение.  
     * Эта функция определяет было ли принято окончательное решение.
     * @returns {(Boolean)} Было ли принято окончательное решение по поводу
     * пола текущего слова.
     */
    IsGenderSolved() => this.GenderSolved ? true : false

    /**
     * Устанавливает номер правила, по которому склонялось текущее слово.
     * @param {(Int)} RuleID Номер правила.
     */
    SetRule(RuleID) {
        this.Rule := RuleID
    }
}
