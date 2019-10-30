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

nextDigit:
	mov rax, r8
	call fastDivMod
	add r9b, 0x30
	mov byte [rsi], r9b
	inc rsi
	cmp r8, 0
	jg nextDigit

	; Save length of used buffer in r10
	mov r10, rsi
	sub r10, r12

	; Reverse
	dec rsi
	call reverse
	ret

ALIGN 32
fastDivMod:
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

; input: rsi, r11
ALIGN 32
reverse:
	mov byte bl, [rsi]
	mov byte cl, [r11]
	mov byte [rsi], cl
	mov byte [r11], bl
 	inc r11
 	dec rsi
 	cmp rsi, r11
 	jg reverse
	ret

exit:
	mov rax, 60
	mov rdi, 0
	syscall

section .data
	digits db "0123456789"
