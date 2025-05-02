#Requires AutoHotkey v2.0

#Include NCL.ahk

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