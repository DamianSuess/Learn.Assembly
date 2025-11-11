; Hello World - Windows MessageBox

format PE gui       ; Windows Portable Exectuable format
entry start             ; Entry point of app

include 'win32a.inc'    ; Windows API

; Data section
section '.data' readable writable
  caption db 'hello', 0           ; Caption of MsgBox
  message1 db 'Hello, World 1', 0   ; Message to display
  message2 db 'Hello, World 2', 0   ; Message to display
  message3 db 'Hello, World 3', 0   ; Message to display

; Code Section
section '.code' executable
start:

  ; See section 3.1.3 of the FASM guide
  ; Call procedure through pointer labelled by the 1st argument
  invoke MessageBox, NULL, message1, caption, MB_OK    ; Call MessageBox function

  ; Calls directly to the procuedure specified
  stdcall [MessageBox], 0, message2, caption, MB_OK

  push MB_OK
  push caption
  push message3
  push 0
  call [MessageBox]

  invoke ExitProcess, NULL                            ; Exit process

; See section 3.1.2 Imports of the FASM guide
section '.idata' import data readable writeable
;data import                      ; <--- alternative to "secction '.idata' import above
  library \
    kernel,'KERNEL32.DLL',\
    user,'USER32.DLL'

  import kernel,\
    ExitProcess,'ExitProcess'

  import user,\
    MessageBeep,'MessageBeep',\
    MessageBox,'MessageBoxA'

;end data
