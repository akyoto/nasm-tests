global _start

_start:
	mov rax, 2
	mov rdi, fileName
	mov rsi, 0102o     ;O_CREAT, man open
	mov rdx, 0666o     ;umode_t
	syscall

	mov [fd], rax
	mov rax, 1         ;system call number (sys_write)
	mov rdi, [fd]      ;file descriptor
	mov rsi, msg       ;message to write
	mov rdx, len       ;message length
	syscall            ;call kernel

	mov rax, 3         ;sys_close
	mov rdi, [fd]
	syscall

	mov rax, 60        ;system call number (sys_exit)
	syscall            ;call kernel

section .data
    msg db "Hello World", 10
    len equ $ - msg
    fileName db "test.txt", 0

section .bss
    fd resq 1
