#Requires AutoHotkey v2.0
InstallMouseHook
global toggle := false ; Initialize toggle state

; Function to move forward by holding W for 2 seconds
MoveForward()
{
    Send("{w down}")  ; Hold W
    Sleep(1600)       ; Hold for 2 seconds
    Send("{w up}")    ; Release W
}

; Function to move backward by holding S for 2.5 seconds
MoveBackward()
{
    Send("{s down}")  ; Hold S
    Sleep(1800)       ; Hold for 2.5 seconds
    Send("{s up}")    ; Release S
}

; Function to abort mission
AbortMission()
{
    Send("L") ; Press L
    Sleep(500) ; Wait briefly

    ; Get the screen's width and height
    screenWidth := A_ScreenWidth
    screenHeight := A_ScreenHeight

    ; Move the mouse to the center of the screen
    mouseX := screenWidth / 2
    mouseY := screenHeight / 2 - 200
    MoveMouseUp()

    ; Simulate a left mouse button click
    Send("{LButton down}") ; Press and hold the left mouse button
    Sleep(200)             ; Wait for 200 milliseconds
    Send("{LButton up}")   ; Release the left mouse button
    Send("{LButton down}") ; Press and hold the left mouse button
    Sleep(200)             ; Wait for 200 milliseconds
    Send("{LButton up}")   ; Release the left mouse button
}

; Function to move the mouse smoothly up
MoveMouseUp()
{
    ; Constants for mouse_event
    MOUSEEVENTF_MOVE := 0x0001 ; Flag to indicate mouse movement

    ; Total distance to move the mouse up
    TotalDistance := -150
    ; Duration over which to move the mouse (in seconds)
    Duration := 0.1
    ; Number of steps
    Steps := 20
    ; Delay between each step (in milliseconds)
    Delay := Duration * 1000 / Steps
    ; Distance to move per step
    StepDistance := TotalDistance / Steps

    Loop Steps
    {
        ; Move the mouse by the step distance
        DllCall("mouse_event", "UInt", MOUSEEVENTF_MOVE, "Int", 0, "Int", StepDistance, "UInt", 0, "Ptr", 0)
        ; Delay for the calculated time
        Sleep(Delay)
    }
}

; F2 to start/stop the loop
F2::
{
    toggle := true
    while toggle
    {
        MoveForward()
        Send("q")
        Sleep(200)

        MoveBackward()
        Send("q")
        Sleep(200)

        AbortMission()
        Sleep(200)
    }
}

; Stop everything with F3
F3::
{
    toggle := false ; Stop the main loop
}

; Reload script with F4
F4::
{
    Send "{w up}" ; Release W
    Send "{s up}" ; Release S
    Reload
}
