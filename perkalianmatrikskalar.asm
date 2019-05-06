global main
extern scanf
extern printf
extern fflush
       
section .data
    msg db '%d', 0
    prt1 db '%d ', 0
    prt2 db '%d', 10, 0
      
    matrix  dd 7,11,10,6
            dd 5,8,9,12
            dd 11,13,12,15
              
section .bss
    a resd 2
           
section .text
    
main:
    push a
    push msg        
    call scanf
    add esp, 8
      
    mov edi, 0 ;set counternya 0
     
cek: 
    cmp edi, 44
    ja exit
 
kali:
    mov eax,[matrix+edi]
    mul dword[a]
     
    cmp edi, 12
    je newline
    cmp edi, 28
    je newline
    cmp edi, 44
    je newline
     
    push eax
    push prt1
    call printf
    add esp,8
     
    push 0
    call fflush
    add esp, 4
     
    add edi, 4
    jmp cek
      
newline : 
        push eax
        push prt2
        call printf
        add esp,8
              
    push 0
    call fflush
    add esp, 4
  
    add edi, 4
    jmp cek
    
exit:   
    mov eax, 1      ;exit(0) 
    mov ebx, 0
    int 0x80

