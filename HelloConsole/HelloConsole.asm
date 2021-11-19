; Sample console application writing a message

format PE console
entry start

include 'win32a.inc'

section '.text' code readable executable
start:
        push _welcome
        call [printf]
        pop ecx

        call [scanf]

        push 0
        call [ExitProcess]

section '.rdata' data readable writeable

_welcome db 'Hello, my good chum!', 10, 0

section '.idata' data readable import
        library kernel32, 'kernel32.dll', \
                msvcrt,   'msvcrt.dll'
        import kernel32, ExitProcess, 'ExitProcess'
        import msvcrt, printf, 'printf', scanf, 'scanf'