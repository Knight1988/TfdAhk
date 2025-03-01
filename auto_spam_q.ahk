#Requires AutoHotkey v2.0

; Hold XButton1 (side mouse button) to spam "Q"
XButton1::
{
    while GetKeyState("XButton1", "P") {
        Send("q")
        Sleep(200) ; Adjust delay as needed
    }
}

; Hotkey to toggle spamming Q
F2::
{
    while true {
        Send("q")
        Sleep(200) ; Adjust delay as needed
        Send("zzqz")
        Sleep(200) ; Adjust delay as needed
    }
}

; Hotkey to reload the script
F3::
{
    Reload
}