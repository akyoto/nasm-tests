global _start

; Constants
sys_write equ 1
sys_exit equ 60
stdout equ 1
maxIntDigits equ 19
iterations equ 10000000

_start:
	mov r8, iterations
again:
	mov rax, 256
	call printInt
	dec r8
	jnz again

	mov rax, sys_write
	mov rdi, stdout
	mov rsi, digits
	add rsi, maxIntDigits
	sub rsi, rbx
	mov rdx, rbx
	syscall

	call exit

; input: int64 in rax
; output: prints the number on stdout
printInt:
	; Reset digit counter
	mov rbx, maxIntDigits

printInt.start:
	; Decrease pointer
	dec rbx

	; Divide rax by rcx (10)
	; Remainder will be in rdx, result will be in rax.
	xor edx, edx
	mov rcx, 10
	div rcx

	; Turn the remainder into an ascii character.
	add dl, 0x30

	; Save the remainder as an ascii character.
	mov byte [digits+rbx], dl

	; Repeat if the result of the division is not zero
	cmp rax, 0
	jnz printInt.start

	; Write the generated string and return
	; mov rax, sys_write
	; mov rdi, stdout
	; mov rsi, digits
	; add rsi, maxIntDigits
	; sub rsi, rbx
	; mov rdx, rbx
	; syscall
	ret

; exits the program
exit:
	mov rax, sys_exit
	mov rdi, 0
	syscall

section .bss
	digits resb maxIntDigits
