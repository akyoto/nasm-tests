global _start

_start:
	; CPUID with EAX=0
	xor eax, eax
	cpuid

	; Build the string
	mov [vendor], ebx
	mov [vendor+4], edx
	mov [vendor+8], ecx

	; Write vendor to stdout
	mov rax, 1
	mov rdi, 1
	mov rsi, vendor
	mov rdx, 12
	syscall

	; Exit
	mov rax, 60
	mov rdi, 0
	syscall

section .bss
	vendor resb 12
