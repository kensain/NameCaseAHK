#Requires AutoHotkey v2
#Include ./NCL.ahk

/**
 * <b>NCL NameCase Russian Language</b>  
 * Русские правила склонения ФИО.  
 * Правила определения пола человека по ФИО для русского языка.  
 * Система разделения фамилий имен и отчеств для русского языка.
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
     * @property {(Int)} CASECOUNT
     */
    CASECOUNT := 6

    /**
     * Список гласных русского языка.
     * @property {(String)} VOWELS
     */
    VOWELS := "аеёиоуыэюя"

    /**
     * Список согласных русского языка.
     * @property {(String)} CONSONANT
     */
    CONSONANT := "бвгджзйклмнпрстфхцчшщ"
    
    /**
     * Окончания имен/фамилий, который не склоняются
     * @property {(Array.<String>)} OVO
     */
    OVO := [ 'ово', 'аго', 'яго', 'ирь']
    
    /**
     * Окончания имен/фамилий, который не склоняются
     * @property {(Array.<String>)} IH
     */
    IH := ['их', 'ых', 'ко', 'уа'] ; Бенуа, Франсуа

    /**
     * Список окончаний, характерных для фамилий.  
     * По шаблону {letter}* где * любой символ кроме тех, что в {exclude}
     * @property {(Map.<String, String>)} SPLITSECONDEXCLUDE
     */
    SPLITSECONDEXCLUDE := Map(
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

    NAMES_MAN := [
        'Вова', 'Анри', 'Питер', 'Пауль', 'Франц', 'Вильям', 'Уильям',
        'Альфонс', 'Ганс', 'Франс', 'Филиппо', 'Андреа', 'Корнелис',
        'Фрэнк', 'Леонардо', 'Джеймс', 'Отто', 'жан-пьер', 'Джованни',
        'Джозеф', 'Педро', 'Адольф', 'Уолтер', 'Антонио', 'Якоб', 'Эсташ',
        'Адрианс', 'Франческо', 'Доменико', 'Ханс', 'Гун', 'Шарль',
        'Хендрик', 'Амброзиус', 'Таддео', 'Фердинанд', 'Джошуа', 'Изак',
        'Иоганн', 'Фридрих', 'Эмиль', 'Умберто', 'Франсуа', 'Ян', 'Эрнст',
        'Георг', 'Карл'
    ]

    /**
     * Мужские имена, оканчивающиеся на любой <u>ь</u> и <u>-й</u>, 
     * скло­няются так же, как обычные существительные мужского рода.
     * @returns {(Boolean)} `true`, если правило было задействовано, и `false`,
     * если нет.
     */
    manRule1() {
        /*
        МЕТОД THIS.IN() БЫЛ ПЕРЕИМЕНОВАН в THIS.CONTAINS()
        */
        if (this.Contains(this.Last(1), 'ьй')) {
            if (this.InNames(this.WorkingWord, ["Дель"])) {
                this.Rule(101)
                this.MakeResultTheSame()
                return true
            }

            if (this.Last(2, 1) != "и") {
                this.WordForms(this.WorkingWord, ['я', 'ю', 'я', 'ем', 'е'], 1)
                this.Rule(102)
                return true
            } else {
                this.WordForms(this.WorkingWord, ['я', 'ю', 'я', 'ем', 'и'], 1)
                this.Rule(103)
                return true
            }
        }
        return false
    }

    /**
     * Мужские имена, оканчивающиеся на любой твёрдую согласную, 
     * склоняются так же, как обычные существительные мужского рода.
     * @returns {(Boolean)} `true`, если правило было задействовано, и `false`,
     * если нет.
     */
    manRule2() {
        if (this.Contains(this.Last(1), this.CONSONANT)) {
            if (this.InNames(this.WorkingWord, "Павел")) {
                this.LastResult := [
                    "Павел", "Павла", "Павлу", "Павла", "Павлом", "Павле"
                ]
                this.Rule(201)
                return true
            } else if (this.InNames(this.WorkingWord, "Лев")) {
                this.LastResult := [
                    "Лев", "Льва", "Льву", "Льва", "Львом", "Льве"
                ]
                this.Rule(202)
                return true
            } else if (this.InNames(this.WorkingWord, 'ван')) {
                this.Rule(203)
                this.MakeResultTheSame()
                return true
            } else {
                this.WordForms(this.WorkingWord, ['а', 'у', 'а', 'ом', 'е'])
                this.Rule(204)
                return true
            }
        }
        return false
    }

    /**
     * Мужские и женские имена, оканчивающиеся на <u>-а</u>, склоняются, как и
     * любые существительные с таким же окончанием.  
     * Мужские и женские имена, оканчивающиеся иа <u>-я</u>, <u>-ья</u>,
     * <u>-ия</u>, <u>-ея</u>, независимо от языка, из которого они происходят,
     * склоняются, как существительные с соответствующими окончаниями.
     * @returns {(Boolean)} `true`, если правило было задействовано, и `false`,
     * если нет.
     */
    manRule3() {
        if (this.Last(1) == "а") {
                if (this.InNames(this.WorkingWord, ['фра', 'Дега', 'Андреа',
                                                    'Сёра', 'Сера'])) {
                this.Rule(301)
                this.MakeResultTheSame()
                return true
            } else if (!this.Contains(this.Last(2, 1), 'кшгх')) {
                this.WordForms(this.WorkingWord, ['ы', 'е', 'у', 'ой', 'е'], 1)
                this.Rule(302)
                return true
            } else {
                this.WordForms(this.WorkingWord, ['и', 'е', 'у', 'ой', 'е'], 1)
                this.Rule(303)
                return true
            }
        } else if (this.Last(1) == "я")  {
            this.WordForms(this.WorkingWord, ['и', 'е', 'ю', 'ей', 'е'], 1)
            this.Rule(303)
            return true
        }
        return false
    }

    /**
     * Мужские фамилии, оканчивающиеся на <u>-ь</u> и <u>-й</u>, склоняются так
     * же, как обычные существительные мужского рода.
     * @returns {(Boolean)} `true`, если правило было задействовано, и `false`,
     * если нет.
     */
    manRule4() {
        if (this.Contains(this.Last(1), 'ьй')) {

            ; Слова типа Воробей
            if (this.Last(3) == 'бей') {
                this.WordForms(this.WorkingWord,
                               ['ья', 'ью', 'ья', 'ьем', 'ье'], 2)
                this.Rule(400)
                return true
            } else if (this.Last(3, 1) == 'а'
                       OR
                       this.Contains(this.Last(2, 1), 'ел')) {
                this.WordForms(this.WorkingWord, ['я', 'ю', 'я', 'ем', 'е'], 1)
                this.Rule(401)
                return true
            }
            ; Толстой -» ТолстЫм 
            else if (this.Last(2, 1) == 'ы' or this.Last(3, 1) == 'т')
            {
                this.WordForms(this.WorkingWord,
                               ['ого', 'ому', 'ого', 'ым', 'ом'], 2)
                this.Rule(402)
                return true
            }
            ; Лесничий
            else if (this.Last(3) == 'чий') {
                this.WordForms(this.WorkingWord,
                               ['ьего', 'ьему', 'ьего', 'ьим', 'ьем'], 2)
                this.Rule(403)
                return true
            } else if (!this.Contains(this.Last(2, 1), this.VOWELS)
                       OR
                       this.Last(2, 1) == 'и') {
                this.WordForms(this.WorkingWord, 
                               ['ого', 'ому', 'ого', 'им', 'ом'], 2)
                this.Rule(404)
                return true
            } else {
                this.MakeResultTheSame()
                this.Rule(405)
                return true
            }
        }
        return false
    }

    /**
     * Мужские фамилии, оканчивающиеся на <u>-к</u>.
     * @returns {(Boolean)} `true`, если правило было задействовано, и `false`,
     * если нет.
     */
    manRule5() {
        if (this.Last(1) == 'к') {
            /** https://www.analizfamilii.ru/Gudachek/skloneniye.html} */
            if (this.Contains(this.Last(3), 'чек')) {
                this.WordForms(this.WorkingWord, ['а', 'у', 'а', 'ом', 'е'])
                this.Rule(503)
                return true
            }
            ; Если перед слово на ок, то нужно убрать о
            ; Поллок
            if (this.Last(4)=='енок' OR this.Last(4)=='ёнок') {
                this.WordForms(this.WorkingWord,
                               ['ка', 'ку', 'ка', 'ком', 'ке'], 2)
                this.Rule(501)
                return true
            }
            ; Лотрек
            if (this.Last(2, 1) == 'е'
                AND
                !this.InArray(this.Last(3, 1), ['р'])) {
                this.WordForms(this.WorkingWord,
                               ['ька', 'ьку', 'ька', 'ьком', 'ьке'], 2)
                this.Rule(502)
                return true
            } else {
                this.WordForms(this.WorkingWord, ['а', 'у', 'а', 'ом', 'е'])
                this.Rule(503)
                return true
            }
        }
        return false
    }

    /**
     * Мужские фамилии на согласную, выбираем <u>ем/ом/ым</u>.
     * @returns {(Boolean)} `true`, если правило было задействовано, и `false`,
     * если нет.
     */
    manRule6() {
        if (this.Last(1) == 'ч') {
            this.WordForms(this.WorkingWord, ['а', 'у', 'а', 'ем', 'е'])
            this.Rule(601)
            return true
        }
        ; е перед ц выпадает
        else if (this.Last(2) == 'ец') {
            this.WordForms(this.WorkingWord, ['ца', 'цу', 'ца', 'цом', 'це'], 2)
            this.Rule(604)
            return true
        } else if (this.Contains(this.Last(1), 'цсршмхт')) {
            this.WordForms(this.WorkingWord, ['а', 'у', 'а', 'ом', 'е'])
            this.Rule(602)
            return true
        } else if (this.Contains(this.Last(1), this.CONSONANT)) {
            this.WordForms(this.WorkingWord, ['а', 'у', 'а', 'ым', 'е'])
            this.Rule(603)
            return true
        }
        return false
    }

    /**
     * Мужские фамилии на <u>-а</u> и <u>-я</u>.
     * @returns {(Boolean)} `true`, если правило было задействовано, и `false`,
     * если нет.
     */
    manRule7() {
        if (this.Last(1) == "а")  {
            if (this.InNames(this.WorkingWord, ['да'])) {
                this.Rule(701)
                this.MakeResultTheSame()
                return true
            }
            ; Если основа на ш, то нужно и, ей
            if (this.Last(2, 1) == 'ш')  {
                this.WordForms(this.WorkingWord, ['и', 'е', 'у', 'ей', 'е'], 1)
                this.Rule(702)
                return true
            } else if (this.Contains(this.Last(2, 1), 'хкг')) {
                this.WordForms(this.WorkingWord, ['и', 'е', 'у', 'ой', 'е'], 1)
                this.Rule(703)
                return true
            } else {
                this.WordForms(this.WorkingWord, ['ы', 'е', 'у', 'ой', 'е'], 1)
                this.Rule(704)
                return true
            }
        } else if (this.Last(1) == "я") {
            this.WordForms(this.WorkingWord, ['ой', 'ой', 'ую', 'ой', 'ой'], 2)
            this.Rule(705)
            return true
        }
        return false
    }

    /**
     * Не склоняются мужские фамилии.
     * @returns {(Boolean)} `true`, если правило было задействовано, и `false`,
     * если нет.
     */
    manRule8() {
        if (this.Contains(this.Last(3), this.OVO)
            OR
            this.Contains(this.Last(2), this.Ih)) {
            if ( this.InNames(this.WorkingWord, ['рерих']) )
                return false
            this.Rule(8)
            this.MakeResultTheSame()
            return true
        }
        return false
    }

    /**
     * Мужские и женские имена, оканчивающиеся на <u>-а</u>, склоняются, 
     * как и любые существительные с таким же окончанием.
     * @returns {(Boolean)} `true`, если правило было задействовано, и `false`,
     * если нет.
     */
    womanRule1() {
        if (this.Last(1) == "а" and this.Last(2, 1) != 'и') {
            if (!this.Contains(this.Last(2, 1), 'шхкг')) {
                this.WordForms(this.WorkingWord, ['ы', 'е', 'у', 'ой', 'е'], 1)
                this.Rule(101)
                return true
            } else {
                ; ей посля шипящего
                if (this.Last(2, 1) == 'ш') {
                    this.WordForms(this.WorkingWord,
                                   ['и', 'е', 'у', 'ей', 'е'], 1)
                    this.Rule(102)
                    return true
                } else {
                    this.WordForms(this.WorkingWord,
                                   ['и', 'е', 'у', 'ой', 'е'], 1)
                    this.Rule(103)
                    return true
                }
            }
        }
        return false
    }

    /**
     * Мужские и женские имена, оканчивающиеся на <u>-я</u>, <u>-ья</u>,
     * <u>-ия</u>, <u>-ея</u>, независимо от языка, из которого они происходят,
     * склоняются, как сущест­вительные с соответствующими окончаниями.
     * @returns {(Boolean)} `true`, если правило было задействовано, и `false`,
     * если нет.
     */
    womanRule2() {
        if (this.Last(1) == "я") {
            if (this.Last(2, 1) != "и") {
                this.WordForms(this.WorkingWord, ['и', 'е', 'ю', 'ей', 'е'], 1)
                this.Rule(201)
                return true
            } else {
                this.WordForms(this.WorkingWord, ['и', 'и', 'ю', 'ей', 'и'], 1)
                this.Rule(202)
                return true
            }
        }
        return false
    }

    /**
     * Русские женские имена, оканчивающиеся на мягкую согласную, склоняются, 
     * как существительные женского рода типа дочь/тень.
     * @returns {(Boolean)} `true`, если правило было задействовано, и `false`,
     * если нет.
     */
    womanRule3() {
        if (this.Last(1) == "ь") {
            this.WordForms(this.WorkingWord, ['и', 'и', 'ь', 'ью', 'и'], 1)
            this.Rule(3)
            return true
        }
        return false
    }

    /**
     * Женские фамилия, оканчивающиеся на <u>-а</u>/<u>-я</u>, склоняются,
     * как и любые существительные с таким же окончанием.
     * @returns {(Boolean)} `true`, если правило было задействовано, и `false`,
     * если нет.
     */
    womanRule4() {
        if (this.Last(1) == "а") {
            if (this.Contains(this.Last(2, 1), 'гк')) {
                this.WordForms(this.WorkingWord, ['и', 'е', 'у', 'ой', 'е'], 1)
                this.Rule(401)
                return true
            }  else if (this.Contains(this.Last(2, 1), 'ш')) {
                this.WordForms(this.WorkingWord, ['и', 'е', 'у', 'ей', 'е'], 1)
                this.Rule(402)
                return true
            } else {
                this.WordForms(this.WorkingWord,
                               ['ой', 'ой', 'у', 'ой', 'ой'], 1)
                this.Rule(403)
                return true
            }
        } else if (this.Last(1) == "я") {
            this.WordForms(this.WorkingWord, ['ой', 'ой', 'ую', 'ой', 'ой'], 2)
            this.Rule(404)
            return true
        }
        return false
    }

    /**
     * Функция пытается применить цепочку правил для мужских имен.
     * @returns {(Boolean)} `true`, если было использовано правило из списка,
     * `false` - если нет.
     */
    manFirstName() {
        if (this.InNames(this.WorkingWord, ['Старший', 'Младший'])) {
            this.WordForms(this.WorkingWord,
                           ['его', 'ему', 'его', 'им', 'ем'], 2)
            return true
        }
        if (this.InNames(this.WorkingWord, ['Мариа'])) {
            ; Альфонс Мария Муха
            this.WordForms(this.WorkingWord, ['и', 'и', 'ю', 'ей', 'ии'], 1)
            return true
        }
        return this.RulesChain('man',[ 1, 2, 3])
    }

    /**
     * Функция пытается применить цепочку правил для женских имен.
     * @returns {(Boolean)} `true`, если было использовано правило из списка,
     * `false` - если нет.
     */
    womanFirstName() => this.RulesChain('woman', [1, 2, 3])

    /**
     * Функция пытается применить цепочку правил для мужских фамилий.
     * @returns {(Boolean)} `true`, если было использовано правило из списка,
     * `false` - если нет.
     */
    manSecondName() => this.RulesChain('man', [8, 4, 5, 6, 7])

    /**
     * Функция пытается применить цепочку правил для женских фамилий.
     * @returns {(Boolean)} `true`, если было использовано правило из списка,
     * `false` - если нет.
     */
    womanSecondName() => this.RulesChain('woman', [4])

    /**
     * Функция склоняет мужские отчества.
     * @returns {(Boolean)} `true`, если слово было успешно изменено, `false` - 
     * если не получилось этого сделать.
     */
    manFatherName() { 
        ; Проверяем действительно ли отчество
        if (this.InNames(this.WorkingWord, 'Ильич'))  {
            this.WordForms(this.WorkingWord, ['а', 'у', 'а', 'ом', 'е'])
            return true
        } else if (this.Last(2) == 'ич') {
            this.WordForms(this.WorkingWord, ['а', 'у', 'а', 'ем', 'е'])
            return true
        }
        return false
    }

    /**
     * Функция склоняет женские отчества.
     * @returns {(Boolean)} `true`, если слово было успешно изменено, `false` - 
     * если не получилось этого сделать.
     */
    womanFatherName() {
        ; Проверяем действительно ли отчество
        if (this.Last(2) == 'на') {
            this.WordForms(this.WorkingWord, ['ы', 'е', 'у', 'ой', 'е'], 1)
            return true
        }
        return false
    }

    /**
     * Определение пола по правилам имен.
     * @param {(NCLNameCaseWord)} Word Объект класса слов, для которого нужно определить пол.
     */
    GenderByFirstName(Word) {
        this.SetWorkingWord(Word.GetWord())

        man := 0 ; Мужчина
        woman := 0 ; Женщина
        ; Попробуем выжать максимум из имени
        ; Если имя заканчивается на й, то скорее всего мужчина
        if (this.Last(1) == 'й') {
            man+=0.9
        }

        ; 'по'=Филиппо; 'до'=Леонардо
        Suffixes := [
            'он', 'ов', 'ав', 'ам', 'ол', 'ан', 'рд', 'мп', 'по', 'до', 'др',
            'рт'
        ]
        if (this.Contains(this.Last(2), Suffixes)) {
            man+=0.3
        }
        
        if (this.Contains(this.Last(1), this.CONSONANT)) {
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

        Suffixes := ['лья', 'вва', 'ока', 'ука', 'ита', 'эль', 'реа']
        ; 'эль' =Рафаэль, Габриэль; 'реа'=Андреа
        if (this.Contains(this.Last(3), Suffixes)) {
            man+=0.2
        }

        if (this.Contains(this.Last(3), ['има'])) {
            woman+=0.15
        }

        Suffixes := ['лия', 'ния', 'сия', 'дра', 'лла', 'кла', 'опа', 'вия']
        if (this.Contains(this.Last(3), Suffixes)) {
            woman+=0.5
        }

        Suffixes := ['льда', 'фира', 'нина', 'лита', 'алья']
        if (this.Contains(this.Last(4), Suffixes)) {
            woman+=0.5
        }
        
        if (this.InNames(this.WorkingWord, this.NAMES_MAN)) {
            man += 10
        }
        Names := [
            'Бриджет', 'Элизабет', 'Маргарет', 'Джанет', 'Жаклин', 'Эвелин'
        ]
        if (this.InNames(this.WorkingWord, Names)) {
            woman += 10
        }

        ; Исключение для Берил Кук, которая женщина
        if (this.InNames(this.WorkingWord, ['Берил'])) {
            woman += 0.05
        }

        Word.SetGender(man, woman)
    }

    /**
     * Определение пола по правилам фамилий.
     * @param {(NCLNameCaseWord)} Word Объект класса слов, для которого нужно
     * определить пол.
     */
    GenderBySecondName(Word) {
        this.SetWorkingWord(Word.GetWord())

        man := 0 ; Мужчина
        woman := 0 ; Женщина

        if (this.Contains(this.Last(2),
                          ['ов', 'ин', 'ев', 'ий', 'ёв', 'ый', 'ын', 'ой'])) {
            man+=0.4
        }

        if (this.Contains(this.Last(3),
                          ['ова', 'ина', 'ева', 'ёва', 'ына', 'мин'])) {
            woman+=0.4
        }

        if (this.Contains(this.Last(2), ['ая'])) {
            woman+=0.4
        }

        Word.SetGender(man, woman)
    }

    /**
     * Определение пола по правилам отчеств.
     * @param {(NCLNameCaseWord)} Word Объект класса слов, для которого нужно
     * определить пол.
     */
    GenderByFatherName(Word) {
        this.SetWorkingWord(Word.GetWord())

        if (this.Last(2) == 'ич') {
            Word.SetGender(10, 0) ; мужчина
        }
        if (this.Last(2) == 'на') {
            Word.SetGender(0, 12) ; женщина
        }
    }

    /**
     * Идентифицирует слово определя имя это, фамилия, или отчество.
     * - <b>N</b> - имя
     * - <b>S</b> - фамилия
     * - <b>F</b> - отчество
     * @param {(NCLNameCaseWord)} Word Объект класса слов, который необходимо идентифицировать.
     */
    DetectNamePart(Word) {
    
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
        ; var := this.Last(2, 1)
        ; var2 := this.Last(1)
        ; var3 := this.SplitSecondExclude[this.Last(2, 1)]
        if ((this.SplitSecondExclude.Has(this.Last(2, 1)))) {
            if (!this.Contains(this.Last(1),
                this.SplitSecondExclude[this.Last(2, 1)])) {
                Second += 0.4
            }
        }

        /**
         * Сокращенные ласкательные имена типя Аня Галя и.т.д.
         */
        if this.Last(1) == 'я' and this.Contains(this.Last(3, 1), this.VOWELS) {
            First += 0.5
        }

        /**
         * Не бывает имен с такими предпоследними буквами
         */
        if (this.Contains(this.Last(2, 1), 'жчщъэю')) {
            Second += 0.3
        }

        /**
         * Слова на мягкий знак. Существует очень мало имен на мягкий знак. Всё
         * остальное - фамилии.
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
        else if (this.Contains(this.Last(1), this.CONSONANT . 'ь')
                    AND
                    this.Contains(this.Last(2, 1), this.CONSONANT . 'ь')) {
            /**
             * Практически все кроме тех которые оканчиваются на следующие буквы
             */
            if (!this.Contains(this.Last(2), ['др', 'кт', 'лл', 'пп', 'рд',
                                                'рк', 'рп', 'рт', 'тр'])) {
                Second += 0.25
            }
        }

        /**
         * Слова, которые заканчиваются на тин
         */
        if (this.Last(3) == 'тин' AND this.Contains(this.Last(4, 1), 'нст')) {
            First += 0.5
        }

        ; Исключения
        ; 'Мариа'=Альфонс Мариа Муха
        ; 'Эвелин'=женские иностранные
        Names := [
            'Лев', 'Яков', 'Вова', 'Маша', 'Ольга', 'Еремей','Исак',
            'Исаак', 'Ева', 'Ирина', 'Элькин', 'Мерлин', 'Макс', 'Алекс',
            'Мариа', 'Бриджет', 'Элизабет', 'Маргарет', 'Джанет', 'Жаклин',
            'Эвелин'
        ]
        if (this.InNames(Namepart, Names)
            OR
            this.InNames(Namepart, this.Names_man)) {
            First += 10
        }

        /**
         * Фамилии которые заканчиваются на -ли кроме тех что типа натАли и.т.д.
         */
        if (this.Last(2) == 'ли' AND this.Last(3, 1) != 'а') {
            Second += 0.4
        }

        /**
         * Фамилии на -як кроме тех что типа Касьян Куприян + Ян и.т.д.
         */
        if (this.Last(2) == 'ян' AND Length > 2
            AND
            !this.Contains(this.Last(3, 1), 'ьи')) {
            Second += 0.4
        }

        /**
         * Фамилии на -ур, кроме имен Артур Тимур
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
            Names := [
                'Мальвина', 'Антонина', 'Альбина', 'Агриппина', 'Фаина',
                'Карина', 'Марина', 'Валентина', 'Калина', 'Аделина', 'Алина',
                'Ангелина', 'Галина', 'Каролина', 'Павлина', 'Полина', 'Элина',
                'Мина', 'Нина', 'Дина'
            ]
            /**
             * Все похожие на Катерина и Кристина
             */
            if (this.Contains(this.Last(7), ['атерина', 'ристина'])) {
                First += 10
            }
            /**
             * Исключения
             */
            else if (this.InNames(Namepart, Names)) {
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
        FamilySuffixes := [
            'ов', 'ин', 'ев', 'ёв', 'ый', 'ын', 'ой', 'ук', 'як', 'ца', 'ун',
            'ок', 'ая', 'ёк', 'ив', 'ус', 'ак', 'яр', 'уз', 'ах', 'ай'
        ]
        if (this.Contains(this.Last(2), FamilySuffixes)) {
            Second += 0.4
        }

        FamilySuffixes := [
            'ова', 'ева', 'ёва', 'ына', 'шен', 'мей', 'вка', 'шир', 'бан',
            'чий', 'кий', 'бей', 'чан', 'ган', 'ким', 'кан', 'мар', 'лис'
        ]
        if (this.Contains(this.Last(3), FamilySuffixes)) {
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
}