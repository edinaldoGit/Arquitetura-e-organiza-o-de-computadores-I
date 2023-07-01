;   Correção: 0,1
;   Building Instructions:
;   ml /Cx /coff questao3.asm /link /SUBSYSTEM:console /out:questao3.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
;  
            .686
            .model   flat, c 
            .stack   100h
printf      PROTO    arg1:Ptr Byte, printlist:VARARG 
scanf       PROTO    arg2:Ptr Byte, inputlist:VARARG
            .data
fmt_int     byte     "%d", 0
fmt_int1    byte     " %d ", 0

fmt_str1    byte     "%s", 0                                         
fmt_str2    byte     "%s%d%s", 0AH, 0    

msg1        byte     " * Digite o numero de termos da sequencia de fibonacci -> ", 0
msg2        byte     " - Sequencia de FIBONACCI com  ", 0
msg3        byte     " termo(s): ", 0
msg4        byte     0AH, " FIBONACCI - USANDO PROCEDIMENTO ", 0AH, 0 

n           dword    ?   
termo1      dword    ?  
termo2      dword    ?
prox_term   dword    ?
i           dword    ?    

            .code
main        proc

            INVOKE printf, ADDR fmt_str1, ADDR msg4

            ; Recebendo a quantidade de termos da sequência pelo usuário
            INVOKE printf, ADDR fmt_str1, ADDR msg1
            INVOKE scanf, ADDR fmt_int, ADDR n          

            call FIBONACCI

            ret 
main        endp

FIBONACCI   proc 
            pushad

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
            popad

            ret 
FIBONACCI   endp 
            end