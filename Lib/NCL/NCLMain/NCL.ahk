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
    static substr(str, start, length:="") {
        return SubStr(str, start, length)
    }

    /**
     * Поиск подстроки в строке
     * @param string $haystack строка, в которой искать
     * @param string $needle подстрока, которую нужно найти
     * @param int $offset начало поиска
     * @return int позиция подстроки в строке
     */
    static strpos(haystack, needle, offset := 1) {
        return InStr(haystack, needle, CaseSense := 0, offset)
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
            uFFFF := Chr(0xFFFF)
        
            ; early exit, split by chars
            if (Delimiter = "")
                return StrSplit(String, Delimiter, OmitChars, MaxParts)
        
            return StrSplit(RegExReplace(String, Delimiter, uFFFF), uFFFF, OmitChars, MaxParts)
        }

    }
}

/**
 * @license Dual licensed under the MIT or GPL Version 2 licenses.
 * @package NameCaseLib
 */


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
	 * @var string
	 */
	version => '0.4.1'
	/**
	 * Версия языкового файла
	 * @var string
	 */
	languageBuild => '0'

    __Init() {
       this._ready := false
       this._finished := false
       this._words := []
       this._workingWord := ""
       this._workindLastCache := Map()
       this._lastRule := 0
       this._lastResult := []
       this._index := Map()
       this._gender_koef := 0 
    }
	/**
	 * Готовность системы:
	 * - Все слова идентифицированы (известо к какой части ФИО относится слово)
	 * - У всех слов определен пол
	 * Если все сделано стоит флаг true, при добавлении нового слова флаг сбрасывается на false
	 * @var bool
	 */
	ready {
        get {
            return this._ready
        }
        set {
            this._ready := Value
        }
    }
	/**
	 * Если все текущие слова было просклонены и в каждом слове уже есть результат склонения,
	 * тогда true. Если было добавлено новое слово флаг збрасывается на false
	 * @var bool
	 */
	finished {
        get {
            return this._finished
        }
        set {
            this._finished:= Value
        }
    }
	/**
	 * Массив содержит елементы типа NCLNameCaseWord. Это все слова которые нужно обработать и просклонять
	 * @var array
	 */
	words {
        get {
            return this._words
        }
        set {
            this._words := Value
        }
    }
	/**
	 * Переменная, в которую заносится слово с которым сейчас идет работа
	 * @var string
	 */
	workingWord {
        get {
            return this._workingWord
        }
        set {
            this._workingWord := Value
        }
    }
	/**
	 * Метод Last() вырезает подстроки разной длины. Посколько одинаковых вызовов бывает несколько,
	 * то все результаты выполнения кешируются в этом массиве.
	 * @var array
	 */
	workindLastCache {
        get {
            return this._workindLastCache
        }
        set {
            this._workindLastCache := Value
        }
    }
	/**
	 * Номер последнего использованого правила, устанавливается методом Rule()
	 * @var int
	 */
	lastRule {
        get {
            return this._lastRule
        }
        set {
            this._lastRule := Value
        }
    }
	/**
	 * Массив содержит результат склонения слова - слово во всех падежах
	 * @var array
	 */
	lastResult {
        get {
            return this._lastResult
        }
        set {
            this._lastResult := Value
        }
    }
	/**
	 * Массив содержит информацию о том какие слова из массива <var>$this->words</var> относятся к
	 * фамилии, какие к отчеству а какие к имени. Массив нужен потому, что при добавлении слов мы не
	 * всегда знаем какая часть ФИО сейчас, поэтому после идентификации всех слов генерируется массив
	 * индексов для быстрого поиска в дальнейшем.
	 * @var array
	 */
	index {
        get {
            return this._index
        }
        set {
            this._index := Value
        }
    }

	;вероятность автоопредления пола [0..10]. Достаточно точно при 0.1
	gender_koef {
        get {
            return this._gender_koef
        }
        set {
            this._gender_koef := Value
        }
    }

	/**
	 * Метод очищает результаты последнего склонения слова. Нужен при склонении нескольких слов.
	 */
	reset() {
		this.lastRule := 0
		this.lastResult := []
	}

	/**
	 * Сбрасывает все информацию на начальную. Очищает все слова добавленые в систему.
	 * После выполнения система готова работать с начала.
	 * @return NCLNameCaseCore
	 */
	fullReset() {
		this.words := []
		this.index := Map('N', [], 'F', [], 'S', [])
		this.reset()
		this.notReady()
		return this
	}

	/**
	 * Устанавливает флаги о том, что система не готово и слова еще не были просклонены
	 */
	notReady() {
		this.ready := false
		this.finished := false
	}

	/**
	 * Устанавливает номер последнего правила
	 * @param int $index номер правила которое нужно установить
	 */
	Rule(index) {
		this.lastRule := index
	}

	/**
	 * Устанавливает слово текущим для работы системы. Очищает кеш слова.
	 * @param string $word слово, которое нужно установить
	 */
	setWorkingWord(word) {
		; Сбрасываем настройки
		this.reset()
		; Ставим слово
		this.workingWord := word
		; Чистим кеш
		this.workindLastCache := Map()
	}

	/**
	 * Если не нужно склонять слово, делает результат таким же как и именительный падеж
	 */
	makeResultTheSame() {
		loop this.CaseCount {
			this.lastResult[A_Index] := this.workingWord
		}
	}

	/**
	 * Если <var>$stopAfter</var> = 0, тогда вырезает $length последних букв с текущего слова (<var>$this->workingWord</var>)
	 * Если нет, тогда вырезает <var>$stopAfter</var> букв начиная от <var>$length</var> с конца
	 * @param int $length количество букв с конца
	 * @param int $stopAfter количество букв которые нужно вырезать (0 - все)
	 * @return string требуемая подстрока
	 */
	Last(length:=1, stopAfter:=0) {
		; Сколько букв нужно вырезать все или только часть
		if (!stopAfter) {
            cut := length
		} else {
            cut := stopAfter
		}

        ; return NCLStr.substr(this.workingWord, -length, cut) "`n"

        ; ПРИШЛОСЬ ЗАБИТЬ НА КЭШ, Т.К. НЕ РАЗОБРАЛСЯ С НИМ
        
        ; Initialize first-level if missing
        if !this.workindLastCache.Has(length)
            this.workindLastCache[length] := Map()

        ; Initialize value if missing
        if !this.workindLastCache[length].Has(stopAfter) {
            ; Equivalent of PHP's substr($this->workingWord, -$length, $cut)
            startPos := StrLen(this.workingWord) - length + 1
            substring := SubStr(this.workingWord, startPos, cut)
            this.workindLastCache[length][stopAfter] := substring
        }

        return this.workindLastCache[length][stopAfter]
        /*

		;Проверяем кеш
		if (!(this.workindLastCache[length].Has(stopAfter))) {
			this.workindLastCache[length][stopAfter] := NCLStr.substr(this.workingWord, -length, cut)
		}
        
		return this.workindLastCache[length][stopAfter]
        */
	}

	/**
	 * Над текущим словом (<var>$this->workingWord</var>) выполняются правила в порядке указаном в <var>$rulesArray</var>.
	 * <var>$gender</var> служит для указания какие правила использовать мужские ('man') или женские ('woman')
	 * @param string $gender - префикс мужских/женских правил
	 * @param array $rulesArray - массив, порядок выполнения правил
	 * @return boolean если правило было задествовано, тогда true, если нет - тогда false
	 */
	RulesChain(gender, rulesArray) {
		for ruleID in rulesArray {
			ruleMethod := gender . 'Rule' . ruleID
			if this.%ruleMethod%() {
				return true
			}
		}
		return false
	}

	/**
	 * Если <var>$string</var> строка, тогда проверяется входит ли буква <var>$letter</var> в строку <var>$string</var>
	 * Если <var>$string</var> массив, тогда проверяется входит ли строка <var>$letter</var> в массив <var>$string</var>
	 * @param string $letter буква или строка, которую нужно искать
	 * @param mixed $string строка или массив, в котором нужно искать
	 * @return bool true если искомое значение найдено
	 */
	Contains(letter, string) {
		; Если второй параметр массив
		if (Type(string) = "Array") {
			for k, v in string {
				if v=letter {
					return true
				}
			}
			return false
		} else {
			if (!letter || NCLStr.strpos(string, letter) == false) {
				return false
			} else {
				return true
			}
		}
	}

	/**
	 * CUSTOM AHK COUNTERPART FOR in_array() in PHP
	 * @param needle 
	 * @param haystack 
	 * @param strict 
	 * @returns {Integer} 
	 */
	InArray(needle, haystack, strict := false) {
		for k, v in haystack {
			if strict {
				if v == needle {
					return true
				}
			} else {
				if v = needle {
					return true
				}
			}

		}
		return false
	}

	/**
	 * Функция проверяет, входит ли имя <var>$nameNeedle</var> в перечень имен <var>$names</var>.
	 * @param string $nameNeedle - имя которое нужно найти
	 * @param array $names - перечень имен в котором нужно найти имя
	 */
	inNames(nameNeedle, names) {
		if Type(names) != "Array" {
			names := Array(names)
		}

		for name in names {
			if (NCLStr.strtolower(nameNeedle) == NCLStr.strtolower(name)) {
				return true
			}
		}
		return false
	}

	/**
	 * Склоняет слово <var>$word</var>, удаляя из него <var>$replaceLast</var> последних букв
	 * и добавляя в каждый падеж окончание из массива <var>$endings</var>.
	 * @param string $word слово, к которому нужно добавить окончания
	 * @param array $endings массив окончаний
	 * @param int $replaceLast сколько последних букв нужно убрать с начального слова
	 */
	wordForms(word, endings, replaceLast:=0) {
		; Создаем массив с именительный падежом
		result := [this.workingWord]
        result.Length := this.CaseCount
		; Убираем в окончание лишние буквы
		word := NCLStr.substr(word, 1, NCLStr.strlen(word) - replaceLast)

		; Добавляем окончания
		padegIndex := 1
		while padegIndex < this.CaseCount {
			result[padegIndex+1] := word . endings[padegIndex]
			padegIndex++
		}

		this.lastResult := result
	}

	/**
	 * В массив <var>$this->words</var> добавляется новый об’єкт класса NCLNameCaseWord
	 * со словом <var>$firstname</var> и пометкой, что это имя
	 * @param string $firstname имя
	 * @return NCLNameCaseCore
	 */
	setFirstName(firstname := "") {
		if firstname != "" {
			; index := this.words.Length
			this.words.Push(NCLNameCaseWord(firstname))
			this.words[-1].setNamePart('N')
			this.notReady()
		}
		return this
	}

	/**
	 * В массив <var>$this->words</var> добавляется новый об’єкт класса NCLNameCaseWord
	 * со словом <var>$secondname</var> и пометкой, что это фамилия
	 * @param string $secondname фамилия
	 * @return NCLNameCaseCore
	 */
	setSecondName(secondname:="") {
		if secondname != "" {
			index := this.words.Length
			this.words[index] := NCLNameCaseWord(secondname)
			this.words[index].setNamePart('S')
			this.notReady()
		}
		return this
}

	/**
	 * В массив <var>$this->words</var> добавляется новый об’єкт класса NCLNameCaseWord
	 * со словом <var>$fathername</var> и пометкой, что это отчество
	 * @param string $fathername отчество
	 * @return NCLNameCaseCore
	 */
	setFatherName(fathername:="") {
		if fathername != "" {
			index := this.words.Length
			this.words[index] := NCLNameCaseWord(fathername)
			this.words[index].setNamePart('F')
			this.notReady()
		}
		return this
	}

	/**
	 * Всем словам устанавливается пол, который может иметь следующие значения
	 * - 0 - не определено
	 * - NCL::$MAN - мужчина
	 * - NCL::$WOMAN - женщина
	 * @param int $gender пол, который нужно установить
	 * @return NCLNameCaseCore
	 */
	setGender(gender:=0) {
		for word in this.words {
			word.setTrueGender(gender)
		}
		return this
	}

	/**
	 * В система заносится сразу фамилия, имя, отчество
	 * @param string $secondName фамилия
	 * @param string $firstName имя
	 * @param string $fatherName отчество
	 * @return NCLNameCaseCore
	 */
	setFullName(secondName:="", firstName:="", fatherName:="") {
			this.setFirstName(firstName)
			this.setSecondName(secondName)
			this.setFatherName(fatherName)
			return this
	}

	/**
	 * В массив <var>$this->words</var> добавляется новый об’єкт класса NCLNameCaseWord
	 * со словом <var>$firstname</var> и пометкой, что это имя
	 * @param string $firstname имя
	 * @return NCLNameCaseCore
	 */
	setName(firstname:="") => this.setFirstName(firstname)
	

	/**
	 * В массив <var>$this->words</var> добавляется новый об’єкт класса NCLNameCaseWord
	 * со словом <var>$secondname</var> и пометкой, что это фамилия
	 * @param string $secondname фамилия
	 * @return NCLNameCaseCore
	 */
	setLastName(secondname:="") => this.setSecondName(secondname)
	

	/**
	 * В массив <var>$this->words</var> добавляется новый об’єкт класса NCLNameCaseWord
	 * со словом <var>$secondname</var> и пометкой, что это фамилия
	 * @param string $secondname фамилия
	 * @return NCLNameCaseCore
	 */
	setSirName(secondname:="") => this.setSecondName(secondname)

	/**
	 * Если слово <var>$word</var> не идентифицировано, тогда определяется это имя, фамилия или отчество
	 * @param {NCLNameCaseWord} $word слово которое нужно идентифицировать
	 */
	prepareNamePart(word) {
		if (word.getNamePart() = "") {
			this.detectNamePart(word)
		}
	}

	/**
	 * Проверяет все ли слова идентифицированы, если нет тогда для каждого определяется это имя, фамилия или отчество
	 */
	prepareAllNameParts() {
		for word in this.words {
			this.prepareNamePart(word)
		}
	}

	/**
	 * Определяет пол для слова <var>$word</var>
	 * @param {NCLNameCaseWord} word слово для которого нужно определить пол
	 */
	prepareGender(word) {
        if Type(word) != "NCLNameCaseWord"
            throw TypeError(A_LineFile A_Tab A_ThisFunc A_Tab "Параметром должен был объект типа 'NCLNameCaseWord', но вместо него - " Type(word))
		if (!word.isGenderSolved()) {
			namePart := word.getNamePart()
			switch (namePart) {
				case 'N': this.GenderByFirstName(word)
				case 'F': this.GenderByFatherName(word)
				case 'S': this.GenderBySecondName(word)
			}
		}
	}

	/**
	 * Для всех слов проверяет определен ли пол, если нет - определяет его
	 * После этого расчитывает пол для всех слов и устанавливает такой пол всем словам
	 * @return bool был ли определен пол
	 */
	solveGender() {
		; Ищем, может гдето пол уже установлен
		for word in this.words {
			if (word.isGenderSolved()) {
				this.setGender(word.gender())
				return true
			}
		}

		; Если нет тогда определяем у каждого слова и потом сумируем
		man := 0
		woman := 0

		for word in this.words {
			this.prepareGender(word)
			gender := word.getGender()
			man+=gender[NCL.MAN]
			woman+=gender[NCL.WOMAN]
		}

		if (man > woman) {
			this.setGender(NCL.MAN)
		} else {
			this.setGender(NCL.WOMAN)
		}

		return true
	}

	/**
	 * Генерируется массив, который содержит информацию о том какие слова из массива <var>$this->words</var> относятся к
	 * фамилии, какие к отчеству а какие к имени. Массив нужен потому, что при добавлении слов мы не
	 * всегда знаем какая часть ФИО сейчас, поэтому после идентификации всех слов генерируется массив
	 * индексов для быстрого поиска в дальнейшем.
	 */
	generateIndex() {
		this.index := Map("N", [], "S", [], "F", [])
		for index, word in this.words {
			namepart := word.getNamePart()
			this.index[namepart] := index
		}
	}

	/**
	 * Выполнет все необходимые подготовления для склонения.
	 * Все слова идентфицируются. Определяется пол.
	 * Обновляется индекс.
	 */
	prepareEverything() {
		if (!this.ready) {
			this.prepareAllNameParts()
			this.solveGender()
			this.generateIndex()
			this.ready := true
		}
	}

	/**
	 * По указаным словам определяется пол человека:
	 * - 0 - не определено
	 * - NCL::$MAN - мужчина
	 * - NCL::$WOMAN - женщина
	 * @return int текущий пол человека
	 */
	genderAutoDetect() {
		this.prepareEverything()

		if (this.words.Length != 0) {
			n :=-1
			max_koef :=-1
			for k, word in this.words {
				genders := word.getGender()
				_min := Min(genders)
				_max := Max(genders)
				koef := _max-_min
				if (koef > max_koef) {
					max_koef := koef
					n := k
				}
			}

			if (n>=0) {
				if (this.words.Has(n)) {
					genders := this.words[n].getGender()
					_min := Min(genders)
					_max := Max(genders)
					this.gender_koef := _max-_min

					return this.words[n].gender()
				}
			}
		}
		return false
	}

	/**
	 * Разбивает строку <var>$fullname</var> на слова и возвращает формат в котором записано имя
	 * <b>Формат:</b>
	 * - S - Фамилия
	 * - N - Имя
	 * - F - Отчество
	 * @param string $fullname строка, для которой необходимо определить формат
	 * @return array формат в котором записано имя массив типа <var>$this->words</var>
	 */
	splitFullName(fullname) {

		fullname := Trim(fullname)
		list := NCLStr.explode(" ", fullname)
        
		for word in list {
            this.words.Push(NCLNameCaseWord(word))
		}
        
		this.prepareEverything()
		formatArr := []
        
		for word in this.words {
            formatArr.Push(word.getNamePart())
		}

		return this.words
	}

	/**
	 * Разбивает строку <var>$fullname</var> на слова и возвращает формат в котором записано имя
	 * <b>Формат:</b>
	 * - S - Фамилия
	 * - N - Имя
	 * - F - Отчество
	 * @param string $fullname строка, для которой необходимо определить формат
	 * @return string формат в котором записано имя
	 */
	getFullNameFormat(fullname) {
		this.fullReset()
		words := this.splitFullName(fullname)
		format := ""
		for word in words {
			format .= word.getNamePart()
            if A_Index != words.Length
                format .= " "
		}
		return format
	}

	/**
	 * Склоняет слово <var>$word</var> по нужным правилам в зависимости от пола и типа слова
	 * @param NCLNameCaseWord $word слово, которое нужно просклонять
	 */
	WordCase(word) {
        if Type(word) != "NCLNameCaseWord"
            throw TypeError(A_LineFile A_Tab A_ThisFunc A_Tab "Параметром должен был объект типа 'NCLNameCaseWord', но вместо него - " Type(word))
		gender := (word.gender() == NCL.MAN ? "man" : "woman")
        
		; namepart := ""
        
        ; MsgBox word.getNamePart()
		name_part_letter := word.getNamePart()
		switch name_part_letter {
			case 'F': namepart := "Father"
			case 'N': namepart := "First"
			case 'S': namepart := "Second"
		}

		method := gender . namepart . "Name"

		; если фамилия из 2х слов через дефис
		; http://new.gramota.ru/spravka/buro/search-answer?s=273912

		; рабоиваем слово с дефисами на части
		tmp := word.getWordOrig()
		cur_words := NCLStr.explode('-', tmp)
		o_cur_words := []

		result := []
        result.Length := this.CaseCount
		last_rule := -1

		cnt := cur_words.Length
		for k, cur_word in cur_words {
			is_norm_rules := true

			o_ncw := NCLNameCaseWord(cur_word)
			if (name_part_letter == "S" && cnt>1 && k<cnt-1 ) {
				; если первая часть фамилии тоже фамилия, то склоняем по общим правилам
				;наче не склоняется

				exclusion := ["тулуз"] ;исключения
				cur_word_ := StrLower(cur_word)

                has_exclusion := false
                for k, v in exclusion {
                    if v = cur_word_ {
                        has_exclusion := true
                        break
                    }
                }

				if has_exclusion = false {
					o_nc := NCLNameCaseRu()
					o_nc.detectNamePart(o_ncw)
					is_norm_rules := (o_ncw.getNamePart()=="S")
				}
				else {
					is_norm_rules := false
				}
			}

			this.setWorkingWord(cur_word)

            this_method_result := this.%method%()
			if (is_norm_rules && this_method_result) {
				; склоняется
				result_tmp := this.lastResult
				last_rule := this.lastRule
			} else {
				; не склоняется. Заполняем что есть
				result_tmp := []
				loop this.CaseCount
					result_tmp[A_Index] := cur_word
				last_rule :=-1
			}

			o_ncw.setNameCases(result_tmp)
			o_cur_words.Push(o_ncw)
		}

		; объединение пачку частей слова в одно слово по каждому падежу
		for o_ncw in o_cur_words {
			namecases := o_ncw.getNameCases()
			for k, namecase in namecases {
				if result.Has(k)
					result[k] := result[k] . "-" . namecase
				else
					result[k] := namecase
			}
		}

		; устанавливаем падежи для целого слова
		word.setNameCases(result, false)
		word.setRule(last_rule)
	}

	/**
	 * Производит склонение всех слов, который хранятся в массиве <var>$this->words</var>
	 */
	AllWordCases() {
		if (!this.finished) {
			this.prepareEverything()

			for word in this.words {
				this.WordCase(word)
			}

			this.finished := true
		}
	}

	/**
	 * Если указан номер падежа <var>$number</var>, тогда возвращается строка с таким номером падежа,
	 * если нет, тогда возвращается массив со всеми падежами текущего слова.
	 * @param NCLNameCaseWord $word слово для котрого нужно вернуть падеж
	 * @param int $number номер падежа, который нужно вернуть
	 * @return mixed массив или строка с нужным падежом
	 */
	getWordCase(word, number := "") {
        if Type(word) != "NCLNameCaseWord"
            throw TypeError(A_LineFile A_Tab A_ThisFunc A_Tab "Параметром должен был объект типа 'NCLNameCaseWord', но вместо него - " Type(word))
		cases := word.getNameCases()
		if ((number = "") or number < 0 or number > (this.CaseCount - 1)) {
			return cases
		} else  {
			return cases[number]
		}
	}

	/**
	 * Если нужно было просклонять несколько слов, то их необходимо собрать в одну строку.
	 * Эта функция собирает все слова указаные в <var>$indexArray</var>  в одну строку.
	 * @param array $indexArray индексы слов, которые необходимо собрать вместе
	 * @param int $number номер падежа
	 * @return mixed либо массив со всеми падежами, либо строка с одним падежом
	 */
	getCasesConnected(indexArray, number?) {
		readyArr := []
        if (Type(indexArray) != "Array") {
            ; Convert to single-element array
            indexArray := [indexArray]
        }
		for index in indexArray {
			readyArr.Push(this.getWordCase(this.words[index], number))
		}

		all := readyArr.Length
		if all {
			if (Type(readyArr[1]) = "Array") {
				; Масив нужно скелить каждый падеж
				resultArr := []
				_case := 0
				while (_case < this.CaseCount) {
					tmp := []
					i := 0
					while i < all {
						tmp.Push(readyArr[i][_case])
						i++
					}
					resultArr[_case] := NCLStr.implode(' ', tmp)
					_case++
				}
				return resultArr
			} else {
				return NCLStr.implode(' ', readyArr)
			}
		}
		return ""
	}

	/**
	 * Функция ставит имя в нужный падеж.
	 *
	 * Если указан номер падежа <var>$number</var>, тогда возвращается строка с таким номером падежа,
	 * если нет, тогда возвращается массив со всеми падежами текущего слова.
	 * @param int $number номер падежа
	 * @return mixed массив или строка с нужным падежом
	 */
	getFirstNameCase(number:="") {
		this.AllWordCases()

		return this.getCasesConnected(this.index['N'], number)
	}

	/**
	 * Функция ставит фамилию в нужный падеж.
	 *
	 * Если указан номер падежа <var>$number</var>, тогда возвращается строка с таким номером падежа,
	 * если нет, тогда возвращается массив со всеми падежами текущего слова.
	 * @param int $number номер падежа
	 * @return mixed массив или строка с нужным падежом
	 */
	getSecondNameCase(number?) {
		this.AllWordCases()

		return this.getCasesConnected(this.index['S'], number)
	}

	/**
	 * Функция ставит отчество в нужный падеж.
	 *
	 * Если указан номер падежа <var>$number</var>, тогда возвращается строка с таким номером падежа,
	 * если нет, тогда возвращается массив со всеми падежами текущего слова.
	 * @param int $number номер падежа
	 * @return mixed массив или строка с нужным падежом
	 */
	getFatherNameCase(number := "") {
		this.AllWordCases()

		return this.getCasesConnected(this.index['F'], number)
	}

	/**
	 * Функция ставит имя <var>$firstName</var> в нужный падеж <var>$CaseNumber</var> по правилам пола <var>$gender</var>.
	 *
	 * Если указан номер падежа <var>$CaseNumber</var>, тогда возвращается строка с таким номером падежа,
	 * если нет, тогда возвращается массив со всеми падежами текущего слова.
	 * @param string $firstName имя, которое нужно просклонять
	 * @param int $CaseNumber номер падежа
	 * @param int $gender пол, который нужно использовать
	 * @return mixed массив или строка с нужным падежом
	 */
	qFirstName(firstName, CaseNumber := "", gender := 0) {
		this.fullReset()
		this.setFirstName(firstName)
		if (gender) {
			this.setGender(gender)
		}
		return this.getFirstNameCase(CaseNumber)
	}

	/**
	 * Функция ставит фамилию <var>$secondName</var> в нужный падеж <var>$CaseNumber</var> по правилам пола <var>$gender</var>.
	 *
	 * Если указан номер падежа <var>$CaseNumber</var>, тогда возвращается строка с таким номером падежа,
	 * если нет, тогда возвращается массив со всеми падежами текущего слова.
	 * @param string $secondName фамилия, которую нужно просклонять
	 * @param int $CaseNumber номер падежа
	 * @param int $gender пол, который нужно использовать
	 * @return mixed массив или строка с нужным падежом
	 */
	qSecondName(secondName, CaseNumber := "", gender := 0) {
		this.fullReset()
		this.setSecondName(secondName)
		if (gender) {
			this.setGender(gender)
		}

		return this.getSecondNameCase(CaseNumber)
	}

	/**
	 * Функция ставит отчество <var>$fatherName</var> в нужный падеж <var>$CaseNumber</var> по правилам пола <var>$gender</var>.
	 *
	 * Если указан номер падежа <var>$CaseNumber</var>, тогда возвращается строка с таким номером падежа,
	 * если нет, тогда возвращается массив со всеми падежами текущего слова.
	 * @param string $fatherName отчество, которое нужно просклонять
	 * @param int $CaseNumber номер падежа
	 * @param int $gender пол, который нужно использовать
	 * @return mixed массив или строка с нужным падежом
	 */
	qFatherName(fatherName, CaseNumber := "", gender := 0) {
		this.fullReset()
		this.setFatherName(NCLNameCaseWord(fatherName))
		if (gender) {
			this.setGender(gender)
		}
		return this.getFatherNameCase(CaseNumber)
}

	/**
	 * Склоняет текущие слова во все падежи и форматирует слово по шаблону <var>$format</var>
	 * <b>Формат:</b>
	 * - S - Фамилия
	 * - N - Имя
	 * - F - Отчество
	 * @param string $format строка формат
	 * @return array массив со всеми падежами
	 */
	getFormattedArray(format) {
		if (Type(format) = "Array") {
			return this.getFormattedArrayHard(format)
		}

		length := NCLStr.strlen(format)
		result := []
		cases := Map()
		cases['S'] := this.getCasesConnected(this.index['S'])
		cases['N'] := this.getCasesConnected(this.index['N'])
		cases['F'] := this.getCasesConnected(this.index['F'])

		curCase := 0
		while (curCase < this.CaseCount) {
			line := ""
			i := 0
			while (i < length) {
				symbol := NCLStr.substr(format, i, 1)
				if (symbol == 'S') {
					line.=cases['S'][curCase]
				} else if (symbol == 'N') {
					line.=cases['N'][curCase]
				} else if (symbol == 'F') {
					line.=cases['F'][curCase]
				} else {
					line.=symbol
				}
				i++
			}
			result.Push(line)
			curCase++
		}
		return result
	}

	/**
	 * Склоняет текущие слова во все падежи и форматирует слово по шаблону <var>$format</var>
	 * <b>Формат:</b>
	 * - S - Фамилия
	 * - N - Имя
	 * - F - Отчество
	 * @param array $format массив с форматом
	 * @return array массив со всеми падежами
	 */
	getFormattedArrayHard(format) {
		result := []
		cases := []
		for word in format {
			cases.Push(word.getNameCases())
		}
		curCase := 1
		while (curCase < this.CaseCount) {
			line := ""
			for value in cases {
				line .= value[curCase] . ' '
			}
			result.Push(Trim(line))
			curCase++
		}
		return result
	}

	/**
	 * Склоняет текущие слова в падеж <var>$caseNum</var> и форматирует слово по шаблону <var>$format</var>
	 * <b>Формат:</b>
	 * - S - Фамилия
	 * - N - Имя
	 * - F - Отчество
	 * @param array $format массив с форматом
	 * @return string строка в нужном падеже
	 */
	getFormattedHard(caseNum := 1, format := []) {
		result := ""
		for word in format {

            cases := word.getNameCases()

			result .= cases[caseNum] . " "
		}
		return Trim(result)
	}

	/**
	 * Склоняет текущие слова в падеж <var>$caseNum</var> и форматирует слово по шаблону <var>$format</var>
	 * <b>Формат:</b>
	 * - S - Фамилия
	 * - N - Имя
	 * - F - Отчество
	 * @param string $format строка с форматом
	 * @return string строка в нужном падеже
	 */
	getFormatted(caseNum := 1, format := "S N F") {
        this.AllWordCases()
        ; MsgBox Type(format)
        ; Если не указан падеж используем другую функцию
        if (caseNum = "" or !caseNum) {
            return this.getFormattedArray(format)
        }
        ; Если формат сложный
        else if (Type(format) = "Array") {
            return this.getFormattedHard(caseNum, format)
        }
        else {
            length := StrLen(format)
            result := ""
            i := 1
            while i < length {
                symbol := NCLStr.substr(format, 1, 1)
                if (symbol == 'S') {
                    result.=this.getSecondNameCase(caseNum)
                } else if (symbol == 'N') {
                    result.=this.getFirstNameCase(caseNum)
                } else if (symbol == 'F') {
                    result.=this.getFatherNameCase(caseNum)
                } else {
                    result.=symbol
                }
                i++
            }
            return result
        }
	}

	/**
	 * Склоняет фамилию <var>$secondName</var>, имя <var>$firstName</var>, отчество <var>$fatherName</var>
	 * в падеж <var>$caseNum</var> по правилам пола <var>$gender</var> и форматирует результат по шаблону <var>$format</var>
	 * <b>Формат:</b>
	 * - S - Фамилия
	 * - N - Имя
	 * - F - Отчество
	 * @param string $secondName фамилия
	 * @param string $firstName имя
	 * @param string $fatherName отчество
	 * @param int $gender пол
	 * @param int $caseNum номер падежа
	 * @param string $format формат
	 * @return mixed либо массив со всеми падежами, либо строка
	 */
	qFullName(secondName := "", firstName := "", fatherName := "", gender := 0, caseNum := 0, format := "S N F")
	{
		this.fullReset()
		this.setFirstName(firstName)
		this.setSecondName(secondName)
		this.setFatherName(fatherName)
		if (gender) {
			this.setGender(gender)
		}

		return this.getFormatted(caseNum, format)
	}

	/**
	 * Склоняет ФИО <var>$fullname</var> в падеж <var>$caseNum</var> по правилам пола <var>$gender</var>.
	 * Возвращает результат в таком же формате, как он и был.
	 * @param string $fullname ФИО
	 * @param int $caseNum номер падежа
	 * @param int $gender пол человека
	 * @return mixed либо массив со всеми падежами, либо строка
	 */
	q(fullname, caseNum?, gender?) {
		this.fullReset()
		format := this.getFullNameFormat(fullname)
		if IsSet(gender) {
            this.setGender(gender)
		}
		return this.getFormatted(caseNum, format)
	}

	/**
	 * Определяет пол человека по ФИО
	 * @param string $fullname ФИО
	 * @return int пол человека
	 */
	genderDetect(fullname) {
		this.fullReset()
		this.splitFullName(fullname)
		return this.genderAutoDetect()
	}

	/**
	 * Возвращает внутренний массив $this->words каждая запись имеет тип NCLNameCaseWord
	 * @return array Массив всех слов в системе
	 */
	getWordsArray() => this.words

	/**
	 * Функция пытается применить цепочку правил для мужских имен
	 * @return boolean true - если было использовано правило из списка, false - если правило не было найденым
	 */
	manFirstName() => false

	/**
	 * Функция пытается применить цепочку правил для женских имен
	 * @return boolean true - если было использовано правило из списка, false - если правило не было найденым
	 */
	womanFirstName() => false


	/**
	 * Функция пытается применить цепочку правил для мужских фамилий
	 * @return boolean true - если было использовано правило из списка, false - если правило не было найденым
	 */
	manSecondName() => false

	/**
	 * Функция пытается применить цепочку правил для женских фамилий
	 * @return boolean true - если было использовано правило из списка, false - если правило не было найденым
	 */
	womanSecondName() => false

	/**
	 * Функция склоняет мужский отчества
	 * @return boolean true - если слово было успешно изменено, false - если не получилось этого сделать
	 */
	manFatherName() => false

	/**
	 * Функция склоняет женские отчества
	 * @return boolean true - если слово было успешно изменено, false - если не получилось этого сделать
	 */
	womanFatherName() => false

	/**
     * ИЗНАЧАЛЬНО МЕТОД БЫЛ ПУСТОЙ ИЗ-ЗА НАСЛЕДОВАНИЯ. В КЛАССЕ NCLNAMECASERU ОПИСЫВАЛСЯ МЕТОД ПОД РУССКИЕ ИМЕНА, НО В AHK ОБРАТНОЙ НАСЛЕДТСВЕННОСТИ НЕТ (?) И ПУСТОЙ МЕТОД НЕ РАБОТАЛ.
	 * Определение пола по правилам имен
	 * @param NCLNameCaseWord $word обьект класса слов, для которого нужно определить пол
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
     * ИЗНАЧАЛЬНО МЕТОД БЫЛ ПУСТОЙ ИЗ-ЗА НАСЛЕДОВАНИЯ. В КЛАССЕ NCLNAMECASERU ОПИСЫВАЛСЯ МЕТОД ПОД РУССКИЕ ИМЕНА, НО В AHK ОБРАТНОЙ НАСЛЕДТСВЕННОСТИ НЕТ (?) И ПУСТОЙ МЕТОД НЕ РАБОТАЛ.
	 * Определение пола по правилам фамилий
	 * @param NCLNameCaseWord $word обьект класса слов, для которого нужно определить пол
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
     * ИЗНАЧАЛЬНО МЕТОД БЫЛ ПУСТОЙ ИЗ-ЗА НАСЛЕДОВАНИЯ. В КЛАССЕ NCLNAMECASERU ОПИСЫВАЛСЯ МЕТОД ПОД РУССКИЕ ИМЕНА, НО В AHK ОБРАТНОЙ НАСЛЕДТСВЕННОСТИ НЕТ (?) И ПУСТОЙ МЕТОД НЕ РАБОТАЛ.
	 * Определение пола по правилам отчеств
	 * @param NCLNameCaseWord $word обьект класса слов, для которого нужно определить пол
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
     * ИЗНАЧАЛЬНО МЕТОД БЫЛ ПУСТОЙ ИЗ-ЗА НАСЛЕДОВАНИЯ. В КЛАССЕ NCLNAMECASERU ОПИСЫВАЛСЯ МЕТОД ПОД РУССКИЕ ИМЕНА, НО В AHK ОБРАТНОЙ НАСЛЕДТСВЕННОСТИ НЕТ (?) И ПУСТОЙ МЕТОД НЕ РАБОТАЛ.
	 * Идетифицирует слово определяе имя это, или фамилия, или отчество
	 * - <b>N</b> - имя
	 * - <b>S</b> - фамилия
	 * - <b>F</b> - отчество
	 * @param NCLNameCaseWord $word обьект класса слов, который необходимо идентифицировать
	 */
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

        /**
         * буквы на которые никогда не заканчиваются имена
         */
        if (this.Contains(this.Last(1), 'еёжхцочшщъыэю')) {
            /**
             * Просто исключения
             */
            if (this.inNames(namepart, ['Мауриц'])) {
                first += 10
            } else {
                second += 0.3
            }
        }

        /**
         * Используем массив характерных окончаний
         */
        if ((this.splitSecondExclude.Has(this.Last(2, 1)))) {
            if (!this.Contains(this.Last(1), this.splitSecondExclude[this.Last(2, 1)])) {
                second += 0.4
            }
        }

        /**
         * Сокращенные ласкательные имена типя Аня Галя и.т.д.
         */
        if (this.Last(1) == 'я' and this.Contains(this.Last(3, 1), this.vowels)) {
            first += 0.5
        }

        /**
         * Не бывает имен с такими предпоследними буквами
         */
        if (this.Contains(this.Last(2, 1), 'жчщъэю')) {
            second += 0.3
        }

        /**
         * Слова на мягкий знак. Существует очень мало имен на мягкий знак. Все остальное фамилии
         */
        if (this.Last(1) == 'ь') {
            /**
             * Имена типа нинЕЛь адЕЛь асЕЛь
             */
            if (this.Last(3, 2) == 'ел') {
                first += 0.7
            }
            /**
             * Просто исключения
             */
            else if (this.inNames(namepart, ['Лазарь', 'Игорь', 'Любовь'])) {
                first += 10
            }
            /**
             * Если не то и не другое, тогда фамилия
             */
            else {
                second += 0.3
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
                second += 0.25
            }
        }

        /**
         * Слова, которые заканчиваются на тин
         */
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

        /**
         * Фамилии которые заканчиваются на -ли кроме тех что типа натАли и.т.д.
         */
        if (this.Last(2) == 'ли' and this.Last(3, 1) != 'а') {
            second+=0.4
        }

        /**
         * Фамилии на -як кроме тех что типа Касьян Куприян + Ян и.т.д.
         */
        if (this.Last(2) == 'ян' and length > 2 and !this.Contains(this.Last(3, 1), 'ьи')) {
            second+=0.4
        }

        /**
         * Фамилии на -ур кроме имен Артур Тимур
         */
        if (this.Last(2) == 'ур') {
            if (!this.inNames(namepart, ['Артур', 'Тимур'])) {
                second += 0.4
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
                first += 0.3
            } else {
                second += 0.4
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
                first+=10
            }
            /**
             * Исключения
             */
            else if (this.inNames(namepart, ['Мальвина', 'Антонина', 'Альбина', 'Агриппина', 'Фаина', 'Карина', 'Марина', 'Валентина', 'Калина', 'Аделина', 'Алина', 'Ангелина', 'Галина', 'Каролина', 'Павлина', 'Полина', 'Элина', 'Мина', 'Нина', 'Дина'])) {
                first+=10
            }
            /**
             * Иначе фамилия
             */
            else {
                second += 0.4
            }
        }

        /**
         * Имена типа Николай
         */
        if (this.Last(4) == 'олай') {
            first += 0.6
        }

        /**
         * Фамильные окончания
         */
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

	/**
	 * Возвращает версию библиотеки
	 * @return string версия библиотеки
	 */
	version() => this.version

	/**
	 * Возвращает версию использованого языкового файла
	 * @return string версия языкового файла
	 */
	languageVersion() => this.languageBuild

}

/**
 * @license Dual licensed under the MIT or GPL Version 2 licenses.
 * @package NameCaseLib
 */

/**
 * NCLNameCaseWord - класс, который служит для хранения всей информации о каждом слове
 *
 * @author Андрей Чайка <bymer3@gmail.com>
 * @version 0.4.1
 * @package NameCaseLib
 */
class NCLNameCaseWord {

    __Init() {
        this._word := ""
        this._word_orig := ""
        this._namePart := ""
        this._genderMan := 0
        this._genderWoman := 0
        this._genderSolved := 0
        this._letterMask := []
        this._isUpperCase := false
        this._NameCases := []
        this._rule := 0
    }

    /**
     * Слово в нижнем регистре, которое хранится в об’єкте класса
     * @var string
     */
    word {
        get {
            return this._word
        }
        set {
            this._word := Value
        }
    }

    /**
     * Оригинальное слово
     * @var string
     */
    word_orig {
        get {
            return this._word_orig
        }
        set {
            this._word_orig := Value
        }
    }

    /**
     * Тип текущей записи (Фамилия/Имя/Отчество)
     * - <b>N</b> - ім’я
     * - <b>S</b> - прізвище
     * - <b>F</b> - по-батькові
     * @var string
     */
    namePart {
        get {
            return this._namePart
        }
        set {
            this._namePart := Value
        }
    }

    /**
     * Вероятность того, что текущей слово относится к мужскому полу
     * @var int
     */
    genderMan {
        get {
            return this._genderMan
        }
        set {
            this._genderMan := Value
        }
    }

    /**
     * Вероятность того, что текущей слово относится к женскому полу
     * @var int
     */
    genderWoman {
        get {
            return this._genderWoman
        }
        set {
            this._genderWoman := Value
        }
    }

    /**
     * Окончательное решение, к какому полу относится слово
     * - 0 - не определено
     * - NCL::$MAN - мужской пол
     * - NCL::$WOMAN - женский пол
     * @var int
     */
    genderSolved {
        get {
            return this._genderSolved
        }
        set {
            this._genderSolved := Value
        }
    }

    /**
     * Маска больших букв в слове.
     *
     * Содержит информацию о том, какие буквы в слове были большими, а какие мальникими:
     * - x - маленькая буква
     * - X - больная буква
     * @var array
     */
    letterMask {
        get {
            return this._letterMask
        }
        set {
            this._letterMask := Value
        }
    }

    /**
     * Содержит true, если все слово было в верхнем регистре и false, если не было
     * @var bool
     */
    isUpperCase {
        get {
            return this._isUpperCase
        }
        set {
            this._isUpperCase := Value
        }
    }

    /**
     * Массив содержит все падежи слова, полученые после склонения текущего слова
     * @var array
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
     * Номер правила, по которому было произведено склонение текущего слова
     * @var int
     */
    rule {
        get {
            return this._rule
        }
        set {
            this._rule := Value
        }
    }

    /**
     * Создание нового обьекта со словом <var>$word</var>
     * @param string $word слово
     */
    __New(word) {
        this.word_orig := word
        this.generateMask(word)
        this.word := StrLower(word)
    }

    /**
     * Генерирует маску, которая содержит информацию о том, какие буквы в слове были большими, а какие маленькими:
     * - x - маленькая буква
     * - X - больная буква
     * @param string $word слово, для которого генерировать маску
     */
    generateMask(word) {
        letters := NCLStr.splitLetters(word)
        mask := []
        this.isUpperCase := true
        for letter in letters {
            if (NCLStr.isLowerCase(letter)) {
                mask.Push("x")
                this.isUpperCase := false
            } else {
                mask.Push("X")
            }
        }
        this.letterMask := mask
    }

    /**
     * Возвращает все падежи слова в начальную маску:
     * - x - маленькая буква
     * - X - больная буква
     */
    returnMask() {
        if this.isUpperCase {
            for index, _case in this.NameCases {
                this.NameCases[index] := StrUpper(_case)
            }
        } else {
            SplitedMask := this.letterMask
            maskLength := splitedMask.Length
            for index, _case in this.NameCases {
                caseLength := StrLen(_case)
                _max := Min([caseLength, maskLength]*)
                this.NameCases[index] := ''
                LetterIndex := 1
                while (letterIndex <= _max) {
                    letter := SubStr(_case, letterIndex, 1)
                    if (splitedMask[letterIndex] == 'X') {
                        letter := StrUpper(letter)
                    }
                    this.NameCases[index] .= letter
                    letterIndex++
                }
                if StrLen(_case) = StrLen(this.NameCases[index])
                    continue
                this.NameCases[index] .= SubStr(_case, _max + 1)
            }
        }
    }

    /**
     * Сохраняет результат склонения текущего слова
     * @param array $nameCases массив со всеми падежами
     */
    setNameCases(nameCases, is_return_mask:=true) {
        this.NameCases := nameCases
        if is_return_mask
            this.returnMask()
    }

    /**
     * Возвращает массив со всеми падежами текущего слова
     * @return array массив со всеми падежами
     */
    getNameCases() => this.NameCases

    /**
     * Возвращает строку с нужным падежом текущего слова
     * @param int $number нужный падеж
     * @return string строка с нужным падежом текущего слова
     */
    getNameCase(number) {
        if this.NameCases.Has(number) {
            return this.NameCases[number]
        }
        return false
    }

    /**
     * Расчитывает и возвращает пол текущего слова
     * @return int пол текущего слова
     */
    gender() {
        if !this.genderSolved {
            if this.genderMan >= this.genderWoman {
                this.genderSolved := NCL.MAN
            } else {
                this.genderSolved := NCL.WOMAN
            }
        }
        return this.genderSolved
    }

    /**
     * Устанавливает вероятности того, что даное слово является мужчиной или женщиной
     * @param int $man вероятность того, что слово мужчина
     * @param int $woman верятность того, что слово женщина
     */
    setGender(man, woman) {
            this.genderMan := man
            this.genderWoman := woman
    }

    /**
     * Окончательно устанавливает пол человека
     * - 0 - не определено
     * - NCL::$MAN - мужчина
     * - NCL::$WOMAN - женщина
     * @param int $gender пол человека
     */
    setTrueGender(gender) {
        this.genderSolved := gender
    }

    /**
     * Возвращает массив вероятности того, что даное слово является мужчиной или женщиной
     * @return array массив вероятностей
     */
    getGender() => Map(NCL.MAN, this.genderMan, NCL.WOMAN, this.genderWoman)

    /**
     * Устанавливает тип текущего слова
     * <b>Тип слова:</b>
     * - S - Фамилия
     * - N - Имя
     * - F - Отчество
     * @param string $namePart тип слова
     */
    setNamePart(namePart) {
        this.namePart := namePart
    }

    /**
     * Возвращает тип текущего слова
     * <b>Тип слова:</b>
     * - S - Фамилия
     * - N - Имя
     * - F - Отчество
     * @return string $namePart тип слова
     */
    getNamePart() => this.namePart
    

    /**
     * Возвращает текущее слово.
     * @return {String} Текущее слово
     */
    getWord() => this.word

    /**
     * Возвращает текущее оригинальное слово.
     * @return string текущее слово
     */
    getWordOrig() => this.word_orig

    /**
     * Если уже был расчитан пол для всех слов системы, тогда каждому слову предается окончательное
     * решение. Эта функция определяет было ли принято окончательное решение.
     * @return bool было ли принято окончательное решение по поводу пола текущего слова
     */
    isGenderSolved() => this.genderSolved ? true : false

    /**
     * Устанавливает номер правила по которому склонялось текущее слово.
     * @param int $ruleID номер правила
     */
    setRule(ruleID) {
        this.rule := ruleID
    }
}

/**
 * @license Dual licensed under the MIT or GPL Version 2 licenses.
 * @package NameCaseLib
 */

/**
 * <b>NCL NameCase Russian Language</b>
 * 
 * Русские правила склонения ФИО
 * Правила определения пола человека по ФИО для русского языка
 * Система разделения фамилий имен и отчеств для русского языка
 * 
 * @author Андрей Чайка <bymer3@gmail.com>
 * @version 0.4.1
 * @package NameCaseLib
 */
class NCLNameCaseRu extends NCLNameCaseCore {

    /**
     * Версия языкового файла
     * @var string 
     */
    languageBuild => "11072716"
    /**
     * Количество падежей в языке
     * @var int
     */
    CaseCount {
        get {
            return 6
        }
    }
    /**
     * Список гласных русского языка
     * @var string 
     */
    vowels {
        get {
            return "аеёиоуыэюя"
        }
    }
    /**
     * Список согласных русского языка
     * @var string  
     */
    consonant {
        get {
            return "бвгджзйклмнпрстфхцчшщ"
        }
    }
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
     * Мужские и женские имена, оканчивающиеся на -а, склоняются, 
     * как и любые существительные с таким же окончанием
     * @return bool true если правило было задействовано и false если нет. 
     */
    womanRule1() {
        if (this.Last(1) == "а" and this.Last(2, 1) != 'и') {
            if (!this.Contains(this.Last(2, 1), 'шхкг')) {
                this.wordForms(this.workingWord, ['ы', 'е', 'у', 'ой', 'е'], 1)
                this.Rule(101)
                return true
            } else {
                ; ей посля шиплячего
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

a := NCLNameCaseRu()
res := a.q("Гудечек Максим", 2)
MsgBox res