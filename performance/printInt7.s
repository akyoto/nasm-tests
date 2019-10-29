global _start

; Constants
sys_write equ 1
sys_exit equ 60
stdout equ 1
maxIntDigits equ 20
iterations equ 10000000

_start:
	mov r15, iterations

again:
	mov rdi, 123456789123456789
	mov rsi, digits

; input: int64 in rdi
; input: buffer pointer in rsi
; output: decimal number inside buffer
printInt:
	; For positive numbers, jump straight to "unsigned".
	; For negative numbers, we'll run the "signed" part.
	test rdi, rdi
	jns unsigned

signed:
	mov byte [rsi], 0x2d
	inc rsi
	neg rdi

unsigned:
	dec rsi
	mov r8, 0x6666666666666667
	mov rcx, rdi

loop1:
	mov rax, rcx
	imul r8 ; Stored in RDX:RAX
	mov rax, rdx ; We only care about RDX
	shr rax, byte 0x3f
	sar rdx, byte 0x2
	add rdx, rax
	add rcx, byte +0x9
	inc rsi
	cmp rcx, byte +0x12
	mov rcx, rdx
	ja loop1
	mov byte [rsi+0x1], 0x0

loop2:
	mov rax, rdi
	imul r8
	mov rax, rdx
	shr rax, byte 0x3f
	sar rdx, byte 0x2
	add rdx, rax
	lea eax, [rdx+rdx]
	lea eax, [rax+rax*4]
	mov ecx, edi
	sub ecx, eax
	add cl, 0x30
	mov [rsi], cl
	add rdi, byte +0x9
	dec rsi
	cmp rdi, byte +0x12
	mov rdi, rdx
	ja loop2

final:
	dec r15
	jnz again

	mov rax, sys_write
	mov rdi, stdout
	mov rdx, maxIntDigits
	sub rdx, rbx
	mov rsi, digits
	add rsi, rbx
	syscall

	call exit

; exits the program
exit:
	mov rax, sys_exit
	mov rdi, 0
	syscall

section .bss
	digits resb maxIntDigits
