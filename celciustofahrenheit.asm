extern printf
extern fflush
extern scanf
       
section .data
    input db "%f", 0
    output db "%.2f", 10, 0
    kali dd 1.8
    tambah dd 32.0
           
section .bss
    celcius resd 1
    result resd 1
      
section .text
    global main
           
main:
    push celcius
    push input
    call scanf
     
    fld dword[celcius]         
    fmul dword[kali]	
    fadd dword[tambah]	
    fst qword [result]                   
								
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
