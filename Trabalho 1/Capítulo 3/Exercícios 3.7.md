# Dupla:
- Francisco Edinaldo dos Santos Silva   -    472729
- José Tiago Torres de Lima - 511943

#  Resolução de exercícios - 2.7 

##  Questão 1 
A) INCORRETA. A instrução "inc" se trata de um operador unário, ou seja, só permite um único argumento, que pode ser um registrador ou uma variável.  
B) CORRETA.  
C) INCORRETA. A instrução "add" não permite que os dois argumentos sejam posições de memória, pois não é viável fazer dois acessos a memória em uma mesma instrução.  
D) INCORRETA. A instrução "idiv" não permite um imediato como argumento, apenas registradores e posições de memória(variáveis).  
E) INCORRETA. Na instrução "sub", não é permitido um imediato no minuendo, ou seja, no primeiro argumento da instrução.  
F) CORRETA. 

## Questão 2
A)
```asm
mov eax,3
imul number
mov product,eax
```
B)
```asm
mov eax, number
cdq
idiv amount
mov result, eax
```
C)
```asm
mov eax,number
mov ebx,2
cdq
idiv ebx
mov answer,eax
```
D)
```asm
mov eax, 4
sub eax, number  
mov difference, eax
```

## Questão 3
A)
```asm
mov eax, x
imul y
mov ebx, eax
mov eax, 2
imul z
add eax, ebx
mov x, eax
```
B)
```asm
mov eax, c
cdq 
mov ebx, 3
idiv ebx
sub b, eax
mov eax, b
mov a, eax
```
*Obs.: Foi utilizado o "c" como rótulo para variável seguindo a sentença que estava no livro, no entanto, se executarmos esse código dessa maneira, utilizando "c" como rótulo, é possível que dê algum conflito com alguma palavra reservada ou algo do tipo. Desse modo, em caso de uma possível execução desse trecho de código, é indicado que altere "c" para algum outro rótulo que esteja disponível.*  

C)
```asm
mov eax, num3
imul num4
mov ebx, eax
mov eax, num1
cdq
idiv num2
sub eax, ebx
mov total, eax
```  
D)
```asm
mov eax, s
neg eax
inc t
add eax, t
mov r, eax
```
E)
```asm
mov eax, i
sub eax, j
mov ebx, eax
mov eax, k 
imul ebx
imul n
mov m, eax
```
F)
```asm
mov eax, f 
cdq
idiv d 
imul e 
mov ebx, a 
sub ebx, b 
add ebx, eax
mov q, ebx
```

## Questão 4
A)
```asm
dec i
```
B)
```asm
inc k
mov eax, k
sub eax, m
mov j, eax
```

C)
```asm
inc k
mov eax, k
sub eax, m
mov j, eax

```
D)
```asm
mov eax, x
add eax, y
neg eax
mov z, eax
```
E)
```asm
```
F)
```asm
mov eax, y
neg eax
mov ebx, z
dec ebx
mov z, ebx
add eax, ebx
mov x, eax

```
## Questão 5
*Resposta em código no arquivo "questao5.asm".*

## Questão 6

## Questão 7
*Resposta em código no arquivo "questao7.asm".*

