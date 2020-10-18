# asmbonsai

Small x86-64 bit Linux assembly hello world 

All code and data is in unused/ignored header sections

Compiles to a 112 byte Linux ELF binary 

Assemble with: 

```
nasm -f bin -o asmbonsai asmbonsai.asm
```
Run:
```
$ chmod +x asmbonsai
$ ./asmbonsai 
HELLO WORLD!!
$ 
```
