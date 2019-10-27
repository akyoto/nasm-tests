global _start

; Constants
sys_write equ 1
sys_exit equ 60
stdout equ 1

_start:
	mov rsi, text
	call print

	; Exit
	mov rax, sys_exit
	mov rdi, 0
	syscall

; input: 0-terminated string at rsi
; output: prints string on stdout
print:
	cmp byte [rsi], 0
	jz print.end

	mov rax, sys_write
	mov rdi, stdout
	mov rdx, 1
	syscall

	inc rsi
	jmp print

print.end:
	ret

section .data
	text db "Hello", 10, 0
