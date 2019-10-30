global _start

_start:
	mov r15, 10000000
	mov r14, 0x6666666666666667

loop:
	call fast
	dec r15
	jnz loop

	call exit

normal:
	mov rax, 128
	xor rdx, rdx
	mov rbx, 10
	div rbx
	mov r8, rax
	ret

fast:
	mov rax, 128
	mul r14
	shr rdx, byte 2
	mov r8, rdx
	ret

exit:
	mov rax, 60
	mov rdi, r8
	syscall
