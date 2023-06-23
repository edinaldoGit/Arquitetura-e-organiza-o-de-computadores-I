;   Correção: 0,4. O exemplo do Programa completo no livro faz a leitura de um número hexadecimal com scanf. Por que vocês fizeram os casos na mão?
;   Building Instructions:
;   ml /Cx /coff questao5.asm /link /SUBSYSTEM:console /out:questao5.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
            .686
            .model  flat, c 
            .stack  100h
printf      PROTO arg1:Ptr Byte, printlist:VARARG 
scanf       PROTO arg2:Ptr Byte, inputlist:VARARG
            .data

fmt_out     byte "%s", 0

msg1        byte  "Fire alarm", 0AH, 0
msg2        byte  "Carbon monoxide", 0AH, 0
msg3        byte  "Power outage", 0AH, 0
msg4        byte  "Gate unlocked", 0AH, 0
msg5        byte  "Door open", 0AH, 0
msg6        byte  "Window open", 0AH, 0

statusReg   byte  ?

            .code
main        proc

            ; Casos de teste - descomentar casos para testá-los individualmente. 
            ;mov statusReg, 00000001b           ;Fire alarm
            ;mov statusReg, 00000010b           ;Carbon monoxide
            ;mov statusReg, 00000100b           ;Power outage
            ;mov statusReg, 00001000b           ;Gate unlocked
            ;mov statusReg, 00010000b           ;Door open
            mov statusReg, 00100111b           ;Fire alarm, Carbon monoxide, Power outage 

            ;Verifica ocorrência de algum dos 3 primeiros itens de prioridade
            mov al, 0       

            test statusReg, 1
            .if     !ZERO?
                    INVOKE printf, ADDR fmt_out, ADDR msg1 
                    inc al
            .endif 

            test statusReg, 2
            .if     !ZERO?
                    INVOKE printf, ADDR fmt_out, ADDR msg2
                    inc al
            .endif 

            test statusReg, 4
            .if     !ZERO?
                    INVOKE printf, ADDR fmt_out, ADDR msg3 
                    inc al
            .endif 
            
            ;Se a == 0: Nenhuma ocorrência dos 3 primeiros itens. 
            .if al == 0 
                    test statusReg, 8 
                    .if     !ZERO?
                            INVOKE printf, ADDR fmt_out, ADDR msg4
                    .endif

                    test statusReg, 16 
                    .if     !ZERO?
                            INVOKE printf, ADDR fmt_out, ADDR msg5
                    .endif

                    test statusReg, 32 
                    .if     !ZERO?
                            INVOKE printf, ADDR fmt_out, ADDR msg6
                    .endif
            .endif

            ret 
main        endp
end