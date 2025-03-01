#Requires AutoHotkey v2.0
#Include Player.ahk

global toggle := false

F2::
{
	global toggle
    toggle := !toggle
    if toggle {
        SetTimer(Timer1, 7000)  ; Start Timer 1 immediately
        SetTimer(Timer2, 200) ; Start Timer 2 every 100ms
		MoveForward(3000)
		MoveBackward(3000)
    } else {
        SetTimer(Timer1, 0)  ; Stop Timer 1
        SetTimer(Timer2, 0)  ; Stop Timer 2
    }
}

Timer1() {
    MoveForward(3500)
    MoveBackward(3500)
}

Timer2() {
    Send("q")
}

; Reload script with F3
F3:: {
    SetTimer(Timer1, 0)  ; Stop Timer 1
    SetTimer(Timer2, 0)  ; Stop Timer 2
    Send "{w up}" ; Release W
    Send "{s up}" ; Release S
    Reload
}

; Exit script with F4
F4:: {
    SetTimer(Timer1, 0)  ; Stop Timer 1
    SetTimer(Timer2, 0)  ; Stop Timer 2
    Send "{w up}" ; Release W
    Send "{s up}" ; Release S
    ExitApp
}
