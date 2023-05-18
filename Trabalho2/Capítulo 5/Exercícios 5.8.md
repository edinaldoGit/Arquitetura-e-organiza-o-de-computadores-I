#  Resolução de exercícios - 5.8 

##  Questão 1
A) INCORRETA - A estrutura '.for - .endfor' não existe no MASM.  
B) INCORRETA - A diretiva (while) está incompleta, em vez de 'while' apenas, deveria ser '.while'.  
C) CORRETA.  
D) INCORRETA - O Registrador EDX nesse caso não pode ser utilizado como iterador, o certo seria utilizar ECX da seguinte forma: '.untilcxz' e a iteração seria feita de acordo com o valor em ECX.   
E) INCORRETA - A estrutura '.do - .while' não existe no MASM como no C, o equivalente a isso seria '.repeat - .until'. 

## Questão 2
```asm
mov ans, 0 
if01:       cmp x, 0
            je endif01
then01:     mov ecx, 1
            while01:    cmp ecx, y
                        jg endw01
                        mov eax, ans 
                        add eax, x
                        mov ans, eax 
                        inc ecx  
                        jmp while01     
            endw01:     nop
            mov i, ecx 
endif01:    nop 
```

## Questão 3
A) **Três** vezes.  
B) **Uma única** vez.  
C) **Nenhuma** vez.  

## Questão 4
```asm
mov ans, 0
if01:       cmp y, 0
            je endif01   
then01:     mov ecx, 1
            repeat01:       mov eax, ans
                            add eax, x
                            mov ans, eax
                            inc ecx
                            cmp ecx, y
                            jle repeat01
            endrpt01: nop
            mov i, ecx
endif01:    nop
```

## Questão 5
A) .while: 
```asm 
mov edx, eax
mov eax, 0
.while  edx >= ebx
        sub edx, ebx
        inc eax 
.endw
```
B)  .repeat - .until: 
```asm
mov edx, eax
mov eax, 0
.if edx >= ebx
    .repeat 
            sub edx, ebx
            inc eax
    .until  edx < ebx
.endif
```

C) .repeat - .repeatcxz: 
```asm
mov edx, eax
mov ecx, eax 
mov eax, 0

.repeat 
    .if edx >= ebx
            sub edx, ebx 
            inc eax
    .endif
.untilcxz  
```

## Questão 6
> Tiago

## Questão 7
- Usando diretiva '.repeat - .until':
```asm
mov i, 10
mov sum, 0          
.repeat   
        mov eax, sum
        add eax, i 
        sub i, 2 
        mov sum, eax 
.until i <= 0
 ```
- Usando comparadores, rótulos e saltos condicionais/incondicionais:
```asm
mov i, 10
mov sum, 0

repeat01: 
            mov eax, sum 
            add eax, i
            mov sum, eax 
            sub i, 2
            cmp i, 0
            jg repeat01
endrpt01:   nop      
```
## Questão 8
```asm
mov ecx, 2
for01:  nop
        mov tempecx, ecx
        mov ecx, 3
        for02:  nop
            ; body of nested loop 
            loop for02
        endfor02:   nop
        mov ecx, tempecx
        loop for01
endfor01: nop
```

## Questão 9
A)  Implementação do item no arquivo 'questao9.asm'
B)  Implementação do item no arquivo 'questao9.asm'
C)  Implementação do item no arquivo 'questao9.asm'

## Questão 10
A)  
B)  
C)  

> Tiago 
