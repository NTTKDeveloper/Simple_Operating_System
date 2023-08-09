[org 0x7c00]

; je : x == y
; jne : x != y
; jl x < y
; jle x <= y
; jg x > y
; jge x >= y

mov ax, 4
cmp ax, 4
je then_block
mov ah, 0x0e
mov al, 'K'
int 0x10

jmp $

then_block:
    mov ah, 0x0e
    mov al, 'X'
    int 0x10

times 510-($-$$) db 0
dw 0xaa55
