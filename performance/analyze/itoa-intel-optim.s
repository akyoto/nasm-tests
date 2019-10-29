	.text
	.intel_syntax noprefix
	.file	"printInt-customc.c"
	.globl	itoa                    # -- Begin function itoa
	.p2align	4, 0x90
	.type	itoa,@function
itoa:                                   # @itoa
	.cfi_startproc
# %bb.0:
	test	rdi, rdi
	jns	.LBB0_2
# %bb.1:
	mov	byte ptr [rsi], 45
	inc	rsi
	neg	rdi
.LBB0_2:
	dec	rsi
	movabs	r8, 7378697629483820647
	mov	rcx, rdi
	.p2align	4, 0x90
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	mov	rax, rcx
	imul	r8
	mov	rax, rdx
	shr	rax, 63
	sar	rdx, 2
	add	rdx, rax
	add	rcx, 9
	inc	rsi
	cmp	rcx, 18
	mov	rcx, rdx
	ja	.LBB0_3
# %bb.4:
	mov	byte ptr [rsi + 1], 0
	.p2align	4, 0x90
.LBB0_5:                                # =>This Inner Loop Header: Depth=1
	mov	rax, rdi
	imul	r8
	mov	rax, rdx
	shr	rax, 63
	sar	rdx, 2
	add	rdx, rax
	lea	eax, [rdx + rdx]
	lea	eax, [rax + 4*rax]
	mov	ecx, edi
	sub	ecx, eax
	add	cl, 48
	mov	byte ptr [rsi], cl
	add	rdi, 9
	dec	rsi
	cmp	rdi, 18
	mov	rdi, rdx
	ja	.LBB0_5
# %bb.6:
	ret
.Lfunc_end0:
	.size	itoa, .Lfunc_end0-itoa
	.cfi_endproc
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	push	r15
	.cfi_def_cfa_offset 24
	push	r14
	.cfi_def_cfa_offset 32
	push	r12
	.cfi_def_cfa_offset 40
	push	rbx
	.cfi_def_cfa_offset 48
	sub	rsp, 32
	.cfi_def_cfa_offset 80
	.cfi_offset rbx, -48
	.cfi_offset r12, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rsp + 24], rax
	xor	r9d, r9d
	lea	r10, [rsp + 17]
	movabs	r11, 123456789123456789
	movabs	r12, 7378697629483820647
	movabs	r14, -6640827866535438581
	movabs	r15, 2361183241434822607
	.p2align	4, 0x90
.LBB1_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_2 Depth 2
	mov	byte ptr [rsp + 18], 0
	mov	rbx, r10
	mov	rcx, r11
	.p2align	4, 0x90
.LBB1_2:                                #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	mov	rax, rcx
	imul	r12
	mov	rsi, rdx
	mov	rax, rdx
	shr	rax, 63
	sar	rsi, 2
	add	rsi, rax
	lea	r8d, [rsi + rsi]
	mov	rax, rsi
	imul	r12
	mov	rdi, rdx
	lea	ebp, [r8 + 4*r8]
	mov	rax, rcx
	imul	r14
	mov	r8, rdx
	add	r8, rcx
	mov	eax, ecx
	sub	eax, ebp
	add	al, 48
	mov	byte ptr [rbx], al
	mov	rax, rdi
	shr	rax, 63
	shr	edi, 2
	add	edi, eax
	add	edi, edi
	lea	eax, [rdi + 4*rdi]
	sub	esi, eax
	add	sil, 48
	mov	byte ptr [rbx - 1], sil
	mov	rdi, r8
	shr	rdi, 63
	sar	r8, 6
	lea	rsi, [r8 + rdi]
	mov	rax, rsi
	imul	r12
	mov	rax, rdx
	shr	rax, 63
	shr	edx, 2
	add	edx, eax
	add	edx, edx
	lea	eax, [rdx + 4*rdx]
	sub	esi, eax
	add	sil, 48
	mov	byte ptr [rbx - 2], sil
	mov	rax, rcx
	imul	r15
	mov	rcx, rdx
	mov	rax, rdx
	shr	rax, 63
	sar	rcx, 7
	add	rcx, rax
	lea	rax, [r8 + rdi]
	add	rax, 9
	add	rbx, -3
	cmp	rax, 18
	ja	.LBB1_2
# %bb.3:                                #   in Loop: Header=BB1_1 Depth=1
	inc	r9d
	cmp	r9d, 10000000
	jne	.LBB1_1
# %bb.4:
	lea	rdi, [rip + .L.str]
	mov	rsi, rsp
	xor	eax, eax
	call	printf@PLT
	mov	rax, qword ptr fs:[40]
	cmp	rax, qword ptr [rsp + 24]
	jne	.LBB1_6
# %bb.5:
	xor	eax, eax
	add	rsp, 32
	.cfi_def_cfa_offset 48
	pop	rbx
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r14
	.cfi_def_cfa_offset 24
	pop	r15
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
.LBB1_6:
	.cfi_def_cfa_offset 80
	call	__stack_chk_fail@PLT
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.type	iterations,@object      # @iterations
	.section	.rodata,"a",@progbits
	.globl	iterations
	.p2align	2
iterations:
	.long	10000000                # 0x989680
	.size	iterations, 4

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%s"
	.size	.L.str, 3


	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym __stack_chk_fail
