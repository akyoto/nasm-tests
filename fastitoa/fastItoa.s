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

	; Determine number of digits
	mov rbx, 1000000000000000000
	cmp rax, rbx
	jge has19digits
	mov rbx, 100000000000000000
	cmp rax, rbx
	jge has18digits
	mov rbx, 10000000000000000
	cmp rax, rbx
	jge has17digits
	mov rbx, 1000000000000000
	cmp rax, rbx
	jge has16digits
	mov rbx, 100000000000000
	cmp rax, rbx
	jge has15digits
	mov rbx, 10000000000000
	cmp rax, rbx
	jge has14digits
	mov rbx, 1000000000000
	cmp rax, rbx
	jge has13digits
	mov rbx, 100000000000
	cmp rax, rbx
	jge has12digits
	mov rbx, 10000000000
	cmp rax, rbx
	jge has11digits
	mov rbx, 1000000000
	cmp rax, rbx
	jge has10digits
	mov rbx, 100000000
	cmp rax, rbx
	jge has9digits
	mov rbx, 10000000
	cmp rax, rbx
	jge has8digits
	mov rbx, 1000000
	cmp rax, rbx
	jge has7digits
	mov rbx, 100000
	cmp rax, rbx
	jge has6digits
	mov rbx, 10000
	cmp rax, rbx
	jge has5digits
	mov rbx, 1000
	cmp rax, rbx
	jge has4digits
	mov rbx, 100
	cmp rax, rbx
	jge has3digits
	mov rbx, 10
	cmp rax, rbx
	jge has2digits
	jmp has1digit

ALIGN 4
has19digits:
	add rsi, 18
	jmp has1digit

ALIGN 4
has18digits:
	add rsi, 17
	jmp has1digit

ALIGN 4
has17digits:
	add rsi, 16
	jmp has1digit

ALIGN 4
has16digits:
	add rsi, 15
	jmp has1digit

ALIGN 4
has15digits:
	add rsi, 14
	jmp has1digit

ALIGN 4
has14digits:
	add rsi, 13
	jmp has1digit

ALIGN 4
has13digits:
	add rsi, 12
	jmp has1digit

ALIGN 4
has12digits:
	add rsi, 11
	jmp has1digit

ALIGN 4
has11digits:
	add rsi, 10
	jmp has1digit

ALIGN 4
has10digits:
	add rsi, 9
	jmp has1digit

ALIGN 4
has9digits:
	add rsi, 8
	jmp has1digit

ALIGN 4
has8digits:
	add rsi, 7
	jmp has1digit

ALIGN 4
has7digits:
	add rsi, 6
	jmp has1digit

ALIGN 4
has6digits:
	add rsi, 5
	jmp has1digit

ALIGN 4
has5digits:
	add rsi, 4
	jmp has1digit

ALIGN 4
has4digits:
	add rsi, 3
	jmp has1digit

ALIGN 4
has3digits:
	add rsi, 2
	jmp has1digit

ALIGN 4
has2digits:
	add rsi, 1

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
	guessLog10 db	0, 0, 0, 0, 1, 1, 1, 2, 2, 2,  \
					3, 3, 3, 3, 4, 4, 4, 5, 5, 5,  \
					6, 6, 6, 6, 7, 7, 7, 8, 8, 8,  \
					9, 9, 9, 9, 10, 10, 10, 11, 11, 11, \
					12, 12, 12, 12, 13, 13, 13, 14, 14, 14, \
					15, 15, 15, 15, 16, 16, 16, 17, 17, 17, \
					18, 18, 18, 18, 19

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

