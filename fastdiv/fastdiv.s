global _start

_start:
	call fast
	call exit

normal:
	xor rdx, rdx
	mov rax, 128
	mov rbx, 10
	div rbx
	mov r14, rax
	ret

fast:
	mov r8, 0x6666666666666667
	; TODO

; uint64_t edxeax = ((uint64_t)eax) * ctx->mult;
; uint32_t edx = edxeax>>32;
; eax -= edx;
; eax >>= (ctx->shift1);
; eax += edx;
; eax >>= (ctx->shift2);
; return eax;

; exits the program
exit:
	mov rax, 60
	mov rdi, r14
	syscall
