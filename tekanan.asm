
extern printf
extern fflush
extern scanf
   
segment .data
in1 db "%d", 0
out1 db "%d",0xa,0
inta dd 4
kempes db "kempes",10,0
pas db "pas",10,0
keras db "keras",10,0
 
   
segment .bss
a resb 4
   
segment .text
global main
   
main:
    push a
    push in1
    call scanf
    add esp,8
       
    mov eax, [a]
     
    mov ebx, 29
    cmp eax, ebx
    JAE L1
    JB L2
    
   L1:
		mov ebx,35
		cmp eax, ebx
		JA L3
		JBe L4		
    
    L2: 
		push kempes
        call printf
        add esp,4
        JMP exit 
        
    L4:
        push pas
        call printf
        add esp,4
        JMP exit 
        
    L3:
        push keras
        call printf
        add esp,4
        JMP exit 
        
    
  
       
exit:
    push 0
    call fflush
    add esp,4
    mov eax, 1
    mov ebx, 0 
    int 0x80
