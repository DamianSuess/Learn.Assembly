; Sample console application writing a message

format PE console
entry start

include 'win32a.inc'
include "macro\if.inc"
;include 'api\kernel32.inc'
;include 'api\user32.inc'

section '.text' code readable executable
start:
        ; 1st MsgBox
        push MB_OK
        push _caption
        push _text
        push 0
        call [MessageBox]

        ; 2nd & 3rd MsgBox, same code
        stdcall [MessageBox], 0, _text, _caption, MB_OK
        invoke MessageBox, 0, _text, _caption, MB_OK

        .if eax
            ; if EAX isn't set, we exit using RET instead of ExitProcess.
            ret
        .endif


        push _welcome
        call [printf]
        pop ecx

        call [scanf]

        push 0
        call [ExitProcess]

section '.rdata' data readable writeable

_welcome db 'Hello, my good chum!', 10, 0
_caption db "My Caption", 0
_text    db "My Text", 0

section '.idata' data readable import
        library kernel32, 'kernel32.dll', \
                msvcrt,   'msvcrt.dll', \
                user32,'user32.dll'

        import kernel32, \
               ExitProcess, 'ExitProcess'

        import msvcrt, \
               printf, 'printf', \
               scanf, 'scanf'

        import user32,\
               MessageBeep,'MessageBeep',\
               MessageBox,'MessageBoxA'
