extern printf
extern fflush
extern scanf
     
section .data
    input db "%s", 0
    output db "%d", 10, 0
         
section .bss
	str1 resb 20
        
section .text
    global main
         
main:
	cld
	push str1 		;variable simpan string
	push input
	call scanf
	
	mov ecx, 21		;maksimum 20
	mov edi, str1	;masukin string ke edi
	mov al, ""		;sampai ketemu null
	repne scasb		;bandingin string sampe ketemu yg dicari dan ecx terus berkurang
	
	mov eax, 20   ;20
	sub eax, ecx  ;20-ecx = panjangnya
	
	push eax      ;print eax
	push output
	call printf
	
exit:
	push 0
	call fflush
    mov eax, 1
    mov ebx, 0
    int 0x80
