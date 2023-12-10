BITS 64
org  0x010000

ehdr:
    db 0x7F, "ELF"          ; 4 

_start:
    mov esi, message        ; 5
    inc al                  ; 2
    push 60                 ; 2
    jmp next                ; 2
    nop                     ; 1
    dw 2                    ; 2   e_type:         executable
    dw 0x3e                 ; 2   e_machine:      amd64
next:
    pop dx                  ; 2
    jmp next2               ; 2
    dq _start               ; 8   e_entry
    dq phdr-$$              ; 8   e_phoff            program header offset 

message:
    db "Hello, World!",0x0a ; 14
    dw phdrsize             ; 2   e_phentsize:      program header size     

phdr:
    dw 1                    ; 2    e_phnum:          one program header / p_type
    db 0                    ; 1    <-------          padded for p_type 
    db 0                    ; 1    <--'
    dd 1                    ; 4    p_flags           execute 
    dq 0                    ; 8    p_offset
    dq $$                   ; 8    p_vaddr:          start of current section

next2:
    syscall                 ; 2 
    syscall                 ; 2
    nop                     ; 1
    nop                     ; 1
    nop                     ; 1
    nop                     ; 1 

    dq  0x08080808          ; 8    p_filesz
    dq  0x08080808          ; 8    p_memsz
    dq  0x08080808          ; 8    p_align / ascii backspace 

phdrsize equ $-phdr
