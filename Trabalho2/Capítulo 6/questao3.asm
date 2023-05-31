;   Building Instructions:
;   ml /Cx /coff questao3.asm /link /SUBSYSTEM:console /out:questao3.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
            .686
            .model  flat, c 
            .stack  100h
printf      PROTO arg1:Ptr Byte, printlist:VARARG 
scanf       PROTO arg2:Ptr Byte, inputlist:VARARG
            .data

fmt_out1    byte  0AH, "%s%s%d%s%d%s%d%s%d", 0AH, 0

msg1        byte  " EAX = ", 0
msg2        byte  ", EBX = ", 0
msg3        byte  ", ECX = ", 0
msg4        byte  ", EDX = ", 0
msg5        byte  "Valores  atuais:", 0
msg6        byte  "Apos a reversao:", 0

            .code
main        proc

            mov eax, 10
            mov ebx, 20
            mov ecx, 30
            mov edx, 40

            push eax
            push ebx
            push ecx
            push edx 

            INVOKE printf, ADDR fmt_out1, ADDR msg5, ADDR msg1, eax, ADDR msg2, ebx, ADDR msg3, ecx, ADDR msg4, edx 
           
            pop eax 
            pop ebx 
            pop ecx 
            pop edx 

            ; Essa parte abaixo é apenas para exibição visual da troca, por isso empilho os valores 
            ; de EAX, ECX e EDX novamente, porque são os únicos em uso que serão destruídos após o INVOKE

            ; Salvando os novos valores na pilha dos registradores que serão destruidos após o 'INVOKE' 
            push eax 
            push ecx
            push edx 
            INVOKE printf, ADDR fmt_out1, ADDR msg6, ADDR msg1, eax, ADDR msg2, ebx, ADDR msg3, ecx, ADDR msg4, edx 
            
            ; Desempilhando os valores para seus respectivos registradores
            pop edx
            pop ecx 
            pop eax 
              
            ret 
main        endp
end