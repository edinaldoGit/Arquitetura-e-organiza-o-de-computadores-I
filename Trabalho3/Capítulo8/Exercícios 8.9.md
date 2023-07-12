#  Resolução de exercícios - 8.9 

##  Questão 1

> Correção: 0,5

A) CORRETA.  
B) CORRETA.  
C) CORRETA.    
D) CORRETA.  
E) CORRETA.   
F) INCORRETA - Pois esses registradores são utilizados como ponteiros para locais de memória e, como sabemos, movimentações de memória para memória não são permitidas.   

## Questão 2

> Correção: 0,5

A) No final do segmento: EAX = 5.    
B) No final do segmento: EAX = 200.    
C) No final do segmento: EAX = 200.  
D) No final do segmento: EAX = 204.  
E) No final do segmento: EAX = 200.  
F) No final do segmento: EAX = 5.  
G) No final do segmento: EAX = 12.  
H) No final do segmento: EAX = 14.  

## Questão 3

> Correção: 0,2

A) 
```asm
mov num+0, 1
```  
B)
```asm
mov eax, x+8
mov x+4, eax
```
> Correção: nos itens abaixo, quais os valores iniciais de _ebx_ e _ecx_?

C)
```asm
mov eax, num[ebx]
mov num[ebx+4], eax 
```
D)
```asm
mov eax, z[ecx]
mov z[ebx], eax
```

## Questão 4

> Correção: 0,5

A) 5.  
B) 20.   
C) 10.   
D) 40.  
E) 3.  
F) 6.  

## Questão 5
*Resposta em código nos arquivos "questao5c.c" e "questao5.asm".*

## Questão 6
*Resposta em código nos arquivos "questao6_simp_c.c", "questao6_mod_c.c", "questao6_simp.asm" e "questao6_mod.asm".*

