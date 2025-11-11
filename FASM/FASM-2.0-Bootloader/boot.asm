; Sample x86 Bootloader

org 0x7C00  ; Origin address 0x7C000

;mov ah, 0Eh     ; BIOS function to write on screen
;mov al, 'X'     ; Character to print
;int 0x10        ; BIOS interrupt

; Clear the screen
mov ah, 0x06    ; BIOS function to scroll
mov al, 0x00    ; Clear entire window
mov bh, 0x07    ; Light gray color
mov cx, 0x0000  ; Cursor to Upper left cornder
mov dx, 0x184F  ; End of lower right corner of screen. Size is 25x80 (x18=24, x4F=79)
int 0x10        ; BIOS interrupt

; Set cursor position
; https://ctyme.com/intr/rb-0087.htm
mov ah, 0x02    ; BIOS function to set video cursor position
mov bh, 0x00    ; Set page number
mov dh, 0x00    ; Row (x00 top)
mov dl, 0x00    ; Column (x00 left)
int 0x10        ; BIOS interrupt

; Write character on the screen (Teletype output)
; https://ctyme.com/intr/rb-0106.htm
mov ah, 0Eh     ; Function to print a character
mov al, '-'     ; Print character
int 0x10

mov si, test_string
call print_string

; Jump infidently
jmp $

test_string: db 'Hello Xeno Innovations!', 0

print_string:
    call print
    ret
print:
.loop:
    lodsb
    cmp al, 0
    je .done
    call print_char
    jmp .loop
.done:
    ret
print_char:
    mov ah, 0Eh
    int 0x10
    ret

times 510 - ($ - $$) db 0   ; Pad everything with zeros
dw 0xAA55                   ; x86 uses little endian. Saved as 55AA

