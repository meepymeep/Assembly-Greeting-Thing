%macro exit_program 0

    mov rax, 60
    mov rdi, 0

    syscall

%endmacro

section .data
    msg db "What is your name? ", 0
    greet db "Hello, ", 0

section .bss
    name resb 25

section .text
    global _start

_start:

    mov rax, msg
    call _print

    call _getname
    mov rax, greet
    call _print

    mov rax, name
    call _print

    exit_program

_print:
    push rax
    mov rbx, 0
_lprint:
    inc rax
    inc rbx

    mov cl, [rax]
    cmp cl, 0

    jne _lprint

    mov rax, 1
    mov rdi, 1
    pop rsi

    mov rdx, rbx

    syscall
    ret

_getname:
    mov rax, 0
    mov rdi, 0
    mov rsi, name
    mov rdx, 25

    syscall
    ret