#  Resolução de exercícios - 8.9 

##  Questão 1

A) INCORRETA - Em vez de 'movesb' o certo seria 'movsb'.  
B) CORRETA.    
C) CORRETA.    
D) CORRETA.    
E) INCORRETA - Em vez de 'rept strsb' o certo seria 'rep stosb'.  
F) INCORRETA - Em vez de 'loadsb' o certo seria 'lodsb'.      

## Questão 2
A) 
```
ECX = 2, ESI = indefinido, EDI = 103, AL = "c".
```

B) De acordo com o livro, a instrução 'lodsb' é equivalente a:
```asm
mov [esi], al
inc esi
```
Nesse caso, como não temos nenhuma ocorrência de 'al' nas declarações da letra B, não temos como definir o que seria movido para [esi]. Portanto os registradores em questão ficariam nos seguintes estados:   
```
ECX = indefinido, ESI = indefinido, EDI = indefinido , AL = indefinido.  
```

C) 
```
ECX = 1, ESI = 104, EDI = 109, AL = indefinido.
```

D) 
```
ECX = 4, ESI = 101, EDI = 106, AL = indefinido.  
```

E)
```
ECX = indefinido, ESI = indefinido, EDI = 106, AL = "a", string2 = "abcyz".  
```

## Questão 3
Resposta em código no arquivo "questao3.asm".


