;
;   Building Instructions:
;   ml /Cx /coff questao3.asm /link /SUBSYSTEM:console /out:questao3.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
;
            .686
            .model flat, c
            .stack 100h

printf      PROTO arg1:Ptr Byte, printlist:VARARG
scanf       PROTO arg2:Ptr Sdword, inputlist:VARARG
            .data

msg1fmt     byte "%s %s", 0Ah, 0
msg2fmt     byte "%s",0Ah, 0
msg3fmt     byte "%d",0Ah,0
msg1        byte "Palindromo. ",0
msg2        byte " Nao Palindromo. ",0

string      byte "2222222222 araraarara 1125486987 1235689745 2012369875 12345689+9 2012536987 2102365897 8888888888 202252202", 0

t           byte "123456789", 0
e           sdword 10
k           sdword  ?
            .code
main        proc
            mov ecx, e
            lea ebx, string
            add ebx, sizeof string
            lea esi, string

FOR1:       .repeat
            push ecx
            lea edi, t
            mov al, " "
WHILE01:    .while [esi] != al && esi <= ebx
            mov ah, [esi]
            mov [edi], ah
            inc esi
            inc edi
ENDW01:     .endw 
            call Palindromo
            pop ecx
            inc esi
ENDFOR1:    .untilcxz
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
WHILE02:    .while [edi]  == al && ecx < ebx
            inc ecx
            inc esi
            dec edi
            mov al, [esi]
ENDW02:     .endw
IF01:        .if ecx == ebx
            INVOKE printf, ADDR msg1fmt, ADDR t, ADDR msg1
            .else 
            INVOKE printf, ADDR msg1fmt, ADDR t, ADDR msg2
ENDIF01:    .endif 
            popad
            ret
Palindromo endp
           end 
