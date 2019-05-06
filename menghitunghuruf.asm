extern printf
extern fflush
extern scanf
     
section .data
    input db "%s %s", 0
    print db "%d", 10, 0
    sum dd 0
    
         
section .bss
	string1 resb 41		;panjang string ditambah nul
	cari resb 2		;panjang string yg dicari ditambah nul
        
section .text
    global main
         
main:
	cld			;biar ngebaca string dari depan
	push cari		
	push string1
	push input
	call scanf
	
	mov ebx,0
	mov ecx, 40	;buat menyimpan counter
	mov edi, string1	;buat nyimpen string (esi,edi, dan al)
	mov eax, [cari]		;nah kalo scasb dia cuman bisa make angka atau char(al,ax,eax) dan string (edi)
	
telusuri:
	repne scasb			;repne : buat looping sampe ketemu yg sama dengan yg dicari kalo ga ada looping terus
						;scasb : buat bandingin satu satu
	add ebx,1
	cmp ecx, 0
	ja telusuri
	
	sub ebx, 1
	
	
	push ebx
	push print
	call printf
	jmp exit


exit:
	push 0
	call fflush
    mov eax, 1
    mov ebx, 0
    int 0x80
