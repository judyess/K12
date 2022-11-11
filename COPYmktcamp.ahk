 #InstallKeybdHook
UniqueID := WinExist(ahk_class IDLE Shell 3.9.7)


; =========== Note() ============
Home::
if WinExist("IDLE Shell 3.9.7")
{	WinActivate
	Send, {Control down}{Down}{Control up}
	Send, note("")
	Send, {Left}{Left}
	
	
}
else if WinExist("*IDLE Shell 3.9.7*")
{
	WinActivate
	Send, {Control down}{Down}{Control up}
}
else
{
	return
}
return 

; =========== Note() ============
End::
	Send, No SPED info
	Send, {Enter}
	
return 



;= Page-Up Nav()======================================

PgUp::
if WinExist("IDLE Shell 3.9.7")
{	WinActivate
	Send, {Control down}{Down}{Control up}
	Send, nav()
	Sleep, 100
	Send, {Enter}	
}
else if WinExist("*IDLE Shell 3.9.7*")
{
	WinActivate
	Send, {Control down}{Down}{Control up}
}
else
{
	return
}
return


;= Page Down "Dr."==============================================================
PgDn::
if WinExist("IDLE Shell 3.9.7")
{	WinActivate
	Send, update_isDoctor()
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}

	
}
else if WinExist("*IDLE Shell 3.9.7*")
{
	WinActivate
	Send, update_isDoctor()
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}
}

clipboard := ClipSaved      ; restore original clipboard
return


;= F1 adr1() =======================================================================

F1::
ClipSaved := ClipboardAll   ; save the entire clipboard to the variable ClipSaved
clipboard := ""             ; empty the clipboard (start off empty to allow ClipWait to detect when the text has arrived)
Send, ^c                    ; copy the selected text
if (SubStr(clipboard,0,1) == Chr(32))
{
	clipboard := Trim(clipboard)
}
else if (SubStr(clipboard,0,1) == ";")
{	
	clipboard := Trim(clipboard, ";")
}
else 
{
	Send, ^c                    ; copy the selected text
}
ClipWait, 1                 ; wait for the clipboard to contain data 
if (!ErrorLevel)            ; if NOT ErrorLevel, clipwait found data on the clipboard

if WinExist("IDLE Shell 3.9.7")
{	WinActivate
	Send, update_address1("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}	
}
else if WinExist("*IDLE Shell 3.9.7*")
{
	WinActivate
	Send, update_address1("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}
}

clipboard := ClipSaved      ; restore original clipboard
return

;= Shift+F1 adr2() =======================================

+F1::
ClipSaved := ClipboardAll   ; save the entire clipboard to the variable ClipSaved
clipboard := ""             ; empty the clipboard (start off empty to allow ClipWait to detect when the text has arrived)
Send, ^c                    ; copy the selected text
if (SubStr(clipboard,0,1) == Chr(32))
{
	clipboard := Trim(clipboard)
}
else if (SubStr(clipboard,0,1) == ";")
{	
	clipboard := Trim(clipboard, ";")
}
else 
{
	Send, ^c                    ; copy the selected text
}
ClipWait, 1                 ; wait for the clipboard to contain data 
if (!ErrorLevel)            ; if NOT ErrorLevel, clipwait found data on the clipboard

if WinExist("IDLE Shell 3.9.7")
{	WinActivate
	Send, update_address2("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}	
}
else if WinExist("*IDLE Shell 3.9.7*")
{
	WinActivate
	Send, update_address2("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}
}

clipboard := ClipSaved      ; restore original clipboard
return

;=F2 city=======================================================================

F2::
ClipSaved := ClipboardAll   ; save the entire clipboard to the variable ClipSaved
clipboard := ""             ; empty the clipboard (start off empty to allow ClipWait to detect when the text has arrived)
Send, ^c                    ; copy the selected text
if (SubStr(clipboard,0,1) == Chr(32))
{
	clipboard := Trim(clipboard)
}
else if (SubStr(clipboard,0,1) == ";")
{	
	clipboard := Trim(clipboard, ";")
}
else 
{
	Send, ^c                    ; copy the selected text
}
ClipWait, 1                 ; wait for the clipboard to contain data 
if (!ErrorLevel)            ; if NOT ErrorLevel, clipwait found data on the clipboard

if WinExist("IDLE Shell 3.9.7")
{	WinActivate
	Send, update_city("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}	
}
else if WinExist("*IDLE Shell 3.9.7*")
{
	WinActivate
	Send, update_city("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}
}

clipboard := ClipSaved      ; restore original clipboard
return

;=F3 zip=======================================================================

F3::
ClipSaved := ClipboardAll   ; save the entire clipboard to the variable ClipSaved
clipboard := ""             ; empty the clipboard (start off empty to allow ClipWait to detect when the text has arrived)
Send, ^c                    ; copy the selected text
if (SubStr(clipboard,0,1) == Chr(32))
{
	clipboard := Trim(clipboard)
}
else if (SubStr(clipboard,0,1) == ";")
{	
	clipboard := Trim(clipboard, ";")
}
else 
{
	Send, ^c                    ; copy the selected text
}
ClipWait, 1                 ; wait for the clipboard to contain data 
if (!ErrorLevel)            ; if NOT ErrorLevel, clipwait found data on the clipboard

if WinExist("IDLE Shell 3.9.7")
{	WinActivate
	Send, update_zipcode('
	Send, ^+v
	Sleep, 100
	Send, ')
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}	
}
else if WinExist("*IDLE Shell 3.9.7*")
{
	WinActivate
	Send, update_zipcode('
	Send, ^+v
	Sleep, 100
	Send, ')
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}
}

clipboard := ClipSaved      ; restore original clipboard
return


;=F4 Website==================================================================

F4::
ClipSaved := ClipboardAll   ; save the entire clipboard to the variable ClipSaved
clipboard := ""             ; empty the clipboard (start off empty to allow ClipWait to detect when the text has arrived)
Send, ^c                    ; copy the selected text
if (SubStr(clipboard,0,1) == Chr(32))
{
	clipboard := Trim(clipboard)
}
else if (SubStr(clipboard,0,1) == ";")
{	
	clipboard := Trim(clipboard, ";")
}
else 
{
	Send, ^c                    ; copy the selected text
}
ClipWait, 1                 ; wait for the clipboard to contain data 
if (!ErrorLevel)            ; if NOT ErrorLevel, clipwait found data on the clipboard

if WinExist("IDLE Shell 3.9.7")
{	WinActivate
	Send, update_site('
	Send, ^+v
	Sleep, 100
	Send, ')
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}	
}
else if WinExist("*IDLE Shell 3.9.7*")
{
	WinActivate
	Send, update_site('
	Send, ^+v
	Sleep, 100
	Send, ')
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}
}

clipboard := ClipSaved      ; restore original clipboard
return


; =F5 Dept=========================================================================

F5::
ClipSaved := ClipboardAll   ; save the entire clipboard to the variable ClipSaved
clipboard := ""             ; empty the clipboard (start off empty to allow ClipWait to detect when the text has arrived)
Send, ^c                    ; copy the selected text
if (SubStr(clipboard,0,1) == Chr(32))
{
	clipboard := Trim(clipboard)
}
else if (SubStr(clipboard,0,1) == ";")
{	
	clipboard := Trim(clipboard, ";")
}
else 
{
	Send, ^c                    ; copy the selected text
}
ClipWait, 1                 ; wait for the clipboard to contain data 
if (!ErrorLevel)            ; if NOT ErrorLevel, clipwait found data on the clipboard

if WinExist("IDLE Shell 3.9.7")
{	WinActivate
	Send, update_dept("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}	
}
else if WinExist("*IDLE Shell 3.9.7*")
{
	WinActivate
	Send, update_dept("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}
}

clipboard := ClipSaved      ; restore original clipboard
return


;=F6 Firstname==============================================================
F6::
ClipSaved := ClipboardAll   ; save the entire clipboard to the variable ClipSaved
clipboard := ""             ; empty the clipboard (start off empty to allow ClipWait to detect when the text has arrived)
Send, ^c                    ; copy the selected text
if (SubStr(clipboard,0,1) == Chr(32))
{
	clipboard := Trim(clipboard)
}
else if (SubStr(clipboard,0,1) == ";")
{	
	clipboard := Trim(clipboard, ";")
}
else 
{
	Send, ^c                    ; copy the selected text
}
ClipWait, 1                 ; wait for the clipboard to contain data 
if (!ErrorLevel)            ; if NOT ErrorLevel, clipwait found data on the clipboard

if WinExist("IDLE Shell 3.9.7")
{	WinActivate
	Send, update_first("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}

	
}
else if WinExist("*IDLE Shell 3.9.7*")
{
	WinActivate
	Send, update_first("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}
}

clipboard := ClipSaved      ; restore original clipboard
return



;=F7 Last Name==========================================

F7::
ClipSaved := ClipboardAll   ; save the entire clipboard to the variable ClipSaved
clipboard := ""             ; empty the clipboard (start off empty to allow ClipWait to detect when the text has arrived)
Send, ^c                    ; copy the selected text
if (SubStr(clipboard,0,1) == Chr(32))
{
	clipboard := Trim(clipboard)
}
else if (SubStr(clipboard,0,1) == ";")
{	
	clipboard := Trim(clipboard, ";")
}
else 
{
	Send, ^c                    ; copy the selected text
}
ClipWait, 1                 ; wait for the clipboard to contain data 
if (!ErrorLevel)            ; if NOT ErrorLevel, clipwait found data on the clipboard

if WinExist("IDLE Shell 3.9.7")
{	WinActivate
	Send, update_last("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}

	
}
else if WinExist("*IDLE Shell 3.9.7*")
{
	WinActivate
	Send, update_last("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}
}

clipboard := ClipSaved      ; restore original clipboard
return




;=F8 Title=======================================================================

F8::
ClipSaved := ClipboardAll   ; save the entire clipboard to the variable ClipSaved
clipboard := ""             ; empty the clipboard (start off empty to allow ClipWait to detect when the text has arrived)
Send, ^c                    ; copy the selected text
if (SubStr(clipboard,0,1) == Chr(32))
{
	clipboard := Trim(clipboard)
}
else if (SubStr(clipboard,0,1) == ";")
{	
	clipboard := Trim(clipboard, ";")
}
else 
{
	Send, ^c                    ; copy the selected text
}
ClipWait, 1                 ; wait for the clipboard to contain data 
if (!ErrorLevel)            ; if NOT ErrorLevel, clipwait found data on the clipboard

if WinExist("IDLE Shell 3.9.7")
{	WinActivate
	Send, update_title("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}	
}
else if WinExist("*IDLE Shell 3.9.7*")
{
	WinActivate
	Send, update_title("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}
}

clipboard := ClipSaved      ; restore original clipboard
return


;=F9 Email============================================================================

F9::
ClipSaved := ClipboardAll   ; save the entire clipboard to the variable ClipSaved
clipboard := ""             ; empty the clipboard (start off empty to allow ClipWait to detect when the text has arrived)
Send, ^c                    ; copy the selected text
if (SubStr(clipboard,0,1) == Chr(32))
{
	clipboard := Trim(clipboard)
}
else if (SubStr(clipboard,0,1) == ";")
{	
	clipboard := Trim(clipboard, ";")
}
else 
{
	Send, ^c                    ; copy the selected text
}
ClipWait, 1                 ; wait for the clipboard to contain data 
if (!ErrorLevel)            ; if NOT ErrorLevel, clipwait found data on the clipboard

if WinExist("IDLE Shell 3.9.7")
{	WinActivate
	Send, update_email("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}	
}
else if WinExist("*IDLE Shell 3.9.7*")
{
	WinActivate
	Send, update_email("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}
}

clipboard := ClipSaved      ; restore original clipboard
return


;=F10 Phone Number=======================================================================

F10::
ClipSaved := ClipboardAll   ; save the entire clipboard to the variable ClipSaved
clipboard := ""             ; empty the clipboard (start off empty to allow ClipWait to detect when the text has arrived)
Send, ^c                    ; copy the selected text
if (SubStr(clipboard,0,1) == Chr(32))
{
	clipboard := Trim(clipboard)
}
else if (SubStr(clipboard,0,1) == ";")
{	
	clipboard := Trim(clipboard, ";")
}
else 
{
	Send, ^c                    ; copy the selected text
}
ClipWait, 1                 ; wait for the clipboard to contain data 
if (!ErrorLevel)            ; if NOT ErrorLevel, clipwait found data on the clipboard

if WinExist("IDLE Shell 3.9.7")
{	WinActivate
	Send, update_phone("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}

	
}
else if WinExist("*IDLE Shell 3.9.7*")
{
	WinActivate
	Send, update_phone("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}
}

clipboard := ClipSaved      ; restore original clipboard
return


;=F11 Extension =======================================================================

F11::
ClipSaved := ClipboardAll   ; save the entire clipboard to the variable ClipSaved
clipboard := ""             ; empty the clipboard (start off empty to allow ClipWait to detect when the text has arrived)
Send, ^c                    ; copy the selected text
if (SubStr(clipboard,0,1) == Chr(32))
{
	clipboard := Trim(clipboard)
}
else if (SubStr(clipboard,0,1) == ";")
{	
	clipboard := Trim(clipboard, ";")
}
else 
{
	Send, ^c                    ; copy the selected text
}
ClipWait, 1                 ; wait for the clipboard to contain data 
if (!ErrorLevel)            ; if NOT ErrorLevel, clipwait found data on the clipboard

if WinExist("IDLE Shell 3.9.7")
{	WinActivate
	Send, update_ext("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}	
}
else if WinExist("*IDLE Shell 3.9.7*")
{
	WinActivate
	Send, update_ext("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}
}

clipboard := ClipSaved      ; restore original clipboard
return

;=Shift+F11 google ==========changed, might not work, check import stuff====================================

+F11::
ClipSaved := ClipboardAll   ; save the entire clipboard to the variable ClipSaved
clipboard := ""             ; empty the clipboard (start off empty to allow ClipWait to detect when the text has arrived)
Send, ^c                    ; copy the selected text
if (SubStr(clipboard,0,1) == Chr(32))
{
	clipboard := Trim(clipboard)
}
else if (SubStr(clipboard,0,1) == ";")
{	
	clipboard := Trim(clipboard, ";")
}
else 
{
	Send, ^c                    ; copy the selected text
}
ClipWait, 1                 ; wait for the clipboard to contain data 
if (!ErrorLevel)            ; if NOT ErrorLevel, clipwait found data on the clipboard

if WinExist("IDLE Shell 3.9.7")
{	WinActivate
	Send, search("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}	
}
else if WinExist("*IDLE Shell 3.9.7*")
{
	WinActivate
	Send, search("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}
}

clipboard := ClipSaved      ; restore original clipboard
return




;= F12 next() ========================================================================
F12::
if WinExist("IDLE Shell 3.9.7")
{	WinActivate
	Send, {Control down}{Down}{Control up}
	Send, next()
	Send, {Enter}
	
	
}
else if WinExist("*IDLE Shell 3.9.7*")
{
	WinActivate
	Send, {Control down}{Down}{Control up}
}
else
{
	return
}
return 

;= SHIFT+F12 setrow()========================================================================
+F12::
if WinExist("IDLE Shell 3.9.7")
{	WinActivate
	Send, {Control down}{Down}{Control up}
	Send, setrow()
	Sleep, 100
	Send, {Left}
	
	
}
else if WinExist("*IDLE Shell 3.9.7*")
{
	WinActivate
	Send, {Control down}{Down}{Control up}
}
else
{
	return
}
return 