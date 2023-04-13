;
;   Building Instructions:
;   ml /Cx /coff questao7.asm /link /SUBSYSTEM:console /out:questao7.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
;  
        .686
        .model  flat, c 
        .stack  100h
printf  PROTO arg1:Ptr Byte, printlist:VARARG 
scanf   PROTO arg2:Ptr Byte, inputlist:VARARG
        .data
fmt_int    byte  "%d", 0                                         
fmt_str    byte  0AH, "%s", 0       
fmt_out    byte  0AH, "%s%d", 0                             

msg1       byte    "Enter the degrees in Fahrenheit: ",0
msg2       byte    "The degrees in Celsius is: ",0

cel     sdword  ?
fah     sdword  ?   
        .code
main    proc

        INVOKE printf, ADDR fmt_str, ADDR msg1
        INVOKE scanf, ADDR fmt_int, ADDR fah
        
        mov eax, fah
        sub eax, 32
        mov ebx, 9
        mov ecx, 5
        cdq 
        idiv ebx 
        imul ecx 
        mov cel, eax
        
        INVOKE printf, ADDR fmt_out, ADDR msg2, cel

        ret 
main    endp
end
