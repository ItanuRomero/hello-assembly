section .data
    hello db 'Olá, mundo!', 0xA  		;
    hello_len equ 13				;
    buffer times 20 db 0			;
    buf_len equ 20				;
    name_len dd 0				;
    input_msg db 'Escreva seu nome: '		;
    input_len equ 18				;
    greeting db 'Muito prazer te conhecer, '	;
    greeting_len equ 28				;

section .text
    global _start

_start:
; do hello world
    mov eax, 4          ;
    mov ebx, 1          ;
    mov ecx, hello      ;
    mov edx, hello_len  ;
    int 0x80            ;

; show input message
    mov eax, 4		;
    mov ebx, 1		;
    mov ecx, input_msg	;
    mov edx, input_len	;
    int 0x80		;

; do input
    mov eax, 3		;
    mov ebx, 0		;
    mov ecx, buffer	;
    mov edx, buf_len	;
    int 0x80		;

; get length from input

    mov [name_len], eax	;

; show greeting
    mov eax, 4			;
    mov ebx, 1			;
    mov ecx, greeting		;
    mov edx, greeting_len	;
    int 0x80 			;

; show input
     mov eax, 4			;
     mov ebx, 1			;
     mov ecx, buffer		;
     mov edx, [name_len]	;
     int 0x80			;

; exit
    mov eax, 1          ;
    xor ebx, ebx        ;
    int 0x80            ;
