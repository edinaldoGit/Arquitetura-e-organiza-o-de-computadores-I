; Correção: 0,5
;   Building instructions:
;   ml /Cx /coff questao8.asm /link /SUBSYSTEM:console /out:questao8.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
            .686
            .model  flat, c 
            .stack  100h
printf      PROTO   arg1:Ptr Byte, printlist:VARARG 
scanf       PROTO   arg2:Ptr Byte, inputlist:VARARG
            .data
fmt_lf      byte "%lf", 0
fmt_str1    byte 0AH, "%s", 0
fmt_str2    byte 0AH, "%s%6.1f", 0Ah, 0

msg1		byte "Enter a positive double for x: ", 0
msg2		byte "The sum is: ", 0

x		    real8 ?
sum		    real8 ?
zero		real8 0.0

		    .code
main		proc
		    fld zero
		    fstp sum
		    INVOKE printf, ADDR fmt_str1, ADDR msg1
		    INVOKE scanf, ADDR fmt_lf, ADDR x

		    ; Do 
while01:	;sum = sum + x
            fld sum
            fadd x
            fstp sum
            INVOKE printf, ADDR fmt_str1, ADDR msg1
            INVOKE scanf, ADDR fmt_lf, ADDR x
            ; while x > 0.0
            fld zero
            fld x
            fcomip st(0), st(1)
            jg while01 
endw01:		nop
            INVOKE printf, ADDR fmt_str2, ADDR msg2, sum 
		    ret
main		endp
end