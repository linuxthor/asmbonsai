BITS 64
    org	0x010000	

ehdr:
    db 0x7F, "ELF", 2, 1, 1, 0

_start:
    mov esi, message        ; 5
    nop                     ; 1
    jmp one                 ; 2
    dw 2                    ; 2   e_type:	    executable
    dw 0x3e                 ; 2   e_machine:      amd64

one:
    add al,1                ; 2
    jmp two                 ; 2
    dq _start               ; 8   e_entry
    dq phdr-$$              ; 8   e_phoff	     program header offset 

message:
    db "HELLO WORLD!!",0x0a
    dw phdrsize             ; 2   e_phentsize:      program header size     

phdr:
    dw 1                    ; 2    e_phnum:	      one program header / p_type
    db 0                    ; 1    <-------          padded for p_type 
    db 0                    ; 1    <--'
    dd 5                    ; 4    p_flags	      read and execute
    dq 0                    ; 8    p_offset
    dq $$                   ; 8    p_vaddr:          start of current section

two:
    mov dx, 60
    syscall 
    syscall 
    dq  0x08080808          ; 8    p_filesz
    dq  0x08080808          ; 8    p_memsz
    dq  0x08080808          ; 8    p_align / ascii backspace 

phdrsize equ $-phdr 
