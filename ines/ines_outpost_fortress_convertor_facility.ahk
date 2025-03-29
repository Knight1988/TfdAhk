#Requires AutoHotkey v2.0
#Include ..\Player.ahk

global toggle := false

F2::
{
	global toggle
    toggle := !toggle
    if toggle {
        SetTimer(Timer1, 1000)  ; Ensure Timer1 interval matches total movement time
        SetTimer(Timer2, 200) ; Start Timer 2 every 100ms
    } else {
        SetTimer(Timer1, 0)  ; Stop Timer 1
        SetTimer(Timer2, 0)  ; Stop Timer 2
    }
}

Timer1() {
    MoveForward(1000)
    MoveLeft(1000)
    MoveBackward(1000)
	
    MoveForward(1000)
    MoveRight(1000)
    MoveBackward(1000)
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