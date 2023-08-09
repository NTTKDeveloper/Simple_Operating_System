[org 0x7c00]

mov ah, 0x0e

;Stack
mov bp, 0x8000
mov sp, bp

push 'A'
push 'B'
push 'C'

;Print C
pop bx 
mov al, bl
int 0x10

;Print B
pop bx
mov al,bl
int 0x10

;Print A
pop bx
mov al,bl
int 0x10

jmp $

times 510-($-$$) db 0
dw 0xaa55
