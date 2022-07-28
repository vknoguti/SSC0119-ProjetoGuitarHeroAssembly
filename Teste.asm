; Hello World - Escreve mensagem armazenada na memoria na tela


; ------- TABELA DE CORES -------
; adicione ao caracter para Selecionar a cor correspondente

; 0 branco							0000 0000
; 256 marrom						0001 0000
; 512 verde							0010 0000
; 768 oliva							0011 0000
; 1024 azul marinho					0100 0000
; 1280 roxo							0101 0000
; 1536 teal							0110 0000
; 1792 prata						0111 0000
; 2048 cinza						1000 0000
; 2304 vermelho						1001 0000
; 2560 lima							1010 0000
; 2816 amarelo						1011 0000
; 3072 azul							1100 0000
; 3328 rosa							1101 0000
; 3584 aqua							1110 0000
; 3840 branco						1111 0000



jmp main


mensagem : var #21
static mensagem + #0, #'A'
static mensagem + #1, #'A'
static mensagem + #2, #'A'
static mensagem + #3, #'a'
static mensagem + #4, #'B'
static mensagem + #5, #'C'
static mensagem + #6, #'E'
static mensagem + #7, #'N'
static mensagem + #8, #'T'
static mensagem + #9, #'E'
static mensagem + #10, #'R'
static mensagem + #11, #' '
static mensagem + #12, #'T'
static mensagem + #13, #'O'
static mensagem + #14, #' '
static mensagem + #15, #'S'
static mensagem + #16, #'T'
static mensagem + #17, #'A'
static mensagem + #18, #'R'
static mensagem + #19, #'T'
static mensagem + #20, #'\0'


mensagem2 : string "Ola Mundo!"


telaInicio1Linha0: string "                                        "
telaInicio1Linha1: string "    ___          __  _____  ___ _____   "
telaInicio1Linha2: string "   /     |    | |--|   |   |   | |   |  "
telaInicio1Linha3: string "  |      |    | ||||   |   |   | |___|  "
telaInicio1Linha4: string "  |_____ |    | ||||   |   |___| |  |   "
telaInicio1Linha5: string "  |    | |    | ||||   |   |   | |   |  "
telaInicio1Linha6: string "   |___/ |____| |__/   |   |   | |    | "
telaInicio1Linha7: string "                ___    ___   _____      "
telaInicio1Linha8: string "          |   | |     |   |  |   |      "
telaInicio1Linha9: string "          |___| |___  |___|  |   |      "
telaInicio1Linha10: string "          |   | |     |  |   |   |      "
telaInicio1Linha11: string "          |   | |___  |   |  |___|      "
telaInicio1Linha12: string "                                        "
telaInicio1Linha13: string "                                        "
telaInicio1Linha14: string "               ,-.        _.---._       "
telaInicio1Linha15: string "               |  `..__.-''       `.    "
telaInicio1Linha16: string "                |  _        _  ,.   |   "
telaInicio1Linha17: string " ,+++=.__________)_||______|_|_||    |  "
telaInicio1Linha18: string "(_.ooo.=================||======|=|=||  "
telaInicio1Linha19: string "   ~~'           |  ~'      `~' o o  /  "
telaInicio1Linha20: string "                  |   /~|     o o  /    "
telaInicio1Linha21: string "                  `~'    `-.____.-'     "
telaInicio1Linha22: string "                                        "
telaInicio1Linha23: string "                                        "
telaInicio1Linha24: string "                                        "
telaInicio1Linha25: string "            |_________________|         "
telaInicio1Linha26: string "            |JOGUE COM D F J K|         "
telaInicio1Linha27: string "            |-----------------|         "
telaInicio1Linha28: string "                                        "
telaInicio1Linha29: string "Pressione qualquer tecla para continuar:"

telaInicio2Linha0: string "                                        "
telaInicio2Linha1: string "    ___          __  _____  ___ _____   "
telaInicio2Linha2: string "   /     |    | |--|   |   |   | |   |  "
telaInicio2Linha3: string "  |      |    | ||||   |   |   | |___|  "
telaInicio2Linha4: string "  |_____ |    | ||||   |   |___| |  |   "
telaInicio2Linha5: string "  |    | |    | ||||   |   |   | |   |  "
telaInicio2Linha6: string "   |___/ |____| |__/   |   |   | |    | "
telaInicio2Linha7: string "                ___    ___   _____      "
telaInicio2Linha8: string "          |   | |     |   |  |   |      "
telaInicio2Linha9: string "          |___| |___  |___|  |   |      "
telaInicio2Linha10: string "          |   | |     |  |   |   |      "
telaInicio2Linha11: string "          |   | |___  |   |  |___|      "
telaInicio2Linha12: string "                                        "
telaInicio2Linha13: string "                                        "
telaInicio2Linha14: string "                                        "
telaInicio2Linha15: string "                                        "
telaInicio2Linha16: string "                                        "
telaInicio2Linha17: string "                                        "
telaInicio2Linha18: string "                                        "
telaInicio2Linha19: string "                                        "
telaInicio2Linha20: string "                                        "
telaInicio2Linha21: string "                                        "
telaInicio2Linha22: string "                                        "
telaInicio2Linha23: string "                                        "
telaInicio2Linha24: string "                                        "
telaInicio2Linha25: string "                                        "
telaInicio2Linha26: string "                                        "
telaInicio2Linha27: string "                                        "
telaInicio2Linha28: string "                                        "
telaInicio2Linha29: string "Pressione qualquer tecla para continuar:"


tela0Linha0  : string "                                        "
tela0Linha1  : string "                                        "
tela0Linha2  : string "                                        "
tela0Linha3  : string "                                        "
tela0Linha4  : string "                                        "
tela0Linha5  : string "                                        "
tela0Linha6  : string "                                        "
tela0Linha7  : string "                                        "
tela0Linha8  : string "                                        "
tela0Linha9  : string "                                        "
tela0Linha10 : string "                                        "
tela0Linha11 : string "                                        "
tela0Linha12 : string "                                        "
tela0Linha13 : string "                                        "
tela0Linha14 : string "                                        "
tela0Linha15 : string "                                        "
tela0Linha16 : string "                                        "
tela0Linha17 : string "                                        "
tela0Linha18 : string "                                        "
tela0Linha19 : string "                                        "
tela0Linha20 : string "                                        "
tela0Linha21 : string "                                        "
tela0Linha22 : string "                                        "
tela0Linha23 : string "                                        "
tela0Linha24 : string "                                        "
tela0Linha25 : string "                                        "
tela0Linha26 : string "                                        "
tela0Linha27 : string "                                        "
tela0Linha28 : string "                                        "
tela0Linha29 : string "                                        "	



telaJogo1: string ""


;---- Inicio do Programa Principal -----

main:

	loadn r0, #0
	loadn r1, #1
	loadn r2, #2

	;loadn r0, #0		; Posicao na tela onde a mensagem sera' escrita
	;loadn r1, #mensagemIniciar	; Carrega r1 com o endereco do vetor que contem a mensagem
	;loadn r2, #256		; Seleciona a COR da Mensagem
	
	;call printaMenu
	
	call ApagaTela
	
	
	loadn r1, #telaInicio1Linha0
	loadn r2, #2816
	call ImprimeTela
	
	loadn r1, #telaInicio2Linha0
	loadn r2, #0
	call ImprimeTela2
	
	;call Imprimestr   ;  r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"
	
	
	call leTeclado
	;loadn r3, #'5'
	
	loadn r0, #0
	loadn r2, #256
	outchar r3, r0

	halt
	
;---- Fim do Programa Principal -----
	
;---- Inicio das Subrotinas -----
	
Imprimestr:	;  Rotina de Impresao de Mensagens:    r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"
	push r0	; protege o r0 na pilha para preservar seu valor
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	
	loadn r3, #'\0'	; Criterio de parada
	

	ImprimestrLoop:	
		loadi r4, r1
		cmp r4, r3
		jeq ImprimestrSai
		add r4, r2, r4
		outchar r4, r0
		inc r0
		inc r1
		jmp ImprimestrLoop
	
	ImprimestrSai:	
		pop r4	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
		pop r3
		pop r2
		pop r1
		pop r0
		rts
		
		
clear:
	push r0
	push r1
	push r2

	loadn r0, #0
	loadn r1, #1100
	loadn r2, #' '
	loopClear:
		cmp r0, r1
		jeq loopClearSai
		outchar r2, r0
		inc r0
		jmp loopClear
		
	loopClearSai:	 
		pop r2
		pop r1
		pop r0
		rts

	
	
ImprimeTela: 	;  Rotina de Impresao de Cenario na Tela Inteira
		;  r1 = endereco onde comeca a primeira linha do Cenario
		;  r2 = cor do Cenario para ser impresso

	push r0	; protege o r3 na pilha para ser usado na subrotina
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	push r5	; protege o r4 na pilha para ser usado na subrotina

	loadn R0, #0  	; posicao inicial tem que ser o comeco da tela!
	loadn R3, #40  	; Incremento da posicao da tela!
	loadn R4, #41  	; incremento do ponteiro das linhas da tela
	loadn R5, #1200 ; Limite da tela!
	
	
   	ImprimeTela_Loop:
		call Imprimestr
		add r0, r0, r3  	; incrementaposicao para a segunda linha na tela -->  r0 = R0 + 40
		add r1, r1, r4  	; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 porcausa do /0 !!) --> r1 = r1 + 41
		cmp r0, r5			; Compara r0 com 1200
		jne ImprimeTela_Loop	; Enquanto r0 < 1200

	pop r5	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts
	
ImprimeTela2: 	;  Rotina de Impresao de Cenario na Tela Inteira
		;  r1 = endereco onde comeca a primeira linha do Cenario
		;  r2 = cor do Cenario para ser impresso

	push r0	; protege o r3 na pilha para ser usado na subrotina
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	push r5	; protege o r5 na pilha para ser usado na subrotina
	push r6	; protege o r6 na pilha para ser usado na subrotina

	loadn R0, #0  	; posicao inicial tem que ser o comeco da tela!
	loadn R3, #40  	; Incremento da posicao da tela!
	loadn R4, #41  	; incremento do ponteiro das linhas da tela
	loadn R5, #1200 ; Limite da tela!
	loadn R6, #tela0Linha0	; Endereco onde comeca a primeira linha do cenario!!
	
   ImprimeTela2_Loop:
		call ImprimeStr2
		add r0, r0, r3  	; incrementaposicao para a segunda linha na tela -->  r0 = R0 + 40
		add r1, r1, r4  	; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 porcausa do /0 !!) --> r1 = r1 + 41
		add r6, r6, r4  	; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 porcausa do /0 !!) --> r1 = r1 + 41
		cmp r0, r5			; Compara r0 com 1200
		jne ImprimeTela2_Loop	; Enquanto r0 < 1200

	pop r6	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts

ImprimeStr2:	;  Rotina de Impresao de Mensagens:    r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"
	push r0	; protege o r0 na pilha para preservar seu valor
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	push r5	; protege o r5 na pilha para ser usado na subrotina
	push r6	; protege o r6 na pilha para ser usado na subrotina
	
	
	loadn r3, #'\0'	; Criterio de parada
	loadn r5, #' '	; Espaco em Branco

   ImprimeStr2_Loop:	
		loadi r4, r1
		cmp r4, r3		; If (Char == \0)  vai Embora
		jeq ImprimeStr2_Sai
		cmp r4, r5		; If (Char == ' ')  vai Pula outchar do espaco para na apagar outros caracteres
		jeq ImprimeStr2_Skip
		add r4, r2, r4	; Soma a Cor
		outchar r4, r0	; Imprime o caractere na tela
   		storei r6, r4
   ImprimeStr2_Skip:
		inc r0			; Incrementa a posicao na tela
		inc r1			; Incrementa o ponteiro da String
		inc r6
		jmp ImprimeStr2_Loop
	
   ImprimeStr2_Sai:	
	pop r6	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts
	
ApagaTela:
	push r0
	push r1
	
	loadn r0, #1200		; apaga as 1200 posicoes da Tela
	loadn r1, #' '		; com "espaco"
	
	   ApagaTela_Loop:	;;label for(r0=1200;r3>0;r3--)
		dec r0
		outchar r1, r0
		jnz ApagaTela_Loop
 
	pop r1
	pop r0
	rts	
	
	
	
leTeclado:
	push r0
	loadn r0, #255
	
	loopLe:
		inchar r3
		cmp r0, r3
		jeq loopLe
	
	pop r0
	rts
	
	
