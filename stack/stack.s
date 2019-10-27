global _start

_start:
	; Create stack frame
	push rbp

	; Reserve 8 bytes
	;sub rsp, 8
	;mov qword [rbp - 8], 10

	; Destroy stack frame
	;mov rsp, rbp
	pop rbp
	
	; Exit
	; mov rax, 60
	; mov rdi, 0
	; syscall
