; (C) Copyright 2019 Eduard Urbach
bits 64
global _start

maxDigits equ 32
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
	mov rdx, r8
	mov rsi, rsp
	syscall

	; Free stack space
	add rsp, maxDigits

	; Destroy stack frame
	pop rbp

	; Exit program
	call exit

; input: rdi (number), rsi (buffer)
ALIGN 16
itoa:
	xor r8, r8

	; For positive numbers, jump straight to "unsigned".
	; For negative numbers, we'll run the "signed" part.
	test rdi, rdi
	jns unsigned

signed:
	; Add the minus character
	mov byte [rsi], 45
	inc rsi
	inc r8
	neg rdi

unsigned:
	; Number of leading zeros
	lzcnt rax, rdi
	jc isZero
	movzx eax, byte [guessLog10+rax]
	cmp rdi, qword [powersOf10+rax*8]
	jl lower

greaterEqual:
	inc rax

lower:
	add rsi, rax
	add r8, rax
	mov rbx, 0x6666666666666667
	dec rsi

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
ALIGN 16
fastDivMod10:
	; Divide by 10
	mov rax, rdi
	mul rbx

	; "mul" needs some time to calculate rdx before we can access it.
	; Insert other instructions here so we can do them in the meantime.
	mov rcx, rdi

	; Multiplication finished
	shr rdx, byte 2
	mov rdi, rdx

	; Multiply by 10 and save in rax
	lea rax, [rdx+rdx]
	lea rax, [rax+rax*4]

	; Subtract from actual value to get the remainder
	sub rcx, rax

	; Return
	ret

isZero:
	mov byte [rsi], 48
	mov r8, 1
	ret

exit:
	mov rax, 60
	mov rdi, 0
	syscall

section .rodata
	guessLog10 db \
		19, 18, 18, 18, 18, 17, 17, 17, 16, 16, \
		16, 15, 15, 15, 15, 14, 14, 14, 13, 13, \
		13, 12, 12, 12, 12, 11, 11, 11, 10, 10, \
		10, 9, 9, 9, 9, 8, 8, 8, 7, 7, \
		7, 6, 6, 6, 6, 5, 5, 5, 4, 4, \
		4, 3, 3, 3, 3, 2, 2, 2, 1, 1, \
		1, 0, 0, 0, 0

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
		1000000000000000000, \
		10000000000000000000

	; guessLog10 db	0, 0, 0, 0, 1, 1, 1, 2, 2, 2,  \
	; 				3, 3, 3, 3, 4, 4, 4, 5, 5, 5,  \
	; 				6, 6, 6, 6, 7, 7, 7, 8, 8, 8,  \
	; 				9, 9, 9, 9, 10, 10, 10, 11, 11, 11, \
	; 				12, 12, 12, 12, 13, 13, 13, 14, 14, 14, \
	; 				15, 15, 15, 15, 16, 16, 16, 17, 17, 17, \
	; 				18, 18, 18, 18, 19
