#Requires AutoHotkey v2.0

; Hotkey to toggle spamming Q
F2::
{
    while true {
		Send("q")
		Sleep(500) ; 200 milliseconds = 0.2 seconds
	}
}

; Hotkey to reload the script
F4::
{
    Reload
}
