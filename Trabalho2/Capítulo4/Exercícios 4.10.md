#  Resolução de exercícios - 4.10 

> Correção: 1,5

##  Questão 1

> Correção: 0,3

A) INCORRETA - assim como em C, é incorreto utilizar apenas '=' para comparação entre dois valores, o certo seria '=='.  
B) INCORRETA - não é certo utilizar o 'then' após a comparação por diretivas.  
C) CORRETA - embora não usual, a sentença está sintaticamente CORRETA.  
D) INCORRETA - não é permitido usar o 'cmp' passando como parâmetros duas posições de memória.  

## Questão 2

> Correção: 0,3

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

> Correção: 0,3

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

> Correção: && tem prioridade maior que ||.

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

> Correção: 0,3

A) Através de diretivas MASM:
```asm
mov eax, a 
.if eax <= b
        mov eax, b
        .if eax < c 
                mov eax, c
                .if eax <= d 
                        mov ebx, 2
                        mov eax, d
                        cdq
                        idiv ebx
                        mov d, eax
                .else 
                        add eax, d
                        mov c, eax
                .endif
        .else 
                sub b, 2
        .endif
.else 
        dec a
.endif
```
B) Através de comparadores, rótulos e saltos condicionais/incondicionais:

```asm
mov eax, a
if01:   cmp eax, b 
        jg else01
then01: mov eax, b
        if02:   cmp eax, c_
                jge else02
        then02: mov eax, c_
                if03:   cmp eax, d
                        jg else03
                then03: mov ebx, 2
                        mov eax, d
                        cdq
                        idiv ebx
                        mov d, eax
                        jmp endif01
                else03: add eax, d
                        mov c_, eax
                        jmp endif01
        else02: sub b, 2
                jmp endif01
else01: dec a
endif01: nop
```

## Questão 5

> Correção: 0,3

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

*Resposta em código nos arquivos 'questao6.asm' e 'questao6.c'.* 
