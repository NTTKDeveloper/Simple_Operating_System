;Bios Read in 0x7c00
[org 0x7c00]

KERNEL_OFFSET equ 0x1000 
; mov bx, HELLO_MSG
; call print_string
; 
; mov bx, GOODBYE_MSG
; call print_string
; 
;;print_hex in DX
; mov dx, bx
; call print_hex



;Disk Load
mov [BOOT_DRIVE], dl

mov bp, 0x9000
mov sp, bp

mov bx, MSG_REAL_MODE
call print_string

call load_kernel

mov ah, 0x00
mov al, 0x03
int 0x10

; 
call switch_to_pm

jmp $

[bits 16]
;load kernel 
load_kernel:
    mov bx, MSG_LOAD_KERNEL
    call print_string

    mov bx, KERNEL_OFFSET
    mov dh, 15
    mov dl, [BOOT_DRIVE]
    call disk_load

    ret

[bits 32]
BEGIN_PM:

    mov ebx, MSG_PROT_MODE
    call print_string_pm

    call KERNEL_OFFSET

    jmp $

%include "./print_function/print_hex.asm"
%include "./print_function/print_string.asm"
%include "./protected_mode/switch_to_pm.asm"
%include "./gdt/gdt.asm"
%include "./print_function/x86/print_in_pm.asm"
%include "./disk_load/disk_load.asm"

;Global Variable
BOOT_DRIVE: db 0

MSG_REAL_MODE:
db "Started in 16 bit Real Mode", 0xA, 0xD, 0

MSG_PROT_MODE:
db "Successfully landed in 32bit Protected Mode", 0

MSG_LOAD_KERNEL:
db "Loading kernel into memory", 0xA, 0xD, 0

times 510-($-$$) db 0
dw 0xaa55
