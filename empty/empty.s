global _start

_start:
	; Exit
	mov rax, 60
	mov rdi, 0
	syscall