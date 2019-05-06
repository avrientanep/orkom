
global main
extern scanf
extern printf
extern fflush
      
section .data
    msg db '%d', 0
    prt db '%d', 10, 0
     
    matrix  dd 7,11,10,6
            dd 5,8,9,2
            dd 1,3,12,4
             
section .bss
    a resd 4
          
section .text
    global main
main:
    push a
    push msg        
    call scanf
    add esp, 8
     
    mov ecx, 4
    mov eax, 16
    mul dword[a]
    mov ebx, 0
    mov edx, 0
 
matrik :  
    add edx, [matrix + eax + ebx*4]
    add ebx, 1
     
    loop matrik
    mov eax, edx
     
print : push eax
        push prt
        call printf
        add esp, 0x8
   
exit:  
    push 0
    call fflush
    add esp, 4
    
    mov eax, 1      ;exit(0) 
    mov ebx, 0
    int 0x80
