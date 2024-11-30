;format ELF
;
;section '.text' executable
;public _main
;_main:
;    ;write your code here
;    xor eax, eax
;    ret

org 0x7C00  ; Origin address 0x7C000

times 510 - ($ - $$) db 0   ; Pad everything with zeros
dw 0xAA55                   ; x86 uses little endian. Saved as 55AA

