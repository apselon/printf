%macro pushaq 0
    push rax 
    push rcx 
    push rdx 
    push rbx 
    push rbp 
    push rsi 
    push rdi 
    push r8
    push r9
    push r10 
%endmacro

%macro popaq 0
    pop r10 
    pop r9
    pop r8
    pop rdi    
    pop rsi    
    pop rbp    
    pop rbx    
    pop rdx    
    pop rcx 
    pop rax 
%endmacro


section .data

section .text
		stdout_f equ 1

		extern strlen
	
		global put_str

;==============================================================================
; put_str -> gets nullterminated str from stack to stdout 
; 
;==============================================================================
put_str:
		enter 0, 0
		pushaq
			
		mov rdi, stdout_f
		mov rsi, [rbp + 16]

	;saving string length in rdx
		call strlen	
		
		mov rax, 1d

		syscall

		popaq
		leave 

		ret 
