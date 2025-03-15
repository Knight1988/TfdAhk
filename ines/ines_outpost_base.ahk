#Requires AutoHotkey v2.0
#Include ..\Player.ahk

global toggle := false
global moveForwardTime := 3000
global moveBackwardTime := 3000
global totalTime := moveForwardTime + moveBackwardTime

F2::
{
	global toggle, totalTime, moveForwardTime, moveBackwardTime
    toggle := !toggle
    if toggle {
        SetTimer(Timer1, totalTime)  ; Ensure Timer1 interval matches total movement time
        SetTimer(Timer2, 200) ; Start Timer 2 every 100ms
		MoveForward(moveForwardTime)
		MoveBackward(moveBackwardTime)
    } else {
        SetTimer(Timer1, 0)  ; Stop Timer 1
        SetTimer(Timer2, 0)  ; Stop Timer 2
    }
}

Timer1() {
    global moveForwardTime, moveBackwardTime
    MoveForward(moveForwardTime)
    MoveBackward(moveBackwardTime)
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