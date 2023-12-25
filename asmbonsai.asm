BITS 64
org 0x010000

ehdr:
    db 0x7f, "ELF"                  ; 4      e_ident / jg _start 

more:
    pop  rax                        ; 1
    push rcx                        ; 1
    pop  rsi                        ; 1
    mov  dl, 60                     ; 2
    push rdx                        ; 1
    jmp  _start                     ; 2

    dd 0x01                         ; 4
    dw 3                            ; 2      e_type:    dynamic
    dw 0x3e                         ; 2      e_machine: amd64
    dq 0x0c                         ; 8
    dd 0x0c                         ; 4
    dq 0x0c                         ; 8

go:
    syscall                         ; 2    
    jmp more                        ; 2
    db 0xf4                         ; 1  
    db 0xff                         ; 1

message:
    db "He"                         ; 2
    dd 0x00                         ; 4
    db "ll"                         ; 2 
    dw 0x38                         ; 2
    dd 0x01                         ; 4
    db 0x08,"o, world!",0x0a        ; 11     

_start:
    jmp go                          ; 2
