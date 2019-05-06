extern printf
extern fflush
extern scanf
      
section .data
    input db "%f", 0
    input2 db "%d", 0
    sum dd 0
    output db "%.1f", 10, 0
          
section .bss
    n resd 1 ; resd untuk nilai yang belum ditentuin
	a resd 1
	b resd 1
	c resd 1	
    result1 resd 1		
    result resd 1		
     
section .text
    global main
          
main:
	push n
    push input2
    call scanf
    add esp, 8
    
    mov esi,[n]
    fld dword [sum]
    
looping:
	push a
	push input
	call scanf
	add esp, 8
	
	fadd dword [a]
	sub esi,1
	
	cmp esi,0
	jne looping
	
	fidiv dword [n]
	fstp qword [result]
    
     
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
