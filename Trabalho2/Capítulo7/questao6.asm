;   Correção: 1,0
;   Building Instructions:
;   ml /Cx /coff questao6.asm /link /SUBSYSTEM:console /out:questao6.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
;  
            .686
            .model   flat, c 
            .stack   100h
printf      PROTO    arg1:Ptr Byte, printlist:VARARG 
scanf       PROTO    arg2:Ptr Byte, inputlist:VARARG
            .data
fmt_int     byte     "%d", 0
                                   
fmt_str    byte     "%s%d", 0AH, 0    

msg1        byte     " - Testando multiplicacao: ", 0 

            .code
MULTACC     macro   operand
            push ebx ;; salvando EBX e ECX
            push ecx
            mov ebx, eax ;; Movendo acumulador(EAX) para EBX
            mov ecx, operand ;; Carregando ECX com o operando
    
            if operand NE 0 ;; Se operando for diferente de 0
                if operand NE 1 ;; Se operando for diferente de 1
                    mov eax, 0 ;; Limpando acumulador atual para zero
                    if operand LT 0 ; Se operando for negativo 
                        neg ecx ;; transformando ECX em positivo
                    endif
                    .while ecx > 0
                        add eax, ebx ;; Adição repetitiva
                        dec ecx ;; Decrementa ECX
                    .endw
                    if operand LT 0 ;; Se operando negativo
                        neg eax ;; Nega o acumulador 
                    endif
                endif
            else 
                mov eax, 0 ;; Se operando for 0 zeramos o acumulador, pois multiplicação por zero resulta em 0 
            endif
    
            pop ecx ;; Desempilhando ECX e EBX
            pop ebx
            endm

main        proc       
            ; Testando a macro 
            mov eax, 10
            MULTACC 0
            ;MULTACC 1
            ;MULTACC 5

            INVOKE printf, ADDR fmt_str, ADDR msg1, eax

            ret 
main        endp
end

