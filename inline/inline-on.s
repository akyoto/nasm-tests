global _start

_start:
	mov rax, 1000000000

loop:
	mov rbx, 1
	mov rcx, 2
	mov rdx, 3
	dec rax
	jnz loop
	call exit

exit:
	mov rax, 60
	mov rdi, 0
	syscall
