format PE console       ; Windows Portable Exectuable format
include 'win32a.inc'    ; Windows API


section '.data' readable writable ; Data section
  caption db 'hello', 0           ; Caption of MsgBox
  message db 'Hello, World!', 0   ; Message to display

section '.code' executable        ; Code section
  entry start                     ; Entry point of app

start:
  invoke MessageBoxA, NULL, message, caption, MB_OK   ; Call MessageBox function
  invoke ExitProcess, NULL                            ; Exit process
