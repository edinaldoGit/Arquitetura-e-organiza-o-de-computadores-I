; Correção: 0,9. Coloquei todas as strings como 8888888888 e a última não foi detectada como palindromo.
;Building Instructions:
;ml /Cx /coff questao3.asm /link /SUBSYSTEM:console /out:questao3.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
            .686
            .model flat, c
            .stack 100h
printf      PROTO arg1:Ptr Byte, printlist:VARARG
scanf       PROTO arg2:Ptr Byte, inputlist:VARARG

            .data
msg1fmt     byte "%s%s", 0AH, 0

msg1        byte " -> Palindromo. ", 0AH, 0
msg2        byte " -> Nao Palindromo. ", 0AH, 0

string      byte "8888888888 8888888888 8888888888 8888888888 8888888888 8888888888 8888888888 8888888888 8888888888 8888888888", 0

t           byte 10 dup(?), 0
e           sdword 10
k           sdword  ?

            .code
main        proc
            mov ecx, e
            lea ebx, string
            add ebx, sizeof string
            lea esi, string

            .repeat
                    push ecx
                    lea edi, t
                    mov al, " "
                    .while [esi] != al && esi <= ebx
                            mov ah, [esi]
                            mov [edi], ah
                            inc esi
                            inc edi
                     .endw 
                    call Palindromo
                    pop ecx
                    inc esi
            .untilcxz

            ret
main        endp

Palindromo  proc
            pushad
            mov eax, e
            mov ebx, 2
            cdq
            idiv ebx
            mov ebx, eax
            lea esi, t
            mov edi, esi
            mov eax, e
            dec eax
            add edi, eax
            mov ecx, 0
            mov al, [esi]

            .while [edi]  == al && ecx < ebx
                    inc ecx
                    inc esi
                    dec edi
                    mov al, [esi]
            .endw

            .if ecx == ebx
                    INVOKE printf, ADDR msg1fmt, ADDR t, ADDR msg1
            .else 
                    INVOKE printf, ADDR msg1fmt, ADDR t, ADDR msg2
            .endif 

            popad
            ret
Palindromo endp
           end 