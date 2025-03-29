#Requires AutoHotkey v2.0

; Function to roll forward
RollForward()
{
    Send("{w down}")  ; Hold W
    Sleep(100)        ; Wait 200ms (adjust if needed)
    Send("{Ctrl}")    ; Press and release Ctrl
    Sleep(100)        ; Wait 200ms (adjust if needed)
    Send("{w up}")    ; Release W
		
	Sleep(1000)
}

; Function to roll backward
RollBackward()
{
    Send("{s down}")  ; Hold S
    Sleep(100)        ; Wait 200ms (adjust if needed)
    Send("{Ctrl}")    ; Press and release Ctrl
    Sleep(100)        ; Wait 200ms (adjust if needed)
    Send("{s up}")    ; Release S
			
	Sleep(1000)
}

; Function to move forward by holding W for a specified duration
MoveForward(duration)
{
    Send("{w down}")  ; Hold W
    Sleep(duration)   ; Hold for the specified duration
    Send("{w up}")    ; Release W
}

; Function to move backward by holding S for a specified duration
MoveBackward(duration)
{
    Send("{s down}")  ; Hold S
    Sleep(duration)   ; Hold for the specified duration
    Send("{s up}")    ; Release S
}

; Function to move left by holding A for a specified duration
MoveLeft(duration)
{
    Send("{a down}")  ; Hold A
    Sleep(duration)   ; Hold for the specified duration
    Send("{a up}")    ; Release A
}

; Function to move right by holding D for a specified duration
MoveRight(duration)
{
    Send("{d down}")  ; Hold D
    Sleep(duration)   ; Hold for the specified duration
    Send("{d up}")    ; Release D
}

; Function to abort mission
AbortMission()
{
    Send("L") ; Press L
    Sleep(500) ; Wait briefly
	
	MoveMouseUp()

    ; Simulate a left mouse button click
    Send("{LButton down}") ; Press and hold the left mouse button
	Sleep(200)             ; Wait for 100 milliseconds
	Send("{LButton up}")   ; Release the left mouse button

    ; Simulate a left mouse button click
    Send("{LButton down}") ; Press and hold the left mouse button
	Sleep(200)             ; Wait for 100 milliseconds
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

; Exit script with F4
F4:: {
    Send "{w up}" ; Release W
    Send "{s up}" ; Release S
    ExitApp
}
