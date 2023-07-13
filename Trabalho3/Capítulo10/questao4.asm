;   Building instructions:
;   ml /Cx /coff questao4.asm /link /SUBSYSTEM:console /out:questao4.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
            .686
            .model  flat, c 
            .stack  100h
printf      PROTO   arg1:Ptr Byte, printlist:VARARG 
scanf       PROTO   arg2:Ptr Byte, inputlist:VARARG
            .data
fmt_lf      byte    "%Lf", 0
fmt_str1    byte    0AH, "%s", 0
fmt_str2    byte    0AH, "%s%6.4Lf", 0AH, 0AH, 0

msg1        byte    "Enter a long double for x: ", 0
msg2        byte    "The long double in y is: ", 0

x           real10  ?
y           real10  ?

            .code
main        proc
            INVOKE printf, ADDR fmt_str1, ADDR msg1
            INVOKE scanf, ADDR fmt_lf, ADDR x
            fld x
            fstp y
            INVOKE printf, ADDR fmt_str2, ADDR msg2, y
main        endp
            end