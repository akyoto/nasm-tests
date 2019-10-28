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
	; Calculate
	mov rax, 1023
	call printInt

	; Loop
	dec r15
	jnz again

	; Turn into ASCII codes
	add ebx, 0x30303030
	mov [result], ebx

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

	; Hold a copy of our eax number in r14d
	mov r14d, eax

	; Reset bit shifter
	mov ebp, 1

	; Reset final result
	xor ebx, ebx

	bitloop:
		and eax, ebp ; Check if bit is set
		mov eax, r14d ; Restore eax
		jz continue

		; Reset carry
		xor sil, sil

	digit:
		xor edx, edx
		mov dl, [rdi]
		add dl, sil
		shl edx, 24
		add ebx, edx

		; Copy register for "and" operation
		mov r13d, ebx
		and r13d, 0xff000000
		cmp r13d, 0x0a000000
		jge greater

		lower:
			xor sil, sil
			jmp digit2

		greater:
			sub ebx, 0x0a000000
			mov sil, 1

	digit2:
		xor edx, edx
		mov dl, [rdi+1]
		add dl, sil
		shl edx, 16
		add ebx, edx

		; Copy register for "and" operation
		mov r13d, ebx
		and r13d, 0x00ff0000
		cmp r13d, 0x000a0000
		jge greater2

		lower2:
			xor sil, sil
			jmp digit3

		greater2:
			sub ebx, 0x000a0000
			mov sil, 1

	digit3:
		xor edx, edx
		mov dl, [rdi+2]
		add dl, sil
		shl edx, 8
		add ebx, edx

		; Copy register for "and" operation
		mov r13d, ebx
		and r13d, 0x0000ff00
		cmp r13d, 0x00000a00
		jge greater3

		lower3:
			xor sil, sil
			jmp digit4

		greater3:
			sub ebx, 0x00000a00
			mov sil, 1

	digit4:
		xor edx, edx
		mov dl, [rdi+3]
		add dl, sil
		add ebx, edx

		; Copy register for "and" operation
		mov r13d, ebx
		and r13d, 0x000000ff
		cmp r13d, 0x0000000a
		jge greater4

		lower4:
			xor sil, sil
			jmp continue

		greater4:
			sub ebx, 0x0000000a
			mov sil, 1

	continue:
		add rdi, 4

		; Shift left
		shl ebp, 1

		; If it's less or equal to 1000000000b, continue the loop
		cmp ebp, 1000000000b
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
		1, 0, 0, 0, \
		2, 0, 0, 0, \
		4, 0, 0, 0, \
		8, 0, 0, 0, \
		6, 1, 0, 0, \
		2, 3, 0, 0, \
		4, 6, 0, 0, \
		8, 2, 1, 0, \
		6, 5, 2, 0, \
		2, 1, 5, 0, \
		4, 2, 0, 1, \
		8, 4, 0, 2, \
		6, 9, 0, 4

section .bss
	result resb maxIntDigits
