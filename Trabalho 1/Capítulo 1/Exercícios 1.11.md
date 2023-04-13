# Dupla:
- Francisco Edinaldo dos Santos Silva   -    472729
- José Tiago Torres de Lima - 511943

#  Resolução de exercícios - 1.11 

##  Questão 1 
A) CORRETA  
B) INCORRETA  
C) CORRETA  
D) CORRETA  
E) CORRETA  
F) INCORRETA

## Questão 2
A) 
```asm
.data 
initial byte ?
```
B)
```asm
.data 
grade byte 'b'
```
C)
```asm
.data 
x byte 'P'
y byte 'Q'

```
D)
```asm
.data 
amount sdword ?
```
E) 
```asm
.data 
count sdword 0
```
F) 
```asm
number sdword -396
```
## Questão 3
A) INCORRETA, a instrução 'move' não é reconhecida como uma instrução do assembly.    
B) INCORRETA, não é permitido mover o conteúdo de uma posição de memória para outra posição de memória, pois se tornaria um processo muito lento fazer dois acessos à memória em uma instrução.  
C) CORRETA.  
D) CORRETA.  
E) INCORRETA, não é permitido mover o conteúdo de uma posição de memória para um imediato.  
F) CORRETA.    
G) INCORRETO, é sintaticamente incorreto utilizar o '-' para negar o conteúdo de um registrador.

## Questão 4
A)
```asm
mov i, 1 
```
B)
```asm
mov EAX, y
mov x, EAX
```
C)
```asm
mov c, 2
mov EAX, c
mov b, EAX
mov EAX, b
mov a, EAX
```
D)
```asm
mov y, 1
mov EAX, y
mov x, EAX
```
E) 
```asm
mov a, 1
mov b, 2
mov EAX, a
mov c, EAX
mov EAX, b
mov a, EAX
mov EAX, c
mov b, EAX
```

## Questão 5
A)
```asm
mov a, 'B'
```
B) 
```asm 
mov AL, c
mov b, AL
```
C) 
```asm
mov d, 'E'
mov Al, d 
mov e, AL
```
D)
```asm
mov a, '2'
mov b, '?'
mov AL, b
mov a, AL
```
