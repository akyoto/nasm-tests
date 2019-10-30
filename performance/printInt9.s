; (C) Copyright 2019 Eduard Urbach
global _start

; Constants
sys_write equ 1
sys_exit equ 60
stdout equ 1
maxDigits equ 20
iterations equ 10000000

_start:
	push rbp
	sub rsp, maxDigits
	mov r15, iterations

again:
	mov rdi, 123456789
	mov rsi, rsp

; input: rdi: number to convert
; input: rsi: pointer to a buffer
; output: decimal number in ASCII inside the buffer with an ending 0-byte.
printInt:
	; For positive numbers, jump straight to "unsigned".
	; For negative numbers, we'll run the "signed" part.
	test rdi, rdi
	jns unsigned

signed:
	mov byte [rsi], 45
	inc rsi
	neg rdi

unsigned:
	mov r8, 0x6666666666666667
	mov r9, rsi

nextDigit:
	; Store value in rax
	; rax = rdi
	mov rax, rdi

	; Calculate division by 10
	; rdx:rax = rax * r8
	; rax >>= 2
	mul r8
	shr rdx, byte 2

	; Multiply result by 10 again
	; rax = rdx * 2
	; rax = rax * 5
	lea rax, [rdx+rdx]
	lea rax, [rax+rax*4]

	; Subtract from actual value to get the remainder
	mov rcx, rdi
	sub rcx, rax

	; State (example):
	; rdi = 128
	; rax = 120 = x - (x % 10)
	; rcx = 8 = x % 10
	; rdx = 12 = x / 10

	; Turn it into ASCII and save it on the stack
	add cl, 48
	mov byte [rsi], cl

	inc rsi
	cmp rdx, 0
	jg nextDigit

cleanup:
	; Null-terminate
	mov byte [rsi], 0

	; Save length of used buffer in r8
	mov r8, rsi
	sub r8, rsp

reverse.init:
	dec rsi
	mov rax, r9

reverse:
	mov byte bl, [rsi]
	mov byte cl, [rax]
	mov byte [rsi], cl
	mov byte [rax], bl
 	inc rax
 	dec rsi
 	cmp rsi, rax
 	jg reverse

final:
	dec r15
	jnz again

	mov rax, sys_write
	mov rdi, stdout
	mov rdx, r8
	mov rsi, rsp
	syscall

	add rsp, maxDigits
	pop rbp

	call exit

; exits the program
exit:
	mov rax, sys_exit
	mov rdi, 0
	syscall
