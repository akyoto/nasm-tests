global _start

_start:
	mov rax, 1000000000

loop:
	call func
	dec rax
	jnz loop
	call exit

func:
	mov rbx, 1
	mov rcx, 2
	mov rdx, 3
	ret

exit:
	mov rax, 60
	mov rdi, 0
	syscall
