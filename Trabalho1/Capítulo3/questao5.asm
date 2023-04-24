;
;   Building Instructions:
;   ml /Cx /coff questao5.asm /link /SUBSYSTEM:console /out:questao5.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
;  
; Correção: 0,5
        .686
        .model  flat, c 
        .stack  100h
printf  PROTO arg1:Ptr Byte, printlist:VARARG 
scanf   PROTO arg2:Ptr Byte, inputlist:VARARG
        .data
fmt_int    byte  "%d", 0                                         
fmt_str    byte  0AH, "%s", 0       
fmt_out    byte  0AH, "%s%d", 0AH, 0AH, 0                             

msg1       byte    "Enter an integer: ",0
msg2       byte    "The integer is: ",0

number     sdword  ?   
        .code
main    proc

        INVOKE printf, ADDR fmt_str, ADDR msg1
        INVOKE scanf, ADDR fmt_int, ADDR number
        
        mov eax, 3
        imul number
        mov ebx, 7
        sub ebx, eax 
        mov number, ebx

        INVOKE printf, ADDR fmt_out, ADDR msg2, number

        ret 
main    endp
end
