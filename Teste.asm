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


guitarra1: string "               ,-.        _.---._     "
guitarra2: string "               |  `..__.-''       `.   "
guitarra3: string "                |  _        _  ,.   |  "
guitarra4: string " ,+++=.__________)_||______|_|_||    | "
guitarra5: string "(_.ooo.=================||======|=|=|| "
guitarra6: string "   ~~'           |  ~'      `~' o o  / "
guitarra7: string "                  |   /~|     o o  /   "
guitarra8: string "                  `~'    `-.____.-'    "



logo1: string "    ___          __  _____  ___ _____"
logo2: string "   /     |    | |--|   |   |   | |   |"
logo3: string "  |      |    | ||||   |   |   | |___|"
logo4: string "  |_____ |    | ||||   |   |___| |  |"
logo5: string "  |    | |    | ||||   |   |   | |   |"
logo6: string "   |___/ |____| |__/   |   |   | |    |"
logo7: string "                ___    ___   _____"
logo8: string "          |   | |     |   |  |   |"
logo9: string "          |___| |___  |___|  |   |"
logo10: string "          |   | |     |  |   |   |"
logo11: string "          |   | |___  |   |  |___|"

mensagemMenu1: string "|_________________|"
mensagemMenu2: string "|JOGUE COM D F J K|"
mensagemMenu3: string "|-----------------|"
mensagemMenu4: string "Pressione qualquer tecla para continuar:"


;---- Inicio do Programa Principal -----

main:

	loadn r0, #0
	loadn r1, #1
	loadn r2, #2

	;loadn r0, #0		; Posicao na tela onde a mensagem sera' escrita
	;loadn r1, #mensagemIniciar	; Carrega r1 com o endereco do vetor que contem a mensagem
	;loadn r2, #256		; Seleciona a COR da Mensagem
	
	call printaMenu
	
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
	
	
printaMenu:
	push r0
	push r1
	push r2
	
	loadn r0, #0 ; Posição da tela para printar
	loadn r1, #logo1
	loadn r2, #0
	call Imprimestr
	
	loadn r0, #40 ; Posição da tela para printar
	loadn r1, #logo2
	loadn r2, #0
	call Imprimestr
	
	loadn r0, #80 ; Posição da tela para printar
	loadn r1, #logo3
	loadn r2, #0
	call Imprimestr
	
	loadn r0, #120 ; Posição da tela para printar
	loadn r1, #logo4
	loadn r2, #0
	call Imprimestr
	
	loadn r0, #160 ; Posição da tela para printar
	loadn r1, #logo5
	loadn r2, #0
	call Imprimestr
	
	loadn r0, #200 ; Posição da tela para printar
	loadn r1, #logo6
	loadn r2, #0
	call Imprimestr
	
	loadn r0, #240 ; Posição da tela para printar
	loadn r1, #logo7
	loadn r2, #0
	call Imprimestr
	
	loadn r0, #280 ; Posição da tela para printar
	loadn r1, #logo8
	loadn r2, #0
	call Imprimestr
	
	loadn r0, #320 ; Posição da tela para printar
	loadn r1, #logo9
	loadn r2, #0
	call Imprimestr
	
	loadn r0, #360 ; Posição da tela para printar
	loadn r1, #logo10
	loadn r2, #0
	call Imprimestr
	
	loadn r0, #400 ; Posição da tela para printar
	loadn r1, #logo11
	loadn r2, #0
	call Imprimestr
	
	
	loadn r0, #560 ; Posição da tela para printar
	loadn r1, #guitarra1
	loadn r2, #2816
	call Imprimestr

	loadn r0, #600 ; Posição da tela para printar
	loadn r1, #guitarra2
	loadn r2, #2816
	call Imprimestr

	loadn r0, #640 ; Posição da tela para printar
	loadn r1, #guitarra3
	loadn r2, #2816
	call Imprimestr

	loadn r0, #680 ; Posição da tela para printar
	loadn r1, #guitarra4
	loadn r2, #2816
	call Imprimestr

	loadn r0, #720 ; Posição da tela para printar
	loadn r1, #guitarra5
	loadn r2, #2816
	call Imprimestr

	loadn r0, #760 ; Posição da tela para printar
	loadn r1, #guitarra6
	loadn r2, #2816
	call Imprimestr

	loadn r0, #800 ; Posição da tela para printar
	loadn r1, #guitarra7
	loadn r2, #2816
	call Imprimestr

	loadn r0, #840 ; Posição da tela para printar
	loadn r1, #guitarra8
	loadn r2, #2816
	call Imprimestr
	
	loadn r0, #931 ; Posição da tela para printar
	loadn r1, #mensagemMenu1
	loadn r2, #2816
	call Imprimestr
	
	loadn r0, #971 ; Posição da tela para printar
	loadn r1, #mensagemMenu2
	loadn r2, #2816
	call Imprimestr
	
	loadn r0, #1011 ; Posição da tela para printar
	loadn r1, #mensagemMenu3
	loadn r2, #2816
	call Imprimestr
	
	loadn r0, #1080 ; Posição da tela para printar
	loadn r1, #mensagemMenu4
	loadn r2, #2816
	call Imprimestr

	pop r2
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
	
	
