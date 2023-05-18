;   Building Instructions:
;   ml /Cx /coff questao9.asm /link /SUBSYSTEM:console /out:questao9.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
;  
            .686
            .model   flat, c 
            .stack   100h
printf      PROTO    arg1:Ptr Byte, printlist:VARARG 
scanf       PROTO    arg2:Ptr Byte, inputlist:VARARG
            .data
fmt_int     byte     "%d", 0
fmt_str1    byte     "%s", 0                                         
fmt_str2    byte     "%s%d%s", 0AH, 0  
fmt_str3    byte     "%s%d%s%d", 0AH, 0AH, 0      
fmt_str4    byte     "%s", 0AH, 0     
          
msg1        byte     " * Digite um numero inteiro nao negativo -> ", 0
msg2        byte     "O FATORIAL de ", 0
msg3        byte     " eh: ", 0
msg4        byte     "--------------------------------------------------------------------------------", 0AH, 0
msg5        byte     "                        *** FATORIAL Usando .while ***", 0
msg6        byte     "                     *** FATORIAL Usando .repeat - .until ***", 0
msg7        byte     "                   *** FATORIAL Usando .repeat - .untilcxz ***", 0

n           dword    ?   
result      dword    ?
            .code
main        proc

            INVOKE printf, ADDR fmt_str1, ADDR msg1
            INVOKE scanf, ADDR fmt_int, ADDR n

            ;--------------------------------------------------------------------------------------------
            ; Implementação com '.while':
            INVOKE printf, ADDR fmt_str1, ADDR msg4
            INVOKE printf, ADDR fmt_str4, ADDR msg5
            INVOKE printf, ADDR fmt_str1, ADDR msg4
            ;--------------------------------------------------------------------------------------------
            mov ecx, 1
            mov result, 1
            .while  ecx <= n
                    mov eax, result 
                    imul ecx
                    mov result, eax
                    inc ecx
            .endw

            INVOKE printf, ADDR fmt_str3, ADDR msg2, n, ADDR msg3, result

            ;--------------------------------------------------------------------------------------------
            ; Implementação com '.repeat - .until':
            INVOKE printf, ADDR fmt_str1, ADDR msg4
            INVOKE printf, ADDR fmt_str4, ADDR msg6
            INVOKE printf, ADDR fmt_str1, ADDR msg4
            ;--------------------------------------------------------------------------------------------
            mov ecx, 1
            mov result, 1

            .repeat 
                    mov eax, result 
                    imul ecx 
                    mov result, eax
                    inc ecx
            .until ecx > n

            INVOKE printf, ADDR fmt_str3, ADDR msg2, n, ADDR msg3, result

            ;--------------------------------------------------------------------------------------------
            ; Implementação com '.repeat - .untilcxz':
            INVOKE printf, ADDR fmt_str1, ADDR msg4
            INVOKE printf, ADDR fmt_str4, ADDR msg7
            INVOKE printf, ADDR fmt_str1, ADDR msg4
            ;--------------------------------------------------------------------------------------------
            mov ecx, n
            mov ebx, 1
            mov result, 1

            .if ecx != 0
                .repeat 
                        mov eax, result 
                        imul ebx 
                        mov result, eax
                        inc ebx
                .untilcxz
            .endif

            INVOKE printf, ADDR fmt_str3, ADDR msg2, n, ADDR msg3, result

            ret 
main        endp
end
