#Requires AutoHotkey v2.0

global toggle := false ; Initialize toggle state
global sleepW := 4500  ; Duration for holding W in milliseconds
global sleepS := 5300  ; Duration for holding S in milliseconds

; Define the V-pressing function
PressV()
{
	Send "{v down}" ; Hold V
	Sleep 500 ; Wait 0.5 seconds
	Send "{v up}" ; Release V
}

; F2 to start/stop the loop
F2::
{
    toggle := true
	SetTimer PressV, 500 ; Call the PressV label every 500ms
    while toggle
    {
        Send "{w down}" ; Hold W
        Sleep sleepW ; Wait as per sleepW value
        Send "{w up}" ; Release W

        Send "{s down}" ; Hold S
        Sleep sleepS ; Wait as per sleepS value
        Send "{s up}" ; Release S
    }
}

; Stop everything with F3
F3::
{
    toggle := false ; Stop the main loop
    SetTimer PressV, 0 ; Stop the V-pressing thread
}

; Reload script with F4
F4::
{
    Send "{w up}" ; Release W
    Send "{s up}" ; Release S
    Reload
}
