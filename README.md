# asmbonsai

Small x86-64 bit Linux assembly hello world 

Compiles to a 75 byte Linux ELF binary 

Assemble with: 

```
nasm -f bin -o asmbonsai asmbonsai.asm
```
Run:
```
$ chmod +x asmbonsai
$ ./asmbonsai 
Hello, world!
$ 
```

(BUG: Unfortunately latest versions will print a few extra characters if not run under tmux)  
```
$ ./asmbonsai
����Hello, world!
��
$
```
