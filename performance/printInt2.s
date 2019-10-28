; (C) Copyright 2019 Eduard Urbach
global _start

; Constants
sys_write equ 1
sys_exit equ 60
stdout equ 1
maxIntDigits equ 4
iterations equ 10000000

_start:
	mov r15, iterations

again:
	; Reset result
	mov dword [result], 0

	; Calculate
	mov rax, 1023
	call printInt

	; Loop
	dec r15
	jnz again

	; Turn into ASCII codes
	add dword [result], 0x30303030

	mov rax, sys_write
	mov rdi, stdout
	mov rsi, result
	mov rdx, maxIntDigits
	syscall

	call exit

; input: int64 in rax
; output: prints the number on stdout
printInt:
	; Reset lookup pointer
	mov rdi, lookup

	; Hold a copy of our eax number in ebx
	mov ebx, eax

	; Reset bit shifter
	mov ecx, 1

	bitloop:
		and eax, ecx ; Check if bit is set
		mov eax, ebx ; Restore eax
		jz continue

		; Reset carry
		xor sil, sil

		; Calculate digit
		mov dl, [result+3]
		add dl, [rdi+3]
		add dl, sil
		mov sil, [carryBit+rdx]
		sub dl, [subtraction+rdx]
		mov [result+3], dl

		mov dl, [result+2]
		add dl, [rdi+2]
		add dl, sil
		mov sil, [carryBit+rdx]
		sub dl, [subtraction+rdx]
		mov [result+2], dl

		mov dl, [result+1]
		add dl, [rdi+1]
		add dl, sil
		mov sil, [carryBit+rdx]
		sub dl, [subtraction+rdx]
		mov [result+1], dl

		mov dl, [result]
		add dl, [rdi]
		add dl, sil
		mov sil, [carryBit+rdx]
		sub dl, [subtraction+rdx]
		mov [result], dl

		continue:
			add rdi, 4

			; Shift left
			shl ecx, 1

			; If it's less or equal to 1000000000b, continue the loop
			cmp ecx, 1000000000b
			jle bitloop

			; Otherwise, return
			ret

; exits the program
exit:
	mov rax, sys_exit
	mov rdi, 0
	syscall

section .rodata
	lookup db \
		0, 0, 0, 1, \
		0, 0, 0, 2, \
		0, 0, 0, 4, \
		0, 0, 0, 8, \
		0, 0, 1, 6, \
		0, 0, 3, 2, \
		0, 0, 6, 4, \
		0, 1, 2, 8, \
		0, 2, 5, 6, \
		0, 5, 1, 2
	
	carryBit db 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
	subtraction db 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10

section .bss
	result resb maxIntDigits
