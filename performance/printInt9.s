global _start

; Constants
sys_write equ 1
sys_exit equ 60
stdout equ 1
maxIntDigits equ 20
iterations equ 10000000

_start:
	push rbp
	sub rsp, maxIntDigits
	mov r15, iterations

again:
	mov rdi, 123456789123456789
	mov rsi, rsp

; input: rdi: number to convert
; input: rsi: pointer to a buffer
; output: decimal number in ASCII inside the buffer with an ending 0-byte.
printInt:
	; For positive numbers, jump straight to "unsigned".
	; For negative numbers, we'll run the "signed" part.
	test rdi, rdi
	jns unsigned

signed:
	mov byte [rsi], 45
	inc rsi
	neg rdi

unsigned:
	mov r9, rsi
	mov r8, 0x6666666666666667

loop2:
	mov rax, rdi			; rax = value
	mul r8					; rax *= magic number, rdx = overflow
	mov rax, rdx			; rax = rdx // (shift mul result by 32 to the right)
	shr rax, byte 63		; rax >>= 63
	shr rdx, byte 2			; rdx >>= 2
	add rdx, rax			; rdx += rax
	lea eax, [rdx+rdx]		; eax = rdx * 2
	lea eax, [rax+rax*4]	; eax = rax + rax * 4
	mov ecx, edi			; ecx = edi
	sub ecx, eax			; ecx -= eax

	; Turn it into ASCII and save it on the stack
	add cl, 48
	mov [rsi], cl
	inc rsi

	cmp rdi, byte 9
	mov rdi, rdx
	ja loop2

cleanup:
	; Null-terminate
	mov byte [rsi], 0

	; Save length of used buffer in r8
	mov r8, rsi
	sub r8, rsp

reverse.init:
	dec rsi
	mov rax, r9

reverse:
	mov byte bl, [rsi]
	mov byte cl, [rax]
	mov byte [rsi], cl
	mov byte [rax], bl
 	inc rax
 	dec rsi
 	cmp rsi, rax
 	jg reverse

final:
	dec r15
	jnz again

	mov rax, sys_write
	mov rdi, stdout
	mov rdx, r8
	mov rsi, rsp
	syscall

	add rsp, maxIntDigits
	pop rbp

	call exit

; exits the program
exit:
	mov rax, sys_exit
	mov rdi, 0
	syscall
