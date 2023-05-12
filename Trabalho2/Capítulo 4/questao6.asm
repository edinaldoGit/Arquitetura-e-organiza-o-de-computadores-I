;   Building Instructions:
;   ml /Cx /coff questao6.asm /link /SUBSYSTEM:console /out:questao6.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
            .686
            .model  flat, c 
            .stack  100h
printf      PROTO arg1:Ptr Byte, printlist:VARARG 
scanf       PROTO arg2:Ptr Byte, inputlist:VARARG
            .data
fmt_int     byte  "%d", 0                                         
fmt_str_in  byte  "%s", 0       
fmt_out1    byte  0AH, "%s", 0AH, 0AH, 0
fmt_out2    byte  "%s", 0AH, 0AH, 0
fmt_out3    byte  0AH, "%s", 0AH, 0
                     

msg1        byte  "Enter an AC Voltage: ",0
msg2        byte  "Voltage is Acceptable",0
msg3        byte  "Warning!",0
msg4        byte  "Voltage too Low",0
msg5        byte  "Voltage too High",0

voltage     sdword  ?   
            .code
main        proc
            INVOKE printf, ADDR fmt_str_in, ADDR msg1 
            INVOKE scanf, ADDR fmt_int, ADDR voltage 

            if01:       cmp voltage, 110
                        jl else01
            and01:      cmp voltage, 120
                        jg else01 
            then01:     INVOKE printf, ADDR fmt_out1, ADDR msg2
                        jmp endif01
            else01:     INVOKE printf, ADDR fmt_out3, ADDR msg3
                        if02:       cmp voltage, 110
                                    jg else02
                        then02:     INVOKE printf, ADDR fmt_out2, ADDR msg4
                                    jmp endif02
                        else02:     INVOKE printf, ADDR fmt_out2, ADDR msg5
                        endif02:    nop
            endif01:    nop

            ret 
main        endp
end
