; Sample console application writing a message
; Using WriteConsole - http://msdn.microsoft.com/en-us/library/ms687401%28VS.85%29.aspx

include 'win32wxp.inc'

.code
  start:
    invoke  AllocConsole
    invoke  WriteConsole,<invoke GetStdHandle,STD_OUTPUT_HANDLE>,tex,12,dummy,0
    invoke  Sleep,-1
.end start

.data
  tex     TCHAR   'Hello World!'
  dummy   rd      1
