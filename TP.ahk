#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

CoordMode, Mouse, Client

open_rb_y := 135
open_dwg_y := 90
export_dwg_y := 300

import_rb(y) {
    if WinExist("ahk_exe RCAD_Building.exe") {
        WinActivate ; Use the window found by WinExist.

        ; �n�J
        Send, {enter}
        Sleep, 1000
        Send, {enter}
        Sleep, 3000
    }

    if WinExist("ahk_exe RCAD_Building.exe") {
        WinActivate ; Use the window found by WinExist.
    } else {
        return
    }

    Click, right, 100, 60 ; �k�� root
    Click, 175, 100 ; �s�W����

    Click, 360, 70 ; OK
    Sleep, 1000

    Click, right, 100, 85 ; �k�� building
    Click, 150, 355 ; �s�W�̾�
    Sleep, 1000
    Sleep, 1000 ; �ؾl��
    Sleep, 1000 ; �ؾl��

    Click, right, 100, 110 ; �k�� �̾�
    Click, 200, 170 ; �s��ҫ�
    Sleep, 1000 ; �ؾl��

    Click, 470, 175 ; ...
    Sleep, 1000
    Sleep, 1000 ; �ؾl��

    Click, 500, %y%, 2 ; import excel
    Sleep, 1000

    Click, 170, 325 ; start
    Sleep, 2000

    Click, 300, 325 ; exit
}

open_rb(y) {
    if WinExist("ahk_class #32770") or WinExist("RCAD_Building")
        WinActivate

    ; �n�J
    Send, {enter}
    Sleep, 1000
    Send, {enter}
    Sleep, 3000

    Send, ^o ; �}������
    Sleep, 1000 ; ����@�w�n

    Click, 500, %y%, 2 ; �}�� rb
    Sleep, 1000

    Click, 360, 70 ; OK
    Sleep, 4000

    Click, right, 70, 85 ; �k�� �ɦW
    Click, 120, 130 ; �i�}
}

export_dwg(y) {
    if WinExist("ahk_class Afx:0000000140000000:b:0000000000010003:0000000000000006:000000000E30006B") or WinExist("ahk_exe RCAD_Building.exe")
        WinActivate

    Send, {enter} ; �Ω�ĤG����X
    Sleep, 1000

    Click, right, 100, 110 ; �k�� �̾�

    Click, 195, %y% ; �ץX DWG
    Sleep, 1000

    Click, 360, 70 ; OK
    Sleep, 7000
}

open_dwg(y) {
    if WinExist("ahk_class AfxMDIFrame140u") or WinExist("RCAD_Building")
        WinActivate

    Send, ^o ; �}������
    Sleep, 1000

    Click, 330, %y%, 2 ; �}�� dwg
    Sleep, 1000

    ; Click, Middle, 500, 500, 2 ; �Y��
    Sleep, 1000

    ; Click, 1100, 710 ; �Y��
    ; Send, {WheelUp 50} ; �Y��
}

caculate_rebar() {
    if WinExist("ahk_class Afx:0000000140000000:b:0000000000010003:0000000000000006:000000000E30006B") or WinExist("ahk_exe RCAD_Building.exe")
        WinActivate

    Click, right, 100, 110 ; �k�� �̾�
    Click, 200, 225 ; �p��t��-�wű��
    Sleep, 1000
    Click, 400, 170 ; �p��
    Sleep, 8000
    Send, {enter}

    Sleep, 1000
    Click, 70, 110 ; ����
    Sleep, 1000
    Click, right, 100, 470 ; �k�� �����ҫ�
    Sleep, 1000
    Click, 200, 510 ; �i�}
    Sleep, 1000
    Send, {WheelUp 100}
    Sleep, 1000
    Click, right, 100, 470 ; �k�� �����ҫ�
    Sleep, 1000
    Click, 200, 510 ; ����

    Sleep, 1000
    Click, right, 100, 110 ; �k�� �̾�
    Click, 200, 205 ; �p��t��-�wű��
    Sleep, 1000
    Click, 400, 170 ; �p��
    Sleep, 3000
    Send, {enter}

    Sleep, 1000
    Click, right, 100, 110 ; �k�� �̾�
    Click, 200, 245 ; �p��t��-��ű��
    Sleep, 1000
    Click, 400, 200 ; ����
    Click, 400, 260 ; �p��
    Click, 400, 240 ; �p��
    Sleep, 3000
    Send, {enter}

    Sleep, 1000
    Click, right, 100, 110 ; �k�� �̾�
    Click, 200, 270 ; �p��t��-��ű��
    Sleep, 1000
    Click, 400, 110 ; ����
    Click, 400, 170 ; �p��
    Click, 400, 150 ; �p��
    Sleep, 3000
    Send, {enter}
}

!1::
    open_unit := Format("{:d}", (open_rb_y - 135) / 20 + 1)
    export_type := Format("{:d}", (export_dwg_y - 300) / 20 + 1)
    InputBox, user_input, Please input unit and type,
    (

    open unit: %open_unit%
    unit 1 = 1, unit 2 = 2, unit 5 = 5, unit 6 = 6, unit 1 + 2 = 7

    export type: %export_type%
    plane layout = 1, precast beam = 2, precast slab = 3, situ beam = 4, situ slab = 5

    example
    unit 1 + plane layout = 11
    unit 2 + situ beam = 24
    )
    ,,550,300

    unit_and_type := StrSplit(user_input)

    Switch unit_and_type[1]
    {
    Case "1":
        open_rb_y := 135 ; �椸�@
    Case "2":
        open_rb_y := 155 ; �椸�G
    Case "5":
        open_rb_y := 175 ; �椸��
    Case "6":
        open_rb_y := 195 ; �椸��
    Case "7":
        open_rb_y := 215 ; �椸�@ + �椸�G
    }

    Switch unit_and_type[2]
    {
    Case "1":
        ; �����t�m��
        open_dwg_y := 90
        export_dwg_y := 300
    Case "2":
        ; �wű��
        open_dwg_y := 105
        export_dwg_y := 320
    Case "3":
        ; �wű��
        open_dwg_y := 130
        export_dwg_y := 340
    Case "4":
        ; ��ű��
        open_dwg_y := 145
        export_dwg_y := 360
    Case "5":
        ; ��ű��
        open_dwg_y := 160
        export_dwg_y := 380
    Return
}

Return

!x::
    import_rb(open_rb_y)
Return

!z::
    open_rb(open_rb_y)
Return

!s::
    caculate_rebar()
Return

!a::
    export_dwg(export_dwg_y)
Return

!q::
    open_dwg(open_dwg_y)

Return

!c::
    open_rb(open_rb_y)
    export_dwg(export_dwg_y)
    open_dwg(open_dwg_y)

Return
