#Requires AutoHotkey v2
#Include <NCL\NCL>
#Include <NCL\NCLStr>

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

		/**
		 * Слово в нижнем регистре, которое хранится в об’єкте класса
		 * @var string
		 */
		word := ""

		/**
		 * Оригинальное слово
		 * @var string
		 */
		word_orig := ""

		/**
		 * Тип текущей записи (Фамилия/Имя/Отчество)
		 * - <b>N</b> - ім’я
		 * - <b>S</b> - прізвище
		 * - <b>F</b> - по-батькові
		 * @var string
		 */
		namePart := ""

		/**
		 * Вероятность того, что текущей слово относится к мужскому полу
		 * @var int
		 */
		genderMan := 0

		/**
		 * Вероятность того, что текущей слово относится к женскому полу
		 * @var int
		 */
		genderWoman := 0

		/**
		 * Окончательное решение, к какому полу относится слово
		 * - 0 - не определено
		 * - NCL::$MAN - мужской пол
		 * - NCL::$WOMAN - женский пол
		 * @var int
		 */
		genderSolved := 0

		/**
		 * Маска больших букв в слове.
		 *
		 * Содержит информацию о том, какие буквы в слове были большими, а какие мальникими:
		 * - x - маленькая буква
		 * - X - больная буква
		 * @var array
		 */
		letterMask := []

		/**
		 * Содержит true, если все слово было в верхнем регистре и false, если не было
		 * @var bool
		 */
		isUpperCase := false

		/**
		 * Массив содержит все падежи слова, полученые после склонения текущего слова
		 * @var array
		 */
		NameCases := []

		/**
		 * Номер правила, по которому было произведено склонение текущего слова
		 * @var int
		 */
		rule := 0

		/**
		 * Создание нового обьекта со словом <var>$word</var>
		 * @param string $word слово
		 */
		__New(word) {
			this.word_orig := word
			this.generateMask(word)
			this.word := NCLStr.strtolower(word)
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
            this._letterMask := mask
		}

		/**
		 * Возвращает все падежи слова в начальную маску:
		 * - x - маленькая буква
		 * - X - больная буква
		 */
		returnMask() {
            if this.isUpperCase {
                for k, v in this.NameCases 
                    this.NameCases[k] := NCLStr.strtoupper(v)
            } else {
                splitedMask := this.letterMask
                maskLength := maskLength.Length
                for k, v in this.NameCases {
                    caseLength := NCLStr.strlen(v)
                    max := Min([caseLength, maskLength]*)
                    this.NameCases[k] := ''
                    letterIndex := 0
                    while (letterIndex < max) {
                        letter := NCLStr.substr(v, letterIndex, 1)
                        if (splitedMask[letterIndex] == 'X') {
                            letter := NCLStr.strtoupper(letter)
                        }
                        this.NameCases[k] .= letter
                        letterIndex++
                    }
                    this.NameCases[k] .= NCLStr.substr(v, max, caseLength-maskLength)
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
                if this.genderMan >= this._genderWoman {
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
		 * @return string текущее слово
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