#  Resolução de exercícios - 10.12

##  Questão 1
A)
```
Z = 8.
```
B)
```
Z = 5.
```
C)
```
Z = 4.
```
D) 
```
Z = 10.        
```

## Questão 2
A) Notação pós fixa:   
```
x y - z +
```
Instruções em Assembly:
```asm
fld x
fld y
fsub
fld z
fadd
fstp answer
```

B) Notação pós fixa:   
```
w x + y z - /
```
Instruções em Assembly:
```asm
fld w
fld x 
fadd 
fld y
fld z 
fsub
fdiv 
fstp result
```

C) Notação pós fixa:   
```
a b / c * d -
```
Instruções em Assembly:
```asm
fld a
fld b
fdiv 
fld c
fmul
fld d
fsub
fstp info 
```

D) Notação pós fixa:   
```
i j * k m n - / +
```
Instruções em Assembly:
```asm
fld i
fld j
fmul
fld k
fld m
fld n
fsub 
fdiv
fadd
fstp data
```


