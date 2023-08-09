print_char:
    mov ah, 0x0e
    mov al, [bx]
    int 0x10
    ret

print_string:
    call print_char
    add bx, 0x0001
    mov al, [bx]
    cmp al, 0
    je finish
    jmp print_string
    ret


finish:
    ret
