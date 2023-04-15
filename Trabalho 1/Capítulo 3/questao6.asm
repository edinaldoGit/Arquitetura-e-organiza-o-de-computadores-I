;
;   Building Instructions:
;   ml /Cx /coff questao6.asm /link /SUBSYSTEM:console /out:questao6.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
;
            .686
            .model flat, c
            .stack 100h
printf      PROTO arg1:Ptr Byte, printlist:VARARG
scanf       PROTO arg2:Ptr Sdword, inputlist:VARARG
            .data
in1fmt      byte "%d",0
msg0fmt     byte 0Ah,"%s",0
msg1fmt     byte "%s",0
msg3fmt     byte 0Ah,"%s%d",0Ah,0
msg4fmt     byte "%s%d",0Ah,0Ah,0
msg1        byte "The number of volts is: ",0
msg2        byte "Enter the number of ohms: ",0
msg3        byte "Enter the number of amperes: ",0
msg4        byte "The number of watts is: ",0

ohms        sdword ? ; number of ohms
volts       sdword ? ; number of volts
amperes     sdword ? ; number of amperes
watts       sdword ? ; number of watts
            .code
main        proc
            INVOKE printf, ADDR msg0fmt, ADDR msg3
            INVOKE scanf, ADDR in1fmt, ADDR amperes
            INVOKE printf, ADDR msg1fmt, ADDR msg2
            INVOKE scanf, ADDR in1fmt, ADDR ohms
            ; volts = amperes*ohms
            mov eax,amperes 
            mov ebx,ohms
            imul ebx
            mov volts,eax
            INVOKE printf, ADDR msg3fmt, ADDR msg1, volts
            ; watts = amperes*volts
            mov eax,amperes
            mov ebx,volts
            imul ebx
            mov watts,eax
            INVOKE printf, ADDR msg4fmt, ADDR msg4, watts
            ret
main        endp
            end
