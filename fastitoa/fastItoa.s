; (C) Copyright 2019 Eduard Urbach
global _start

maxDigits equ 20
iterations equ 100000000

_start:
	; Create stack frame
	push rbp

	; Reserve stack space for the digits
	sub rsp, maxDigits

	; Repeat n times
	mov r15, iterations

again:
	; Call itoa
	mov rax, r15
	mov rsi, rsp
	call itoa
	dec r15
	jnz again

finish:
	; Write the generated string and return
	mov rax, 1
	mov rdi, 1
	mov rdx, r10
	mov rsi, rsp
	syscall

	; Free stack space
	add rsp, maxDigits

	; Destroy stack frame
	pop rbp

	; Exit program
	call exit

; input: rax (number), rsi (buffer)
ALIGN 32
itoa:
	mov r12, rsi

	; For positive numbers, jump straight to "unsigned".
	; For negative numbers, we'll run the "signed" part.
	test rax, rax
	jns unsigned

signed:
	mov byte [rsi], 45
	inc rsi
	neg rax

unsigned:
	mov r8, rax
	mov r11, rsi
	mov r14, 0x6666666666666667

	; Number of leading zeros
	mov rax, 123456789123456789
	lzcnt rbx, rax
	jc has1digit
	mov bl, byte [guessLog10+rbx]
	mov rcx, [powersOf10+rbx]
	cmp rax, rcx
	jl lower

greaterEqual:
	inc rbx

lower:
	add rsi, rbx

ALIGN 4
has1digit:
	; Length of used buffer in r10
	mov r10, rsi
	sub r10, r12
	inc r10

nextDigit:
	mov rax, r8
	call fastDivMod10
	add r9b, 0x30
	mov byte [rsi], r9b
	dec rsi
	cmp r8, 0
	jg nextDigit
	ret

ALIGN 32
fastDivMod10:
	; Store copy of rax in rbx
	mov rbx, rax

	; Divide by 10 and save in rdx
	mul r14
	shr rdx, byte 2
	mov r8, rdx

	; Multiply by 10 and save in rax
	lea rax, [rdx+rdx]
	lea rax, [rax+rax*4]

	; Subtract from actual value to get the remainder
	sub rbx, rax
	mov r9, rbx

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

