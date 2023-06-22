;  Correção: 1,0 
;  Building Instructions:
;   ml /Cx /coff questao10.asm /link /SUBSYSTEM:console /out:questao10.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
;  
            .686
            .model   flat, c 
            .stack   100h
printf      PROTO    arg1:Ptr Byte, printlist:VARARG 
scanf       PROTO    arg2:Ptr Byte, inputlist:VARARG
            .data
fmt_int     byte     "%d", 0
fmt_int1    byte     "%d ", 0

fmt_str1    byte     "%s", 0                                         
fmt_str2    byte     "%s%d%s", 0AH, 0  
fmt_str3    byte     "%s%d%s%d", 0AH, 0AH, 0      
fmt_str4    byte     "%s", 0AH, 0  
fmt_str5    byte     0AH, "%s", 0   

msg1        byte     " * Digite o numero de termos da sequencia de fibonacci -> ", 0
msg2        byte     "Sequencia de FIBONACCI com  ", 0
msg3        byte     " termo(s): ", 0
msg4        byte     "--------------------------------------------------------------------------------",0AH, 0
msg5        byte     "                        *** FIBONACCI Usando .while ***                         ", 0
msg6        byte     "                     *** FIBONACCI Usando .repeat - .until ***                  ", 0
msg7        byte     "                   *** FIBONACCI Usando .repeat - .untilcxz ***                 ", 0

n           dword    ?   
termo1      dword    ?  
termo2      dword    ?
prox_term   dword    ?
i           dword    ?
varTemp     dword    ?        
            .code
main        proc
            ; Recebendo a quantidade de termos da sequência pelo usuário
            INVOKE printf, ADDR fmt_str1, ADDR msg1
            INVOKE scanf, ADDR fmt_int, ADDR n

            ;--------------------------------------------------------------------------------------------
            ; Implementação com '.while':
            INVOKE printf, ADDR fmt_str1, ADDR msg4
            INVOKE printf, ADDR fmt_str4, ADDR msg5
            INVOKE printf, ADDR fmt_str1, ADDR msg4
            ;--------------------------------------------------------------------------------------------
            .if n <= 0
                jmp endFib01
            .endif

            mov termo1, 0
            mov termo2, 1

            INVOKE printf, ADDR fmt_str2, ADDR msg2, n, ADDR msg3

            .if n >= 1
                INVOKE printf, ADDR fmt_int1, termo1
            .endif

            .if n >= 2
                INVOKE printf, ADDR fmt_int1, termo2
            .endif
            
            mov ebx, n
            mov i, 3
            
            .while  i <= ebx
                    mov eax, termo1
                    add eax, termo2
                    mov prox_term, eax 
                    INVOKE printf, ADDR fmt_int1, prox_term
                    mov eax, termo2 
                    mov termo1, eax 
                    mov eax, prox_term
                    mov termo2, eax
                    inc i                    
            .endw

            endFib01: nop

            ;--------------------------------------------------------------------------------------------
            ; Implementação com '.repeat - .until':
            INVOKE printf, ADDR fmt_str5, ADDR msg4
            INVOKE printf, ADDR fmt_str4, ADDR msg6
            INVOKE printf, ADDR fmt_str1, ADDR msg4
            ;--------------------------------------------------------------------------------------------
            .if n <= 0
                jmp endFib02
            .elseif n <= 2
                mov termo1, 0
                mov termo2, 1

                INVOKE printf, ADDR fmt_str2, ADDR msg2, n, ADDR msg3

                .if n >= 1
                    INVOKE printf, ADDR fmt_int1, termo1
                .endif

                .if n == 2
                    INVOKE printf, ADDR fmt_int1, termo2
                .endif
            .elseif n > 2
                mov termo1, 0
                mov termo2, 1

                INVOKE printf, ADDR fmt_str2, ADDR msg2, n, ADDR msg3

                .if n >= 1
                    INVOKE printf, ADDR fmt_int1, termo1
                .endif

                .if n >= 2
                    INVOKE printf, ADDR fmt_int1, termo2
                .endif 

                mov ebx, n
                mov i, 3
                .repeat 
                        mov eax, termo1
                        add eax, termo2
                        mov prox_term, eax 
                        INVOKE printf, ADDR fmt_int1, prox_term
                        mov eax, termo2 
                        mov termo1, eax 
                        mov eax, prox_term
                        mov termo2, eax
                        inc i           
                .until i > ebx
            .endif

            endFib02: nop

            ;--------------------------------------------------------------------------------------------
            ; Implementação com '.repeat - .untilcx':
            INVOKE printf, ADDR fmt_str5, ADDR msg4
            INVOKE printf, ADDR fmt_str4, ADDR msg7
            INVOKE printf, ADDR fmt_str1, ADDR msg4
            ;--------------------------------------------------------------------------------------------
            .if n <= 0
                jmp endFib03
            .elseif  n <= 2
                mov termo1, 0
                mov termo2, 1

                INVOKE printf, ADDR fmt_str2, ADDR msg2, n, ADDR msg3

                .if n >= 1
                    INVOKE printf, ADDR fmt_int1, termo1
                .endif

                .if n == 2
                    INVOKE printf, ADDR fmt_int1, termo2
                .endif

            .elseif n > 2
                mov termo1, 0
                mov termo2, 1

                INVOKE printf, ADDR fmt_str2, ADDR msg2, n, ADDR msg3

                .if n >= 1
                    INVOKE printf, ADDR fmt_int1, termo1
                .endif

                .if n >= 2
                    INVOKE printf, ADDR fmt_int1, termo2
                .endif
            
                mov ecx, n
                .repeat 
                        mov eax, termo1
                        add eax, termo2
                        mov prox_term, eax 
                        mov varTemp, ecx
                        INVOKE printf, ADDR fmt_int1, prox_term
                        mov ecx, varTemp
                        mov eax, termo2 
                        mov termo1, eax 
                        mov eax, prox_term
                        mov termo2, eax      

                        .if ecx == 3
                            jmp endFib03   
                        .endif
                .untilcxz
            .endif

            endFib03: nop
            
            ret 
main        endp
end
