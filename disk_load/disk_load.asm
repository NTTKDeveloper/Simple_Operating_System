disk_load:
    ;dx save andress
    push dx

    ;Same is ah = 0x0e but function is disk read
    mov ah, 0x02
    mov al, dh ;Read DH Setctors
    mov ch, 0x00 ;Select cylinder 0 
    mov dh, 0x00 ;Select head 0 
    mov cl, 0x02 ;Start reading from second sector, after the boot sector 
    int 0x13

    ;Jump flag CF = 1, if CF = 1 then disk_error 
    jc disk_error 

    pop dx ;Restore original dx

    ;if dh != al then disk_error
    cmp dh, al
    jne disk_error
    ret

disk_error:
    mov bx, DISK_ERROR_MSG
    call print_string
    jmp $

;Variable 
DISK_ERROR_MSG:
db "Disk read error!", 0xA, 0xD, 0
