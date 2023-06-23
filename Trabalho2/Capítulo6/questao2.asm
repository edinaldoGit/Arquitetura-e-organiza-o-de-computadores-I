;  Correção: 0,5
;   Building Instructions:
;   ml /Cx /coff questao2.asm /link /SUBSYSTEM:console /out:questao2.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
            .686
            .model  flat, c 
            .stack  100h
printf      PROTO arg1:Ptr Byte, printlist:VARARG 
scanf       PROTO arg2:Ptr Byte, inputlist:VARARG
            .data
fmt_int     byte  "%d", 0                                         
fmt_str     byte  "%s", 0       
fmt_out1    byte  0AH, "%s%d%s%d", 0AH, 0
fmt_out2    byte  "%s%d", 0AH, 0

msg0        byte  0AH, "-----------------------------------------------------------------------------------", 0AH, 0                     
msg1        byte  "Letra A) Sentenca: answer = num - total / 32;", 0
msg2        byte  "answer = ", 0
msg3        byte  "num = ", 0
msg4        byte  ", total = ", 0

msg5        byte  "Letra B) Sentenca: result = (amount + number) * 4;", 0
msg6        byte  "result = ", 0
msg7        byte  "amount = ", 0
msg8        byte  ", number = ", 0

msg9        byte  "Letra C) Sentenca: x = y * 8 + z / 2;", 0
msg10       byte  "x = ", 0
msg11       byte  "y = ", 0
msg12       byte  ", z = ", 0

msg13       byte  "Letra D) Sentenca: a = a / 16 - b * 6;", 0
msg14       byte  "a = ", 0
msg15       byte  ", b = ", 0


; Variáveis da letra A)
answer      sdword  ?   
num         sdword  ? 
total       sdword  ? 

; Variáveis da Letra B)
result      sdword  ?
amount      sdword  ?
number      sdword  ?

; Variáveis da letra C)
x           sdword  ?
y           sdword  ?
z           sdword  ?

; Variáveis da letra D)
a           sdword  ?
b           sdword  ?

            .code
main        proc

            ; Atribuindo valores às variáveis para teste
            ;Letra A) 
            mov num, 50
            mov total, 200
            ;Letra B) 
            mov amount, 50
            mov number, 50
            ;Letra C)
            mov y, 50
            mov z, 50
            ;Letra D)
            mov a, 400
            mov b, 3

            ;Letra A) answer = num - total / 32;
            INVOKE printf, ADDR fmt_str, ADDR msg0
            INVOKE printf, ADDR fmt_str, ADDR msg1 
            INVOKE printf, ADDR fmt_out1, ADDR msg3, num, ADDR msg4, total
            mov eax, total
            shr eax, 5              ; Dividindo o 'total' em EAX por 32 
            mov ebx, num 
            sub ebx, eax 
            mov answer, ebx
            INVOKE printf, ADDR fmt_out2, ADDR msg2, answer
            ;------------------------------------------------------------------------------------------
            ;Letra B) result = (amount + number) * 4;
            INVOKE printf, ADDR fmt_str, ADDR msg0
            INVOKE printf, ADDR fmt_str, ADDR msg5
            INVOKE printf, ADDR fmt_out1, ADDR msg7, amount, ADDR msg8, number
            mov eax, amount
            add eax, number
            sal eax, 2              ; multiplica por 2
            mov result, eax 
            INVOKE printf, ADDR fmt_out2, ADDR msg6, result
            ;------------------------------------------------------------------------------------------
            ;Letra C) x = y * 8 + z / 2;
            INVOKE printf, ADDR fmt_str, ADDR msg0
            INVOKE printf, ADDR fmt_str, ADDR msg9
            INVOKE printf, ADDR fmt_out1, ADDR msg11, y, ADDR msg12, z
            mov eax, z          
            shr eax, 1              ; Dividindo o 'z' em EAX por 2
            mov ebx, y
            sal ebx, 3              ; Multiplicando 'y' em EBX por 8
            add ebx, eax
            mov x, ebx
            INVOKE printf, ADDR fmt_out2, ADDR msg10, x
            ;------------------------------------------------------------------------------------------
            ;Letra D) a = a / 16 – b * 6;
            INVOKE printf, ADDR fmt_str, ADDR msg0
            INVOKE printf, ADDR fmt_str, ADDR msg13
            INVOKE printf, ADDR fmt_out1, ADDR msg14, a, ADDR msg15, b
            mov eax, b 
            sal eax, 2              ; Multiplicando 'b' em EAX por 4                  
            mov ecx, b 
            sal ecx, 1              ; Multiplicando 'b' em EAX por 2
            add eax, ecx            ; Somando as duas mult, (b*4)+(b*2) = (b*6)
            mov ebx, a 
            shr ebx, 4              ; Dividindo 'a' em EBX por 4
            sub ebx, eax            ; Subtraindo (b*6) de (a/16) 
            mov a, ebx
            INVOKE printf, ADDR fmt_out2, ADDR msg14, a
            ret 
main        endp
end