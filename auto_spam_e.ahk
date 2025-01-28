; AHK 2.0 script

#Requires AutoHotkey v2.0

; F2 - Start the loop
F2:: {
    SetTimer(() => HoldE(), 1000, -1) ; Start timer every 1s
}

; Function to hold 'E' for 1 second
HoldE() {
    Send "{E down}"
    Sleep 1000
    Send "{E up}"
}

; F4 - Reload the script
F4:: {
    Reload
}

; Exit on Escape key
Esc:: {
    ExitApp
}
