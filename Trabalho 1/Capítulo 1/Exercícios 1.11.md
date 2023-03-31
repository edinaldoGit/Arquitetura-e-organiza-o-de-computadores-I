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
```
.data 
initial byte ?
```
B)
```
.data 
grade byte 'b'
```
C)
```
.data 
x byte 'P'
y byte 'Q'

```
D)
```
.data 
amount sdword ?
```
E) 
```
.data 
count sdword 0
```
F) 
```
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
```
mov i, 1 
```
B)
```
mov EAX, y
mov x, EAX
```
C)
```
mov c, 2
mov EAX, c
mov b, EAX
mov EAX, b
mov a, EAX
```
D)
```
mov y, 1
mov EAX, y
mov x, EAX
```
E) 
```
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
```
mov a, 'B'
```
B) 
``` 
mov AL, c
mov b, AL
```
C) 
```
mov d, 'E'
mov Al, d 
mov e, AL
```
D)
```
mov a, '2'
mov b, '?'
mov AL, b
mov a, AL
```
