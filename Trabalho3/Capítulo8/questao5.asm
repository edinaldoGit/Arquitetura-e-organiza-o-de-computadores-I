;   Building Instructions:
;   ml /Cx /coff questao5.asm /link /SUBSYSTEM:console /out:questao5.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
            .686
            .model   flat, c 
            .stack   100h
printf      PROTO    arg1:Ptr Byte, printlist:VARARG 
scanf       PROTO    arg2:Ptr Byte, inputlist:VARARG
            .data
fmt_int1    byte     "%d%s", 0
fmt_int2    byte     "%d", 0

fmt_str     byte     "%s", 0                                          

msg1        byte     "Array 2 apos a transferencia: ", 0
msg2        byte     ", ", 0
msg3        byte     "{", 0
msg4        byte     "}", 0

tam         sdword    20   
array1      sdword    1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20
array2      sdword    20 dup(?)
  
            .code
main        proc

            ; O Array 1 é incializado com 20 inteiros de 1 a 20
            ; O Array 2 possui 20 posições não inicializadas.

            ; Já que não especifica na questão como deve ser inicializado o array,  
            ; escolhemos inicializar na montagem.

            ; Fazendo a transferência de elementos do array1 para o array2
            mov ecx, tam
            lea esi, array1+0
            lea edi, array2+0
           .repeat 
                mov eax, [esi] 
                mov [edi], eax 
                add edi, 4 
                add esi, 4
           .untilcxz 

           ; Imprimindo array2 após realizar a transferência de elementos. 
           INVOKE printf, ADDR fmt_str, ADDR msg1
           INVOKE printf, ADDR fmt_str, ADDR msg3

            mov ecx, tam
            lea esi, array2
            mov ebx, 1
           .repeat 
                mov eax, [esi]
                .if ebx == tam ; verificação básica se o elemento é o último pra não imprimir vírgula no final do elemento
                    push ecx
                    INVOKE printf, ADDR fmt_int2, eax  
                    pop ecx
                .else
                    push ecx
                    push ebx
                    INVOKE printf, ADDR fmt_int1, eax, ADDR msg2
                    pop ebx
                    pop ecx
                    add esi, 4
                .endif
                inc ebx
            .untilcxz

            INVOKE printf, ADDR fmt_str, ADDR msg4 

            ret 
main        endp
end