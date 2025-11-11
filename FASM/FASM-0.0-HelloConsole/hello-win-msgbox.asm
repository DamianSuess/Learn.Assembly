; Hello World - Windows MessageBox

format PE console       ; Windows Portable Exectuable format
entry start             ; Entry point of app

include 'win32a.inc'    ; Windows API

; Data section
section '.data' readable writable
  caption db 'hello', 0           ; Caption of MsgBox
  message db 'Hello, World!', 0   ; Message to display

; Code Section
section '.code' executable
start:
  invoke MessageBox, NULL, message, caption, MB_OK    ; Call MessageBox function
  invoke ExitProcess, NULL                            ; Exit process

section '.idata' import data readable writeable
;data import
  library kernel,'KERNEL32.DLL',\
          user,'USER32.DLL'

  import kernel,\
    ExitProcess,'ExitProcess'

  import user,\
    MessageBeep,'MessageBeep',\
    MessageBox,'MessageBoxA'

;end data
