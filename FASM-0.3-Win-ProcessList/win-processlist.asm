; List Processes Running
; Reference: https://github.com/ByteSlasher/ProcessList/blob/main/processlist.asm

format pe console

entry start
include 'win32ax.inc'

section '.data' data readable writable

struct PROCESSENTRY32
        dwSize dd 0
        cntUsage dd 0
        th32ProcessID dd 0
        th32DefaultHeapID dd 0
        th32ModuleID dd 0
        cntThreads dd 0
        th32ParentProcessID dd 0
        pcPriClassBase dd 0
        dwFlags dd 0
        szExeFile rw 260
ends

TH32CS_SNAPPROCESS = 2
procEntry PROCESSENTRY32
hSnapshot dd ?

section '.code' code readable executable

start:
        invoke CreateToolhelp32Snapshot, TH32CS_SNAPPROCESS, 0
        test eax, eax
        jz empty_snapshot_error
        mov [hSnapshot], eax
        mov [procEntry.dwSize], sizeof.PROCESSENTRY32

        invoke Process32First, [hSnapshot], procEntry
        invoke printf, <"Process List: ", 10, 13, 0>
        invoke printf, <"%8s|%60s|%8s", 10, 13, 0>, 'PID', 'Process name', 'Threads'
        invoke printf, <"%8s|%60s|%8s", 10, 13, 0>, '', '', ''

proc_loop:
        invoke printf, <'%8d|%60s|%8d', 10, 13, 0>,\
                       [procEntry.th32ProcessID],\
                       procEntry.szExeFile,\
                       [procEntry.cntThreads]

        invoke Process32Next, [hSnapshot], procEntry

        cmp eax, 0
        je proc_loop_finish
        jmp proc_loop

proc_loop_finish:
finish:
        invoke printf, <'Press any key to exit...', 10, 13, 0>
        invoke getch
        invoke ExitProcess, 0

empty_snapshot_error:
        invoke printf, <'<!> Error: Snapshot is empty!', 10, 13, 0>
        jmp finish

section '.idata' import data readable
        library kernel32, 'kernel32.dll',\
                msvcrt, 'msvcrt.dll'

        import kernel32,\
                ExitProcess, 'ExitProcess',\
                CreateToolhelp32Snapshot, 'CreateToolhelp32Snapshot',\
                Process32First, 'Process32First',\
                Process32Next, 'Process32Next'

        import msvcrt,\
                printf, 'printf',\
                getch, '_getch'
