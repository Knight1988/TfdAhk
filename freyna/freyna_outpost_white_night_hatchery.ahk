﻿#Requires AutoHotkey v2.0
#Include Player.ahk

; F2 to start/stop the loop
F2::
{
    toggle := true
    while toggle
    {
		MoveForward(1000)
		
		MoveBackward(1000)
		
		Send("q")
		
		Sleep(1000)		
		
		AbortMission()
	
		Sleep(200)
    }
}

; Reload script with F3
F3::
{
    Send "{w up}" ; Release W
    Send "{s up}" ; Release S
    Reload
    return
}

; Exit script with F4
F4::
{
    Send "{w up}" ; Release W
    Send "{s up}" ; Release S
    ExitApp
    return
}
