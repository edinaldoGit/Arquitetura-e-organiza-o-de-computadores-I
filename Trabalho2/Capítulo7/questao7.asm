;   Correção: 1,0
;   Building instructions
;   ml /Cx /coff questao7.asm /link /SUBSYSTEM:console /out:questao7.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
			.686
			.model flat,c
			.stack 100h
scanf 		PROTO 	arg2:Ptr Byte, inputlist:VARARG
printf 		PROTO 	arg1:Ptr Byte, printlist:VARARG
			.data

msg1fmt 	byte 	0Ah,"%s%d",0Ah,0Ah,0
fmt_strIn	byte	"%s", 0
fmt_intIn	byte	"%d", 0

msg1 		byte 	"The contents of the accumulator are: ", 0
msg2		byte	"Enter an input: ", 0

temp 		sdword 	?
input 		sdword  ?

			.code
LOADACC 	macro 	operand
			mov eax,operand ;; load eax with the operand
			endm

ADDACC 		macro 	operand
			add eax,operand ;; add to eax the operand
			endm
MULTACC 	macro 	operand
			push ebx ;; save ebx and ecx
			push ecx
			mov ebx,eax ;; mov eax to ebx
			mov eax,0 ;; clear accumulator to zero
			mov ecx,operand ;; load ecx with operand
			if operand LT 0 ;; if operand is negative
				neg ecx ; make ecx positive for loop
			endif
			.while ecx >0
				add eax,ebx ;; repetitively add
				dec ecx ;; decrement ecx
			.endw
			if operand LT 0 ;; if operand is negative
				neg eax ; negate accumulator, eax
			endif
			pop ecx ;; restore ecx and ebx
			pop ebx
			endm

; Macros implementadas na questão 7
STOREACC	macro	operand
			mov operand, eax
			endm

SUBACC		macro	operand 
			sub eax, operand
			endm 

DIVACC		macro	operand
			;Se divisor(operando) for 0, retornamos -1 em EAX
			if operand EQ 0
				mov eax, 1
				neg eax 
			else 
				; verifica se o conteúdo do acumulador é diferente de 0, se for diferente 
				; continua as verificações, se for igual a 0, não faz nada e EAX continua com 0,
				; pois 0 dividido por qualquer valor é 0.
				ifdif <eax>, <0>
					if operand LT 0
						push ebx
						push edx

						mov edx, eax
						mov eax, 0
						mov ebx, operand
						neg ebx
						.while  edx >= ebx
        					sub edx, ebx
        					inc eax 
						.endw	
						neg eax
						pop edx
						pop ebx
					else 
						push ebx
						push edx

						mov edx, eax
						mov eax, 0
						mov ebx, operand
					
						.while  edx >= ebx
        					sub edx, ebx
        					inc eax 
						.endw	
					
						pop edx
						pop ebx
					endif
				endif
			endif
			endm 

main		proc
			; Ler uma entrada 
			call INACC

			; Carrega 1 no acumulador EAX = 1
			LOADACC 1		

			; Imprime saída: EAX = 1
			call OUTACC

			; Adiciona 2 ao acumulador  
			ADDACC 2		

			; Imprime saída: EAX = 3
			call OUTACC

			; Adiciona entrada no acumulador
			ADDACC input	

			; Imprime saída: EAX = (3 + input)
			call OUTACC

			; Divide acumulador(EAX = (3 + input)) pelo operando(2) 
			DIVACC 2

			; Imprime saída: (EAX = (3 + input))/2
			call OUTACC

			; Multiplica acumulador por 4
			MULTACC 4
	
			; Imprime resultado
			CALL OUTACC
			ret
main 		endp

INACC		proc
			push eax
			push ecx
			push edx

			INVOKE printf, ADDR fmt_strIn, ADDR msg2 
			INVOKE scanf, ADDR fmt_intIn, ADDR input

			pop eax
			pop ecx
			pop edx
			ret
INACC		endp 

OUTACC 		proc
			push eax ; save eax, ecx, and edx
			push ecx
			push edx
			mov temp, eax

			INVOKE printf, ADDR msg1fmt, ADDR msg1, temp
			pop edx ; restore eax, ecx, and edx
			pop ecx
			pop eax
			ret
OUTACC 		endp
			end