;
;   Building Instructions:
;   ml /Cx /coff questao6.asm /link /SUBSYSTEM:console /out:questao6.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
;
        .686
        .model  flat, c 
        .stack  100h
printf  PROTO arg1:Ptr Byte, printlist:VARARG 
scanf   PROTO arg2:Ptr Byte, inputlist:VARARG
        .data
fmt_int   byte  "%d",0                                         

fmt_str    byte  0AH,"%s",0                                    
fmt_str1   byte  0AH,"%d%s%d",0 

msg1       byte    "Enter a value for num1: ",0
msg2       byte    "Enter a value for num2: ",0
msg3       byte    "num1        num2",0
msg4       byte    "            ",0

num1    sdword  ?   
num2    sdword  ?   
        .code
main    proc
        INVOKE printf, ADDR fmt_str, ADDR msg1
        INVOKE scanf, ADDR fmt_int, ADDR num1

        INVOKE printf, ADDR fmt_str, ADDR msg2
        INVOKE scanf, ADDR fmt_int, ADDR num2

        INVOKE printf, ADDR fmt_str, ADDR msg3
        INVOKE printf, ADDR fmt_str1, num1, ADDR msg4, num2

        ret 
main    endp
end