global _start

maxDigits equ 20

_start:
	mov r15, 10000000
	mov r14, 0x6666666666666667

benchmark:
	call fastDivMod
	dec r15
	jnz benchmark

finish:
	mov rax, 128
	call printInt

	mov rax, r8
	call printInt

	mov rax, r9
	call printInt

	call exit

normalDivMod:
	mov rax, 128
	xor rdx, rdx
	mov rbx, 10
	div rbx
	mov r8, rax
	mov r9, rdx
	ret

fastDiv:
	mov rax, 128
	mul r14
	shr rdx, byte 2
	mov r8, rdx
	ret

fastDivMod:
	; Store value in rax and rbx
	mov rax, 128
	mov rbx, rax

	; Calculate division by 10
	mul r14
	shr rdx, byte 2
	mov r8, rdx

	; Multiply result by 10 again, store it in rax
	lea rax, [rdx+rdx]
	lea rax, [rax+rax*4]

	; Subtract from actual value to get the remainder
	sub rbx, rax
	mov r9, rbx

	; Return
	ret

; input: int64 in rax
; output: prints the number on stdout
printInt:
	mov rbx, rsp
	sub rsp, maxDigits

	dec rbx
	mov byte [rbx], 10

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
	mov byte [rbx], dl

	; Repeat if the result of the division is not zero
	cmp rax, 0
	jnz printInt.start

	; Write the generated string and return
	mov rax, 1
	mov rdi, 1
	mov rsi, rbx
	mov rdx, rbx
	sub rdx, rsp
	syscall

	add rsp, maxDigits
	ret

exit:
	mov rax, 60
	mov rdi, 0
	syscall
