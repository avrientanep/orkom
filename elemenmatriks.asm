extern scanf
extern printf
extern fflush
   
segment .data
    input1 db "%d %d",0
    out1 db "%d",10,0
    M dd 7,11,10,6
	  dd 5,8,9,2
	  dd 1,3,12,4
			
segment .bss
    row resd 4
    col resd 4 
     
segment .text
global main
   
main:
    push col
    push row
    push input1
    call scanf
    add esp,12
       
   
    mov eax, [row]
	mov ecx, 4
	mul ecx
    
    mov ebx, [col]
    add eax, ebx
    
    mov esi, eax
    mov eax, [M + esi*4]
       
;print:
    push eax
    push out1
    call printf
    add esp, 8
 
   
;exit:
    push 0
    call fflush
    add esp,4
    mov eax, 1
    mov ebx, 0 
    int 0x80
