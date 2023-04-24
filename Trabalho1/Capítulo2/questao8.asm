;
;   Building Instructions:
;   ml /Cx /coff questao8.asm /link /SUBSYSTEM:console /out:questao8.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
;
; Correção: 0,5
        .686
        .model  flat, c 
        .stack  100h
printf  PROTO arg1:Ptr Byte, printlist:VARARG 
scanf   PROTO arg2:Ptr Byte, inputlist:VARARG
        .data
fmt_int   byte  "%d",0                                         

fmt_str    byte  "%s",0                                    
fmt_str1   byte  0AH,'%s',0AH,'%d',0AH,'%d',0 

msg1       byte    "Enter a number: ",0
msg2       byte    "Numbers",0

num1    sdword  ?   
num2    sdword  ?   
        .code
main    proc
        INVOKE printf, ADDR fmt_str, ADDR msg1
        INVOKE scanf, ADDR fmt_int, ADDR num1

        INVOKE printf, ADDR fmt_str, ADDR msg1
        INVOKE scanf, ADDR fmt_int, ADDR num2

        INVOKE printf, ADDR fmt_str1, ADDR msg2, num1, num2
        ret 
main    endp
end