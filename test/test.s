bits 64
global _start

_start:
	mov qword rcx, [rbx]
	mov qword r12, [rbx]

	mov qword rcx, [rbx+1]
	mov qword r12, [rbx+1]

	mov qword rsp, [rbx]
	mov qword rbp, [rbx]
	mov qword r13, [rbx]
	mov qword r14, [rbx]
	mov qword r15, [rbx]

	mov qword [rax+1], rax
	mov dword [rax+1], eax
	mov word [rax+1], ax
	mov byte [rax+1], al

	mov qword [rcx+1], rcx
	mov dword [rcx+1], ecx
	mov word [rcx+1], cx
	mov byte [rcx+1], cl

	mov qword [rdx+1], rdx
	mov dword [rdx+1], edx
	mov word [rdx+1], dx
	mov byte [rdx+1], dl

	mov qword [rbx+1], rbx
	mov dword [rbx+1], ebx
	mov word [rbx+1], bx
	mov byte [rbx+1], bl

	mov qword [rdi+1], rdi
	mov dword [rdi+1], edi
	mov word [rdi+1], di
	mov byte [rdi+1], dl

	mov qword [rsi+1], rsi
	mov dword [rsi+1], esi
	mov word [rsi+1], si
	mov byte [rsi+1], sil

	mov qword [rbp+1], rbp
	mov dword [rbp+1], ebp
	mov word [rbp+1], bp
	mov byte [rbp+1], bl

	mov qword [rsp+1], rsp
	mov dword [rsp+1], esp
	mov word [rsp+1], sp
	mov byte [rsp+1], spl

	mov qword [r8+1], r8
	mov dword [r8+1], r8d
	mov word [r8+1], r8w
	mov byte [r8+1], r8b

	mov qword [r9+1], r9
	mov dword [r9+1], r9d
	mov word [r9+1], r9w
	mov byte [r9+1], r9b

	mov qword [r10+1], r10
	mov dword [r10+1], r10d
	mov word [r10+1], r10w
	mov byte [r10+1], r10b

	mov qword [r11+1], r11
	mov dword [r11+1], r11d
	mov word [r11+1], r11w
	mov byte [r11+1], r11b

	mov qword [r12+1], r12
	mov dword [r12+1], r12d
	mov word [r12+1], r12w
	mov byte [r12+1], r12b

	mov qword [r13+1], r13
	mov dword [r13+1], r13d
	mov word [r13+1], r13w
	mov byte [r13+1], r13b

	mov qword [r14+1], r14
	mov dword [r14+1], r14d
	mov word [r14+1], r14w
	mov byte [r14+1], r14b

	mov qword [r15+1], r15
	mov dword [r15+1], r15d
	mov word [r15+1], r15w
	mov byte [r15+1], r15b
