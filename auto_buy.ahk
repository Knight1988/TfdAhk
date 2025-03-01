#Requires AutoHotkey v2.0

F2:: {
    SetTimer ClickMouse, 200
}

ClickMouse() {
    Click 1388, 900
    Sleep 200  ; Short delay between clicks
    Click 890, 842
}

F3:: {
    Reload
}

F4:: {
    ExitApp
}
