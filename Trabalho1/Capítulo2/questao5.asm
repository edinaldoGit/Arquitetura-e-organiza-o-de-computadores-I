;   Building Instructions:
;   ml /Cx /coff questao5.asm /link /SUBSYSTEM:console /out:questao5.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
;   Correção: 0,5
        .686
        .model  flat, c 
        .stack  100h
printf  PROTO arg1:Ptr Byte, printlist:VARARG
        .data
fmt_msg byte    "%d%s%d%s%d", 0
sumSymb byte    " + ", 0
equSymb byte    " = ", 0
num1    dword   1
num2    dword   2
num3    dword   3
        .code
main    proc
        INVOKE printf, ADDR fmt_msg, num1, ADDR sumSymb, num2, ADDR equSymb, num3
        ret 
main    endp
end