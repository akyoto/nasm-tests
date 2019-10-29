global _start

_start:
	; Create stack frame
	push rbp

	; Reserve 4 bytes
	sub rsp, 4

	; Save 0123 in ASCII
	mov byte [rsp], 0x30
	mov byte [rsp+1], 0x31
	mov byte [rsp+2], 0x32
	mov byte [rsp+3], 0x33

	; Write the stack contents to stdout
	mov rax, 1
	mov rdi, 1
	mov rdx, 4
	mov rsi, rsp
	syscall

	; Free 4 bytes
	add rsp, 4

	; Destroy stack frame
	pop rbp
	
	; Exit
	mov rax, 60
	mov rdi, 0
	syscall
