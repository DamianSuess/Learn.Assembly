; Sample console application writing a message

format PE console
entry start

include 'win32a.inc'

section '.text' code readable executable
start:
  push _welcome
  push _msgFormat
  call [printf]
  pop ecx

  ; Pause and wait for input
  push _wait
  call [printf]
  call [scanf]

  push 0
  call [ExitProcess]

section '.rdata' data readable writeable

  ; Remember to include char '10' for line feed
  _msgFormat  db 'My message: %s', 0
  _welcome    db 'Hello, my good chum!', 10, 0
  _wait       db 'Press enter to continue...', 0

section '.idata' data readable import
  library
    kernel32, 'kernel32.dll', \
    msvcrt,   'msvcrt.dll'

  import kernel32,
         ExitProcess, 'ExitProcess'

  import msvcrt,
         printf, 'printf',
         scanf, 'scanf'
