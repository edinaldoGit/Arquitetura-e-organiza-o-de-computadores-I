;
;   Building Instructions:
;   ml /Cx /coff questao7.asm /link /SUBSYSTEM:console /out:questao7.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
;
; Correção: 0,5

        .686
        .model  flat, c 
        .stack  100h
printf  PROTO arg1:Ptr Byte, printlist:VARARG 
scanf   PROTO arg2:Ptr Byte, inputlist:VARARG
        .data
in1fmt  byte    "%d", 0

msg0fmt byte    "%s",0
msg1fmt byte    0Ah,"%d%s%d%s%d%s",0AH,0
msg2fmt byte    "%d%s%d%s%d%s",0AH,0
msg0    byte    "Enter a number: ",0
msgx    byte    "Enter a larger number: ",0
msgy    byte    "Enter an even larger ",0Ah,0
msgz    byte    "number: ",0
msg1    byte    " < ",0
msg3    byte    " > ",0
msg4    byte    " ",0Ah,0
num1    sdword  ?   ; first number
num2    sdword  ?   ; second number
num3    sdword  ?   ; third number
        .code
main    proc
        INVOKE printf, ADDR msg0fmt, ADDR msg0
        INVOKE scanf, ADDR in1fmt, ADDR num1

        INVOKE printf, ADDR msg0fmt, ADDR msgx
        INVOKE scanf, ADDR in1fmt, ADDR num2

        INVOKE printf, ADDR msg0fmt, ADDR msgy
        INVOKE printf, ADDR msg0fmt, ADDR msgz
        INVOKE scanf, ADDR in1fmt, ADDR num3

        INVOKE printf, ADDR msg1fmt, num1, ADDR msg1, num2, ADDR msg1, num3, ADDR msg4

        INVOKE printf, ADDR msg2fmt, num3, ADDR msg3, num2, ADDR msg3, num1, ADDR msg4
        ret 
main    endp
end
