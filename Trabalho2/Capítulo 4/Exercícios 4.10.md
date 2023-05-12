#  Resolução de exercícios - 4.10 

##  Questão 1
A) INCORRETA - assim como em C, é incorreto utilizar apenas '=' para comparação entre dois valores, o certo seria '=='.  
B) INCORRETA - não é certo utilizar o 'then' após a comparação por diretivas.  
C) CORRETA - embora não usual, a sentença está sintaticamente CORRETA.  
D) INCORRETA - não é permitido usar o 'cmp' passando como parâmetros duas posições de memória.  

## Questão 2
```asm
mov eax, a
.if eax > b
    dec a
.else 
    mov eax, b
    .if eax >= c
        sub b, 2
    .else 
        mov eax, c
        .if eax > d
            add eax, d
            mov c, eax
        .else 
            mov ebx, 2
            mov eax, d
            cdq
            idiv ebx
            mov d, eax
        .endif 
    .endif
.endif
```

## Questão 3

A)
```asm
if01:      cmp w, 1 
           jne endif01
           cmp x, 2
           jne endif01
then01:    dec y
endif01:   nop
```

B) 
```asm
if01:      cmp num, 0
           jle then01
           cmp num, 3
           jle endif01
then01:    sub count, 2
endif01:   nop
```

C) 
```asm
if01:      cmp w, 1
           je and01
           cmp x, 2
           jne endif01
and01:     cmp y, 3
           jne endif01
then01:    inc z
endif01:   nop
```

D)
```asm
if01:       cmp d, 4
            jle then01
            cmp a, 1
            je then01
            cmp b, 2
            jne endif01
            cmp c, 3
            jle endif01
then01:     dec e
endif01:    nop
```

## Questão 4
A) Por diretivas MASM:
```asm
mov eax, a
mov ebx, b
mov ecx, c
.if eax > b
    dec a 
.elseif ebx >= c 
    sub b, 2
.elseif ecx > d 
    add ecx, d 
    mov c, ecx 
.else 
    mov ebx, 2
    mov eax, d
    cdq
    idiv 2
    mov d, eax
.endif
```
B) 

## Questão 5
```asm
switch01:       cmp number, 0
                je case0
                cmp number, 1
                je case1
                cmp number, 2
                je case2
                cmp number, 3
                je case3
                jmp endswitch01
case0:       
case1:          add count, 2
                jmp endswitch01         
case2:   
case3:          sub count, 2
                jmp endswitch01    
endswitch01:    nop
```

## Questão 6

> Tiago
