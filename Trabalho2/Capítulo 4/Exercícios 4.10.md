# Dupla:
- Francisco Edinaldo dos Santos Silva   -    472729
- José Tiago Torres de Lima - 511943

#  Resolução de exercícios - 4.10 

##  Questão 1
A) INCORRETA - assim como em C, é incorreto uilizar apenas '=' para comparação entre dois valores, o certo seria '=='.  
B) INCORRETA - não é certo utilizar o 'then' após a comparação por diretivas.  
C) CORRETA - embora não usual, a sentença está sintaticamente CORRETA.  
D) INCORRETA - não é permitido usar o 'cmp' passando como parâmetros duas posições de memória.  

## Questão 2


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
