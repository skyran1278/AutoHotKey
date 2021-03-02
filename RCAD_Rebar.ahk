#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

CoordMode, Mouse, Client

open() {
    if WinExist("ahk_exe RCAD_Rebar.exe") {
        WinActivate ; Use the window found by WinExist.

        ; �n�J
        Send, {enter}
        Sleep, 1000
        Send, {enter}
        Sleep, 3000
    } else {
        return
    }

    Click, 260, 40 ; ���� �I��ؿ�
    Send, ^o ; �}������
    Sleep, 1000

    Send, D:\RCAD_Rebar\2021-0302 RCAD-���������Ӫ�-�϶�SigoAva-Mu.dwg ; �}������
    Click, 500, 140, 2 ; �}��
    Sleep, 1000

    Send, {enter}
    Send, {enter}
    Sleep, 1000

    Click, right, 70, 210 ; �k�� �϶� block
    Click, 200, 270 ; ���� import
    Sleep, 1000
    Sleep, 1000

    Click, 500, 140, 2 ; �}��
    Sleep, 1000
    Send, {enter}

    Sleep, 1000
    Click, right, 120, 110 ; �k�� ���Ϧ� 1
    Click, 200, 200 ; ���� �ץX�Ƴ�

}

export() {
    if WinExist("ahk_exe EXCEL.EXE") {
        WinKill ; ���� excel
        Sleep, 1000
    }

    if WinExist("ahk_exe RCAD_Rebar.exe") {
        WinActivate ; Use the window found by WinExist.

        Click, 300, 515 ; ���� �ץX
        send, {enter} ; �л\�ɮ�
    }
}

!z::
    open()
    export()
Return

!x::
    export()
Return

!a::
    Send, D:\RCAD_Rebar\2021-0302 RCAD-���������Ӫ�-�϶�SigoAva-Mu.dwg ; �}������
Return

