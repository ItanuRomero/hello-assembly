# hello-assembly
Hello World em assembly, nada de mais.

## Steps
Instalando o montador:
sudo apt install nasm gcc -y

Criando um arquivo:
nano hello.asm

Escrevendo o código:
``` assembly
section .data
    hello db 'Hello, World!', 0xA  ; A string "Hello, World!" seguida de nova linha

section .text
    global _start

_start:
    ; syscall para escrever (sys_write)
    mov eax, 4          ; código de sistema para sys_write
    mov ebx, 1          ; descritor de arquivo 1 (stdout)
    mov ecx, hello      ; ponteiro para a string
    mov edx, 13         ; comprimento da string
    int 0x80            ; chamada de sistema

    ; syscall para sair (sys_exit)
    mov eax, 1          ; código de sistema para sys_exit
    xor ebx, ebx        ; código de saída 0
    int 0x80            ; chamada de sistema
```

Montando o objeto binário:
nasm -f elf32 hello.asm -o hello.o

Linkando o objeto ao executável:
gcc -m32 -o hello hello.o -nostartfiles

E após isso, executar o arquivo ./hello
./hello
