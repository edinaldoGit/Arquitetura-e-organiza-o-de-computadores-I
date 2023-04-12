# Dupla:
- Francisco Edinaldo dos Santos Silva   -    472729
- José Tiago Torres de Lima - 511943

#  Resolução de exercícios - 2.7 

##  Questão 1 
A) INCORRETA. A intrução "inc" se trata de um operador unário, ou seja, só permite um único argumento, que pode ser um registrador ou uma variável.  
B) CORRETA.  
C) INCORRETA. A instrução "add" não permite que os dois argumentos sejam posições de memória, pois não é viável fazer dois acessos a memória em uma mesma instrução.  
D) INCORRETA. A instrução "idiv" não permite um imediato como argumento, apenas registradores e posições de memória(variáveis).  
E) INCORRETA. Na instrução "sub", não é permitido um imediato no minuendo, ou seja, no primeiro argumento da instrução.  
F) CORRETA. 

## Questão 2


## Questão 3
A)
```
mov eax, x
imul y
mov ebx, eax
mov eax, 2
imul z
add eax, ebx
mov x, eax
```
B)
```
mov eax, c
cdq 
mov ebx, 3
idiv ebx
sub b, eax
mov eax, b
mov a, eax
```
*OBS: Foi utilizado o "c" como rótulo para variável seguindo a sentença que estava no livro, no entanto, se executarmos esse código dessa maneira, utilizando "c" como rótulo, é possível que dê algum conflito com alguma palavra reservada ou algo do tipo, desse modo, em caso de uma possível execução desse trecho de código, é indicado que altere "c" para algum outro rótulo que esteja disponível.*  

C)
```
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
```
mov eax, s
neg eax
inc t
add eax, t
mov r, eax
```
E)
```
```
F)
```
```

## Questão 4

## Questão 5

## Questão 6

## Questão 7


