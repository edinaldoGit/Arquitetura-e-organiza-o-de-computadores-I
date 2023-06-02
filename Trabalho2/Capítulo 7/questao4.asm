;   Building Instructions:
;   ml /Cx /coff questao4.asm /link /SUBSYSTEM:console /out:questao4.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
;  
            .686
            .model   flat, c 
            .stack   100h
printf      PROTO    arg1:Ptr Byte, printlist:VARARG 
scanf       PROTO    arg2:Ptr Byte, inputlist:VARARG
            
            .data
fmt_int     byte     "%d", 0
fmt_str1    byte     "%s", 0                                          
fmt_str2    byte     "%s%d%s%d", 0AH, 0AH, 0      
   
          
msg1        byte     " * Digite um numero inteiro nao negativo -> ", 0
msg2        byte     " - O FATORIAL de ", 0
msg3        byte     " eh: ", 0
msg4        byte     0AH, " FATORIAL - USANDO MACRO ", 0AH, 0 

n           dword    ?   
result      dword    ?

            .code
FAT         macro 
            mov ecx, 1
            mov result, 1 
            .while  ecx <= n
                    mov eax, result 
                    imul ecx
                    mov result, eax
                    inc ecx
            .endw
            endm

main        proc

            INVOKE printf, ADDR fmt_str1, ADDR msg4

            ; Recebendo as entradas pelo usuário
            INVOKE printf, ADDR fmt_str1, ADDR msg1
            INVOKE scanf, ADDR fmt_int, ADDR n

            FAT 

            INVOKE printf, ADDR fmt_str2, ADDR msg2, n, ADDR msg3, result

            ret 
main        endp
end