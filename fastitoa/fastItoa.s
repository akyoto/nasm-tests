; (C) Copyright 2019 Eduard Urbach
global _start

maxDigits equ 20
iterations equ 10000000

_start:
	; Create stack frame
	push rbp

	; Reserve stack space for the digits
	sub rsp, maxDigits

	; Repeat n times
	mov r15, iterations

again:
	; Call itoa
	mov rax, 123456789123456789
	mov rsi, rsp
	call itoa
	dec r15
	jnz again

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
	cmp rax, 10
	jl has1digit
	cmp rax, 100
	jl has2digits
	cmp rax, 1000
	jl has3digits
	cmp rax, 10000
	jl has4digits
	cmp rax, 100000
	jl has5digits
	cmp rax, 1000000
	jl has6digits
	cmp rax, 10000000
	jl has7digits
	cmp rax, 100000000
	jl has8digits
	cmp rax, 1000000000
	jl has9digits
	mov rbx, 10000000000
	cmp rax, rbx
	jl has10digits
	mov rbx, 100000000000
	cmp rax, rbx
	jl has11digits
	mov rbx, 1000000000000
	cmp rax, rbx
	jl has12digits
	mov rbx, 10000000000000
	cmp rax, rbx
	jl has13digits
	mov rbx, 100000000000000
	cmp rax, rbx
	jl has14digits
	mov rbx, 1000000000000000
	cmp rax, rbx
	jl has15digits
	mov rbx, 10000000000000000
	cmp rax, rbx
	jl has16digits
	mov rbx, 100000000000000000
	cmp rax, rbx
	jl has17digits
	mov rbx, 1000000000000000000
	cmp rax, rbx
	jl has18digits

has19digits:
	add rsi, 18
	jmp has1digit

has18digits:
	add rsi, 17
	jmp has1digit

has17digits:
	add rsi, 16
	jmp has1digit

has16digits:
	add rsi, 15
	jmp has1digit

has15digits:
	add rsi, 14
	jmp has1digit

has14digits:
	add rsi, 13
	jmp has1digit

has13digits:
	add rsi, 12
	jmp has1digit

has12digits:
	add rsi, 11
	jmp has1digit

has11digits:
	add rsi, 10
	jmp has1digit

has10digits:
	add rsi, 9
	jmp has1digit

has9digits:
	add rsi, 8
	jmp has1digit

has8digits:
	add rsi, 7
	jmp has1digit

has7digits:
	add rsi, 6
	jmp has1digit

has6digits:
	add rsi, 5
	jmp has1digit

has5digits:
	add rsi, 4
	jmp has1digit

has4digits:
	add rsi, 3
	jmp has1digit

has3digits:
	add rsi, 2
	jmp has1digit

has2digits:
	add rsi, 1

ALIGN 32
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

section .data
	digits db "0123456789"
