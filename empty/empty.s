global _start

_start:
	mov rax, 60       ; exit(
	mov rdi, 0        ;   EXIT_SUCCESS
	syscall           ; );