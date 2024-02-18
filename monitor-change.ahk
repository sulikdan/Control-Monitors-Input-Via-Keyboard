#Requires AutoHotkey v2.0

; Win+ctrl+d+Numpad1 - input DP
;#^d & Numpad1::
;#^h & Numpad1::
;{
;    Run "E:\Tools\custom-shortcuts\monitor-switch\dp-monitor.bat"
;    Return
;}
;#^d::
;{
;    Input, matchVal,
;    if (matchVal=="Numpad1") {
;        MsgBox "Option 1"
;        Run "E:\Tools\custom-shortcuts\monitor-switch\dp-monitor.bat"
;    }
;    if(matchVal="Numpad2"{
;        MsgBox "Option 2"
;        Run "E:\Tools\custom-shortcuts\monitor-switch\hdmi-monitor.bat"
;    }
;
;    Return
;}
	
; Win+ctrl+d+Numpad2 - input HDMI
;#^d & Numpad2::
;#^w::
;{
;    Run "E:\Tools\custom-shortcuts\monitor-switch\hdmi-monitor.bat"
;    Return
;}


; Initialize a variable to track if Win+Ctrl+D was pressed
sequenceActive := false

; Hotkey for Win+Ctrl+D
^!d::  ; Ctrl (^) + alt (!) + D
{
    ;MsgBox("Main executed")
    global sequenceActive := true
    ; Set a timer to reset sequenceActive after a short period, e.g., 5 seconds
    SetTimer ResetSequence, -2500  ; Negative value for one-shot timer
    return
}

; Function to reset the sequenceActive variable
ResetSequence() {
    global sequenceActive := false
}

; Hotkey for Numpad1
Numpad1::
{
    ;MsgBox("Num1?.")
    if (sequenceActive) {
        global sequenceActive := false  ; Reset the sequence
        ;MsgBox("Sequence Win+Ctrl+D -> Numpad1 activated.")
        Run "E:\Tools\custom-shortcuts\monitor-switch\dp-monitor.bat"
    }
    return
}

; Hotkey for Numpad2
Numpad2::
{
    if (sequenceActive) {
        global sequenceActive := false  ; Reset the sequence
        ;MsgBox("Sequence Win+Ctrl+D -> Numpad2 activated.")
        Run "E:\Tools\custom-shortcuts\monitor-switch\hdmi-monitor.bat"
    }
    return
}
