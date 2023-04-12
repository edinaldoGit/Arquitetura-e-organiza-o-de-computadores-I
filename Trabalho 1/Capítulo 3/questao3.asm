;
;   Building Instructions:
;   ml /Cx /coff questao3.asm /link /SUBSYSTEM:console /out:questao3.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
; 
        .686
        .model  flat, c 
        .stack  100h
printf  PROTO arg1:Ptr Byte, printlist:VARARG 
scanf   PROTO arg2:Ptr Byte, inputlist:VARARG
        .data
fmt_int    byte  "%d",0                                         
fmt_str    byte  0AH,"%s",0       
fmt_out    byte  0AH, 0AH, "%s%d",0                             

msg1       byte    "Enter x: ",0
msg2       byte    "Enter y: ",0
msg3       byte    "Enter z: ",0
msg4       byte    "x = ",0

x          sdword  ?   
y          sdword  ? 
z          sdword  ?  
        .code
main    proc

        INVOKE printf, ADDR fmt_str, ADDR msg1
        INVOKE scanf, ADDR fmt_int, ADDR x

        INVOKE printf, ADDR fmt_str, ADDR msg2
        INVOKE scanf, ADDR fmt_int, ADDR y

        INVOKE printf, ADDR fmt_str, ADDR msg3
        INVOKE scanf, ADDR fmt_int, ADDR z

        mov eax, x
        imul y
        mov ebx, eax
        mov eax, 2
        imul z
        add eax, ebx
        mov x, eax

        INVOKE printf, ADDR fmt_out, ADDR msg4, x

        ret 
main    endp
end
