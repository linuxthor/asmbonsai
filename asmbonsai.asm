BITS 64
    org	0x00100000	

ehdr:
    db 0x7F, "ELF", 2, 1, 1, 0       ; e_ident

_end:
    syscall           ; 2
    syscall           ; 2

_start:
    push 60           ; 2
    jmp one           ; 2
    dw 2              ; e_type:	        executable
    dw 0x3e           ; e_machine:      amd64

one:
    add al,1          ; 2
    jmp three         ; 2
    dq _start         ; e_entry
    dq phdr-$$        ; e_phoff	       program header offset 
    dq 0              ; e_shoff	       no section headers

two:
    nop               ; 1    
    nop               ; 1
    nop               ; 1              
    nop               ; 1   
    nop               ; 1   
    nop               ; 1
    dw phdrsize       ; e_phentsize:	program header size 

phdr:
    dw 1              ; e_phnum:	one program header <--ALSO--> p_type
    db 0              ; <-------        padded for p_type 
    db 0              ; <--'
    dd 5              ; p_flags	        read and execute
    dq 0              ; p_offset
    dq $$             ; p_vaddr:	start of current section

three:
    mov esi, message  ; 5
    pop rdx           ; 1
    jmp _end          ; 2 
    dq filesize       ; p_filesz
    dq filesize       ; p_memsz
    dq 0x200000       ; p_align 

phdrsize equ $-phdr

message:
    db "Hi",0x0a
    length equ $-message

filesize equ $-$$
