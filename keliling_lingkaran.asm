extern printf
extern fflush
extern scanf
      
section .data
    input db "%f", 0
    output db "%f", 10, 0
          
section .bss
    diameter resd 1
    result resd 1
     
section .text
    global main
          
main:
    push diameter
    push input
    call scanf
    
	fldpi 					;  ;ini phi dimasukin ke sto (top of stack
    fld dword[diameter]   	;
    fmulp                 	; mengkalikan st0 dan st1
    fstp qword[result]    	; fstp buat copy hasilnya ke result
     
    push dword[result+4]
    push dword[result]
    push output
    call printf
     
exit:
    push 0
    call fflush
    mov eax, 1
    mov ebx, 0
    int 0x80
