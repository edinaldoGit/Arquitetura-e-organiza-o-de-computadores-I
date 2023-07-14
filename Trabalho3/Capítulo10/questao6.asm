;   Building instructions:
;   ml /Cx /coff questao6.asm /link /SUBSYSTEM:console /out:questao6.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
            .686
            .model  flat, c 
            .stack  100h
printf      PROTO   arg1:Ptr Byte, printlist:VARARG 
scanf       PROTO   arg2:Ptr Byte, inputlist:VARARG
            .data
fmt_str     byte    0AH, "%s", 0

msg1        byte "x is greater than y", 0
msg2        byte "x is less than or equal to y", 0  

x           real10 5.45
y           real10 12.8798

            .code
main        proc
            ;if x > y
if01:       fld y
            fld x
            fcomip st(0), st(1)
            jbe else01

then01:     INVOKE printf, ADDR fmt_str, ADDR msg1
            jmp endif01

else01:     INVOKE printf, ADDR fmt_str, ADDR msg2
            jmp endif01

endif01:    nop
main        endp
            end