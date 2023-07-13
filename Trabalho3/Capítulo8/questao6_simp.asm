;   Building instructions:
;   ml /Cx /coff questao6_simp.asm /link /SUBSYSTEM:console /out:questao6_simp.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
            .686
            .model  flat, c 
            .stack  100h
printf      PROTO   arg1:Ptr Byte, printlist:VARARG 
scanf       PROTO   arg2:Ptr Byte, inputlist:VARARG
            .data
fmt_str     byte    "%s", 0
fmt_int1    byte    "%d%s", 0
fmt_int2    byte    "%d", 0

msg1        byte    "Array Atual: ", 0
msg2        byte    0AH, "Array ordenado: ", 0
msg3        byte    "{", 0
msg4        byte    ", ", 0 
msg5        byte    "}", 0

array       sdword  4, 5, 3, 2, 1, 10, 9, 8, 7, 6
tam         sdword  10
temp        sdword  ?

            .code
main        proc

            INVOKE printf, ADDR fmt_str, ADDR msg1
            call PrintArray

            call BubbleSort

            INVOKE printf, ADDR fmt_str, ADDR msg2
            call PrintArray
            
            ret
main        endp

BubbleSort  proc
            mov ecx, tam
            dec ecx
            lea esi, array + 0

            .repeat
                push ecx
                push esi
                mov edi, esi
                add edi, 4

                .repeat
                    mov eax, [esi]
                    cmp [edi], eax
                    jge PulaTroca
                    mov esi, edi

                PulaTroca:
                    add edi, 4
                .untilcxz

                mov edi, esi
                pop esi
                mov eax, [esi]
                xchg eax, [edi]
                mov [esi], eax
                add esi, 4
                pop ecx
            .untilcxz

            ret
BubbleSort  endp

PrintArray  proc 
            INVOKE printf, ADDR fmt_str, ADDR msg3

            mov ecx, tam
            lea esi, array+0
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
                    INVOKE printf, ADDR fmt_int1, eax, ADDR msg4
                    pop ebx
                    pop ecx
                    add esi, 4
                .endif
                inc ebx
            .untilcxz

            INVOKE printf, ADDR fmt_str, ADDR msg5
            ret
PrintArray  endp
            end