; Correção: 0,5
;   Building instructions:
;   ml /Cx /coff questao9.asm /link /SUBSYSTEM:console /out:questao9.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
            .686
            .model  flat, c 
            .stack  100h
printf      PROTO   arg1:Ptr Byte, printlist:VARARG 
scanf       PROTO   arg2:Ptr Byte, inputlist:VARARG
            .data
msg1fmt     byte    0Ah, "%s", 0Ah, 0Ah, 0
msg2fmt     byte    " %3.1f", 0Ah, 0
fmt_int1    byte    "%lf", 0
fmt_str     byte    "%s%d%s", 0

msg1        byte    "Array", 0
msg2        byte    "Type the ", 0
msg3        byte    "o element in array: ", 0

n           sdword  5
array       real8   5 dup(?)
i           dword   ?
            .code
main        proc
            mov ecx, n 
            mov ebx, 0
            mov i, 1
            .repeat 
                push ecx
                INVOKE printf, ADDR fmt_str, ADDR msg2, i, ADDR msg3 
                INVOKE scanf, ADDR fmt_int1, ADDR array[ebx]
                pop ecx
                add ebx, 8
                inc i
            .untilcxz 

            INVOKE printf, ADDR msg1fmt, ADDR msg1
            lea esi, array
            mov ecx,n
            .repeat
                push ecx
                INVOKE printf, ADDR msg2fmt, real8 ptr [esi]
                pop ecx
                add esi,8
            .untilcxz

            INVOKE printf, ADDR msg1fmt, ADDR msg1
            mov ebx,0
            mov ecx, n

            .repeat
                push ecx
                INVOKE printf, ADDR msg2fmt, array[ebx]
                pop ecx
                add ebx,8
            .untilcxz

            ret
main        endp
end
