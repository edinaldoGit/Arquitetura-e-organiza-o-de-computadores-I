;   Building instructions:
;   ml /Cx /coff questao7.asm /link /SUBSYSTEM:console /out:questao7.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
            .686
            .model  flat, c 
            .stack  100h
printf      PROTO   arg1:Ptr Byte, printlist:VARARG 
scanf       PROTO   arg2:Ptr Byte, inputlist:VARARG
            .data
fmt_str     byte    "%s", 0AH, 0  

msg1        byte    "x is greater than y", 0AH, 0
msg2        byte    "x is less than y", 0AH, 0
msg3        byte    "x and y are equal", 0AH, 0

x           real8 5.12
y           real8 5.12
            .code
main        proc
            ;if x > y
if01:       fld y
            fld x
            fcomip st(0), st(1)
            jbe else01
then01:     INVOKE printf, ADDR fmt_str, ADDR msg1
            jmp endif01
else01:     nop
                        ;if x < y
            if02:       fld y
                        fld x
                        fcomip st(0), st(1)
                        je else02
            then02:     INVOKE printf, ADDR fmt_str, ADDR msg2
                        jmp endif02
                        ;caso x == y
            else02:    INVOKE printf, ADDR fmt_str, ADDR msg3
                        jmp endif02
            endif02:    nop
endif01:    nop
    
            ret
main        endp
end