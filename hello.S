.set SYSCALL_WRITE, 1
.set STDOUT, 1
.set SYSCALL_EXIT, 60
.set EXIT_SUCCESS, 0

.section .data

hello_str:
    .ascii "Hello, Docker world!\n"

hello_str_len = . - hello_str

.section .text
.globl _start

_start:

    /* write(1, "Hello, Docker world!\n", 21); */
    movq    $SYSCALL_WRITE, %rax
    movq    $STDOUT, %rdi
    movq    $hello_str, %rsi
    movq    $hello_str_len, %rdx
    syscall

    /* exit(0); */
    movq    $SYSCALL_EXIT, %rax
    movq    $EXIT_SUCCESS, %rdi
    syscall
