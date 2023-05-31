;   Building Instructions:
;   ml /Cx /coff questao4.asm /link /SUBSYSTEM:console /out:questao4.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
            .686
            .model  flat, c 
            .stack  100h
printf      PROTO arg1:Ptr Byte, printlist:VARARG 
scanf       PROTO arg2:Ptr Byte, inputlist:VARARG
            .data

fmt_out     byte "%s", 0

msg1        byte  "Paper jam", 0AH, 0
msg2        byte  "Paper misfeed", 0AH, 0
msg3        byte  "Paper tray empty", 0AH, 0
msg4        byte  "Toner low", 0AH, 0
msg5        byte  "Toner empty", 0AH, 0

statusReg   byte  ? 

            .code
main        proc

            ; Casos de teste - descomentar casos para testá-los individualmente. 
            mov statusReg, 00000001b            ;Paper jam
            ;mov statusReg, 00000010b           ;Paper misfeed
            ;mov statusReg, 00000100b           ;Paper tray empty
            ;mov statusReg, 00001000b           ;Toner low 
            ;mov statusReg, 00010000b           ;Toner empty
            ;mov statusReg, 00010001b           ;Paper jam 


            test statusReg, 1
            .if     !ZERO?
                    INVOKE printf, ADDR fmt_out, ADDR msg1
                    jmp endProg 
            .endif 

            test statusReg, 2
            .if     !ZERO?
                    INVOKE printf, ADDR fmt_out, ADDR msg2
                    jmp endProg
            .endif 

            test statusReg, 4
            .if     !ZERO?
                    INVOKE printf, ADDR fmt_out, ADDR msg3 
                    jmp endProg
            .endif 
            
            test statusReg, 8 
            .if     !ZERO?
                    INVOKE printf, ADDR fmt_out, ADDR msg4
                    jmp endProg
            .endif

            test statusReg, 16 
            .if     !ZERO?
                    INVOKE printf, ADDR fmt_out, ADDR msg5
            .endif

            endProg: nop

            ret 
main        endp
end