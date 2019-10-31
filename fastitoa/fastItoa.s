; (C) Copyright 2019 Eduard Urbach
bits 64
global _start

maxDigits equ 20
iterations equ 100000000

_start:
	; Create stack frame
	push rbp

	; Reserve stack space for the digits
	sub rsp, maxDigits

	; Repeat n times
	mov r11, iterations

again:
	; Call itoa
	mov rdi, r11
	mov rsi, rsp
	call itoa
	dec r11
	jnz again

finish:
	; Write the generated string and return
	mov rax, 1
	mov rdi, 1
	mov rdx, r9
	mov rsi, rsp
	syscall

	; Free stack space
	add rsp, maxDigits

	; Destroy stack frame
	pop rbp

	; Exit program
	call exit

; input: rdi (number), rsi (buffer)
ALIGN 32
itoa:
	mov r8, 0x6666666666666667
	mov r10, rsi

	; For positive numbers, jump straight to "unsigned".
	; For negative numbers, we'll run the "signed" part.
	test rdi, rdi
	jns unsigned

signed:
	mov byte [rsi], 45
	inc rsi
	neg rdi

unsigned:
	; Number of leading zeros
	lzcnt rax, rdi
	jc has1digit
	mov al, byte [guessLog10+rax]
	mov rcx, [powersOf10+rax]
	cmp rdi, rcx
	jl lower

greaterEqual:
	inc rax

lower:
	add rsi, rax

ALIGN 4
has1digit:
	; Length of used buffer in r9
	mov r9, rsi
	sub r9, r10
	inc r9

nextDigit:
	call fastDivMod10
	add cl, 0x30
	mov byte [rsi], cl
	dec rsi
	cmp rdi, 0
	jg nextDigit
	ret

; input: rdi (number)
; output: rdi (div result), rcx (mod result)
ALIGN 32
fastDivMod10:
	; Mul expects rax register to be the first operand
	mov rax, rdi
	mov rcx, rdi

	; Divide by 10 and save in rcx
	mul r8
	shr rdx, byte 2
	mov rdi, rdx

	; Multiply by 10 and save in rax
	lea rax, [rdx+rdx]
	lea rax, [rax+rax*4]

	; Subtract from actual value to get the remainder
	sub rcx, rax

	; Return
	ret

exit:
	mov rax, 60
	mov rdi, 0
	syscall

section .rodata
	; guessLog10 db	0, 0, 0, 0, 1, 1, 1, 2, 2, 2,  \
	; 				3, 3, 3, 3, 4, 4, 4, 5, 5, 5,  \
	; 				6, 6, 6, 6, 7, 7, 7, 8, 8, 8,  \
	; 				9, 9, 9, 9, 10, 10, 10, 11, 11, 11, \
	; 				12, 12, 12, 12, 13, 13, 13, 14, 14, 14, \
	; 				15, 15, 15, 15, 16, 16, 16, 17, 17, 17, \
	; 				18, 18, 18, 18, 19

	guessLog10 db 19, 18, 18, 18, 18, 17, 17, 17, 16, 16, 16, 15, 15, 15, 15, 14, 14, 14, 13, 13, 13, 12, 12, 12, 12, 11, 11, 11, 10, 10, 10, 9, 9, 9, 9, 8, 8, 8, 7, 7, 7, 6, 6, 6, 6, 5, 5, 5, 4, 4, 4, 3, 3, 3, 3, 2, 2, 2, 1, 1, 1, 0, 0, 0, 0

	powersOf10 dq \
		1, \
		10, \
		100, \
		1000, \
		10000, \
		100000, \
		1000000, \
		10000000, \
		100000000, \
		1000000000, \
		10000000000, \
		100000000000, \
		1000000000000, \
		10000000000000, \
		100000000000000, \
		1000000000000000, \
		10000000000000000, \
		100000000000000000, \
		1000000000000000000

