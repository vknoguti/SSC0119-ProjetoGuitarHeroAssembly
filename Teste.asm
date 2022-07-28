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

Letra : var #1

IncRand: var #1			; Incremento para circular na Tabela de nr. Randomicos
Rand : var #12			; Tabela de nr. Randomicos entre 0 - 7
	static Rand + #0, #11
	static Rand + #1, #17
	static Rand + #2, #17
	static Rand + #3, #29
	static Rand + #4, #23
	static Rand + #5, #11
	static Rand + #6, #11
	static Rand + #7, #29
	static Rand + #8, #23
	static Rand + #9, #23
	static Rand + #10, #23
	static Rand + #11, #17
	;static Rand + #12, #0
	;static Rand + #13, #2
	;static Rand + #14, #7
	;static Rand + #15, #5
	;static Rand + #16, #5
	;static Rand + #17, #6
	;static Rand + #18, #7
	;static Rand + #19, #2
	;static Rand + #20, #0
	;static Rand + #20, #7
	;static Rand + #21, #1
	;static Rand + #22, #5
	;static Rand + #23, #6
	;static Rand + #24, #6
	;static Rand + #25, #7
	;static Rand + #26, #0
	;static Rand + #27, #3
	;static Rand + #28, #1
	;static Rand + #29, #1

posNota1 : var #1
posAntNota1 : var #1

posNota2 : var #1
posAntNota2 : var #1

posNota3 : var #1
posAntNota3 : var #1

posNota4 : var #1
posAntNota4 : var #1

scoreInt : var #4
scoreChar : var #4



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
	loadn r6, #tela0Linha0
	call ImprimeTela2
	
	;call Imprimestr   ;  r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"
	
	
	call leTeclado
	;loadn r3, #'5'
	
	
	
	loadn r0, #0
	loadn r2, #256
	outchar r3, r0
	
	loadn r3, #495
	store scoreInt, r3
	
	call ImprimeScore
	
	loadn r2, #1000
	add r3, r3, r2
	store scoreInt, r3
	call Delay
	
	call ApagaTela
	
	loadn r1, #telaJogo1Linha0
	loadn r2, #0
	loadn r6, #tela1Linha0
	call ImprimeTela2
	
	call ImprimeScore
	
	loadn r0, #11
	store posNota1, r0
	store posAntNota1, r0
	
	loadn r0, #17
	store posNota2, r0
	store posAntNota2, r0
	
	loadn r0, #23
	store posNota3, r0
	store posAntNota3, r0
	
	loadn r0, #29
	store posNota4, r0
	store posAntNota4, r0
	
	
	loadn R2, #0
	
	Loop:
		
		loadn R3, #4
		mod R3, R2, R3
		cmp R3, R4		; if (mod(c/10)==0
		ceq MoveNota1	; Chama Rotina de movimentacao da Nave
		
		loadn R3, #4
		mod R3, R2, R3
		cmp R3, R4		; if (mod(c/10)==0
		ceq MoveNota2	; Chama Rotina de movimentacao da Nave
		
		loadn R3, #4
		mod R3, R2, R3
		cmp R3, R4		; if (mod(c/10)==0
		ceq MoveNota3	; Chama Rotina de movimentacao da Nave
		
		loadn R3, #4
		mod R3, R2, R3
		cmp R3, R4		; if (mod(c/10)==0
		ceq MoveNota4	; Chama Rotina de movimentacao da Nave
	
		inc R2 	;c++
		call Delay
		jmp Loop
	
	halt
	
;---- Fim do Programa Principal -----
	
;---- Inicio das Subrotinas -----

MoveNota1:
	push r0
	push r1
	
	call MoveNota1_RecalculaPos
		
	load r0, posNota1
	load r1, posAntNota1
	
	cmp r0, r1	
	jeq MoveNota1_Skip
	
	call MoveNota1_Apaga
	call MoveNota1_Desenha		
		
	MoveNota1_Skip:	
		pop r1
		pop r0
		rts
	
	MoveNota1_RecalculaPos:		; Recalcula posicao da Nave em funcao das Teclas pressionadas
		push R0
		push R1
		push R2
		push R3

		load R0, posNota1		
		
		loadn R2, #Rand 	; declara ponteiro para tabela rand na memoria!
		load R1, IncRand	; Pega Incremento da tabela Rand
		add r2, r2, r1		; Soma Incremento ao inicio da tabela Rand
							; R2 = Rand + IncRand
		loadi R3, R2 		; busca nr. randomico da memoria em R3
							; R3 = Rand(IncRand)				
		inc r1				; Incremento ++
		loadn r2, #12
		cmp r1, r2			; Compara com o Final da Tabela e re-estarta em 0
		jle MoveNota1_RecalculaPos_Skip
		loadn r1, #0		; re-estarta a Tabela Rand em 0
	 	MoveNota1_RecalculaPos_Skip:
			store IncRand, r1
		
		loadn R1, #1159
		cmp R0, R1		; Testa condicoes de Contorno 
		jgr MoveNota1_Reinicio
		loadn R1, #40
		add R0, R0, R1	; pos = pos + 40
			
	 	MoveNota1_RecalculaPos_Fim:	; Se nao for nenhuma tecla valida, vai embora	 		
			store posNota1, R0
			pop R3
			pop R2
			pop R1
			pop R0
			rts
		
		MoveNota1_Reinicio:
			mov R0, R3
			jmp MoveNota1_RecalculaPos_Fim
	
	
	MoveNota1_Apaga:
		push R0
		push R1
		push R2
		push R3
		push R4
		push R5

		load R0, posAntNota1	; R0 == posAnt
		loadn R1, #1200		; R1 = posAnt
		cmp r0, r1
		jle MoveNota1_Apaga_Skip
		loadn r5, #' '		; Se o Tiro passa sobre a Nave, apaga com um X, senao apaga com o cenario 
		jmp MoveNota1_Apaga_Fim

	 	MoveNota1_Apaga_Skip:	
	  
			; --> R2 = Tela1Linha0 + posAnt + posAnt/40  ; tem que somar posAnt/40 no ponteiro pois as linas da string terminam com /0 !!
			loadn R1, #tela1Linha0	; Endereco onde comeca a primeira linha do cenario!!
			add R2, R1, r0	; R2 = Tela1Linha0 + posAnt
			loadn R4, #40
			div R3, R0, R4	; R3 = posAnt/40
			add R2, R2, R3	; R2 = Tela1Linha0 + posAnt + posAnt/40
			
			loadi R5, R2	; R5 = Char (Tela(posAnt))
	  
	 	MoveNota1_Apaga_Fim:	
			outchar R5, R0	; Apaga o Obj na tela com o Char correspondente na memoria do cenario
			
			pop R5
			pop R4
			pop R3
			pop R2
			pop R1
			pop R0
			rts
		
	
	MoveNota1_Desenha:	; Desenha caractere da Nave
		push R0
		push R1
		push R2
		
		Loadn R1, #'&'	; Nave
		Loadn R2, #1280
		add r1, r1, r2
		load R0, posNota1
		outchar R1, R0
		store posAntNota1, R0	; Atualiza Posicao Anterior da Nave = Posicao Atual
		
		pop R2
		pop R1
		pop R0
		rts

MoveNota2:
	push r0
	push r1
	
	call MoveNota2_RecalculaPos
		
	load r0, posNota2
	load r1, posAntNota2
	
	cmp r0, r1	
	jeq MoveNota2_Skip
	
	call MoveNota2_Apaga
	call MoveNota2_Desenha		
		
	MoveNota2_Skip:	
		pop r1
		pop r0
		rts
	
	MoveNota2_RecalculaPos:		; Recalcula posicao da Nave em funcao das Teclas pressionadas
		push R0
		push R1
		push R2
		push R3

		load R0, posNota2		
		
		loadn R1, #1159
		cmp R0, R1		; Testa condicoes de Contorno 
		jgr MoveNota2_Reinicio
		loadn R1, #40
		add R0, R0, R1	; pos = pos + 40
			
	 	MoveNota2_RecalculaPos_Fim:	; Se nao for nenhuma tecla valida, vai embora	 		
			store posNota2, R0
			pop R3
			pop R2
			pop R1
			pop R0
			rts
		
		MoveNota2_Reinicio:
			loadn R0, #17
			jmp MoveNota2_RecalculaPos_Fim
	
	
	MoveNota2_Apaga:
		push R0
		push R1
		push R2
		push R3
		push R4
		push R5

		load R0, posAntNota2	; R0 == posAnt
		loadn R1, #1200		; R1 = posAnt
		cmp r0, r1
		jle MoveNota2_Apaga_Skip
		loadn r5, #' '		; Se o Tiro passa sobre a Nave, apaga com um X, senao apaga com o cenario 
		jmp MoveNota2_Apaga_Fim

	 	MoveNota2_Apaga_Skip:	
	  
			; --> R2 = Tela1Linha0 + posAnt + posAnt/40  ; tem que somar posAnt/40 no ponteiro pois as linas da string terminam com /0 !!
			loadn R1, #tela1Linha0	; Endereco onde comeca a primeira linha do cenario!!
			add R2, R1, r0	; R2 = Tela1Linha0 + posAnt
			loadn R4, #40
			div R3, R0, R4	; R3 = posAnt/40
			add R2, R2, R3	; R2 = Tela1Linha0 + posAnt + posAnt/40
			
			loadi R5, R2	; R5 = Char (Tela(posAnt))
	  
	 	MoveNota2_Apaga_Fim:	
			outchar R5, R0	; Apaga o Obj na tela com o Char correspondente na memoria do cenario
			
			pop R5
			pop R4
			pop R3
			pop R2
			pop R1
			pop R0
			rts
		
	
	MoveNota2_Desenha:	; Desenha caractere da Nave
		push R0
		push R1
		push R2
		
		Loadn R1, #'@'	; Nave
		Loadn R2, #256
		add r1, r1, r2
		load R0, posNota2
		outchar R1, R0
		store posAntNota2, R0	; Atualiza Posicao Anterior da Nave = Posicao Atual
		
		pop R2
		pop R1
		pop R0
		rts

MoveNota3:
	push r0
	push r1
	
	call MoveNota3_RecalculaPos
		
	load r0, posNota3
	load r1, posAntNota3
	
	cmp r0, r1	
	jeq MoveNota3_Skip
	
	call MoveNota3_Apaga
	call MoveNota3_Desenha		
		
	MoveNota3_Skip:	
		pop r1
		pop r0
		rts
	
	MoveNota3_RecalculaPos:		; Recalcula posicao da Nave em funcao das Teclas pressionadas
		push R0
		push R1
		push R2
		push R3

		load R0, posNota3		
		
		loadn R1, #1159
		cmp R0, R1		; Testa condicoes de Contorno 
		jgr MoveNota3_Reinicio
		loadn R1, #40
		add R0, R0, R1	; pos = pos + 40
			
	 	MoveNota3_RecalculaPos_Fim:	; Se nao for nenhuma tecla valida, vai embora	 		
			store posNota3, R0
			pop R3
			pop R2
			pop R1
			pop R0
			rts
		
		MoveNota3_Reinicio:
			loadn R0, #23
			jmp MoveNota3_RecalculaPos_Fim
	
	
	MoveNota3_Apaga:
		push R0
		push R1
		push R2
		push R3
		push R4
		push R5

		load R0, posAntNota3	; R0 == posAnt
		loadn R1, #1200		; R1 = posAnt
		cmp r0, r1
		jle MoveNota3_Apaga_Skip
		loadn r5, #' '		; Se o Tiro passa sobre a Nave, apaga com um X, senao apaga com o cenario 
		jmp MoveNota3_Apaga_Fim

	 	MoveNota3_Apaga_Skip:	
	  
			; --> R2 = Tela1Linha0 + posAnt + posAnt/40  ; tem que somar posAnt/40 no ponteiro pois as linas da string terminam com /0 !!
			loadn R1, #tela1Linha0	; Endereco onde comeca a primeira linha do cenario!!
			add R2, R1, r0	; R2 = Tela1Linha0 + posAnt
			loadn R4, #40
			div R3, R0, R4	; R3 = posAnt/40
			add R2, R2, R3	; R2 = Tela1Linha0 + posAnt + posAnt/40
			
			loadi R5, R2	; R5 = Char (Tela(posAnt))
	  
	 	MoveNota3_Apaga_Fim:	
			outchar R5, R0	; Apaga o Obj na tela com o Char correspondente na memoria do cenario
			
			pop R5
			pop R4
			pop R3
			pop R2
			pop R1
			pop R0
			rts
		
	
	MoveNota3_Desenha:	; Desenha caractere da Nave
		push R0
		push R1
		push R2
		
		Loadn R1, #'$'	; Nave
		Loadn R2, #2816
		add r1, r1, r2
		load R0, posNota3
		outchar R1, R0
		store posAntNota3, R0	; Atualiza Posicao Anterior da Nave = Posicao Atual
		
		pop R2
		pop R1
		pop R0
		rts
			
MoveNota4:
	push r0
	push r1
	
	call MoveNota4_RecalculaPos
		
	load r0, posNota4
	load r1, posAntNota4
	
	cmp r0, r1	
	jeq MoveNota4_Skip
	
	call MoveNota4_Apaga
	call MoveNota4_Desenha		
		
	MoveNota4_Skip:	
		pop r1
		pop r0
		rts
	
	MoveNota4_RecalculaPos:		; Recalcula posicao da Nave em funcao das Teclas pressionadas
		push R0
		push R1
		push R2
		push R3

		load R0, posNota4		
		
		loadn R1, #1159
		cmp R0, R1		; Testa condicoes de Contorno 
		jgr MoveNota4_Reinicio
		loadn R1, #40
		add R0, R0, R1	; pos = pos + 40
			
	 	MoveNota4_RecalculaPos_Fim:	; Se nao for nenhuma tecla valida, vai embora	 		
			store posNota4, R0
			pop R3
			pop R2
			pop R1
			pop R0
			rts
		
		MoveNota4_Reinicio:
			loadn R0, #29
			jmp MoveNota4_RecalculaPos_Fim
	
	
	MoveNota4_Apaga:
		push R0
		push R1
		push R2
		push R3
		push R4
		push R5

		load R0, posAntNota4	; R0 == posAnt
		loadn R1, #1200		; R1 = posAnt
		cmp r0, r1
		jle MoveNota4_Apaga_Skip
		loadn r5, #' '		; Se o Tiro passa sobre a Nave, apaga com um X, senao apaga com o cenario 
		jmp MoveNota4_Apaga_Fim

	 	MoveNota4_Apaga_Skip:	
	  
			; --> R2 = Tela1Linha0 + posAnt + posAnt/40  ; tem que somar posAnt/40 no ponteiro pois as linas da string terminam com /0 !!
			loadn R1, #tela1Linha0	; Endereco onde comeca a primeira linha do cenario!!
			add R2, R1, r0	; R2 = Tela1Linha0 + posAnt
			loadn R4, #40
			div R3, R0, R4	; R3 = posAnt/40
			add R2, R2, R3	; R2 = Tela1Linha0 + posAnt + posAnt/40
			
			loadi R5, R2	; R5 = Char (Tela(posAnt))
	  
	 	MoveNota4_Apaga_Fim:	
			outchar R5, R0	; Apaga o Obj na tela com o Char correspondente na memoria do cenario
			
			pop R5
			pop R4
			pop R3
			pop R2
			pop R1
			pop R0
			rts
		
	
	MoveNota4_Desenha:	; Desenha caractere da Nave
		push R0
		push R1
		push R2
		
		Loadn R1, #'#'	; Nave
		Loadn R2, #3072
		add r1, r1, r2
		load R0, posNota4
		outchar R1, R0
		store posAntNota4, R0	; Atualiza Posicao Anterior da Nave = Posicao Atual
		
		pop R2
		pop R1
		pop R0
		rts
		
Delay:
	;Utiliza Push e Pop para nao afetar os registradores do programa principal
	push r0
	push r1
	
	loadn r1, #5 				; a
   	Delay_volta2:				;Quebrou o contador acima em duas partes (dois loops de decremento)
	loadn r0, #30000			; b
   	Delay_volta: 
	dec r0						; (4*a + 6)b = 1000000  == 1 seg  em um clock de 1MHz
	jnz Delay_volta	
	dec r1
	jnz Delay_volta2
	
	pop r1
	pop r0
	
	rts

ImprimeScore:
	push r0
	push r1
	push r2
	push r3
	
	call ScoreToChar
	loadn r0, #scoreChar
	loadn r1, #80
	loadn r3, #85
	
	ImprimeScore_Loop:
		loadi r2, r0
		outchar r2, r1
		
		inc r0
		inc r1
		
		cmp r1, r3
		jne ImprimeScore_Loop
	
	pop r3
	pop r2
	pop r1
	pop r0
	
	rts
	

ScoreToChar:
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	
	loadn r0, #scoreChar		; Posicao a salvar a pontuacao
	loadn r1, #48		; 0 em ascii
	load  r2, scoreInt		; Valor da pontuacao
	loadn r3, #10000
	loadn r4, #10
	loadn r6, #0
	
	; Converts each digit of the score to a string
	ScoreToChar_Loop:
		div r5,r2,r3 ; r5 = r2/r3
		add r5,r5,r1 ; Converts the int to char
		
		storei r0,r5 ; Stores the digit and increments 
		inc r0
		
		mod r2,r2,r3 ; r2 = r2 % r5
		
		div r3,r3,r4 ; r3 = r3/10
		
		cmp r3,r6
		jne ScoreToChar_Loop

	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	
	rts

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

	
	
ImprimeTela: 
	;  Rotina de Impresao de Cenario na Tela Inteira
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
	
ImprimeTela2: 	
	;  Rotina de Impresao de Cenario na Tela Inteira
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
	;loadn R6, #tela0Linha0	; Endereco onde comeca a primeira linha do cenario!!
	
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
	
	
telaInicio1Linha0 : string "                                        "
telaInicio1Linha1 : string "                                        "
telaInicio1Linha2 : string "                                        "
telaInicio1Linha3 : string "                                        "
telaInicio1Linha4 : string "                                        "
telaInicio1Linha5 : string "                                        "
telaInicio1Linha6 : string "                                        "
telaInicio1Linha7 : string "                                        "
telaInicio1Linha8 : string "                                        "
telaInicio1Linha9 : string "                                        "
telaInicio1Linha10: string "                                        "
telaInicio1Linha11: string "                                        "
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
telaInicio1Linha29: string "                                        "

telaInicio2Linha0: string  "                                        "
telaInicio2Linha1: string  "    ___          __  _____  ___ _____   "
telaInicio2Linha2: string  "   /     |    | |--|   |   |   | |   |  "
telaInicio2Linha3: string  "  |      |    | ||||   |   |   | |___|  "
telaInicio2Linha4: string  "  |_____ |    | ||||   |   |___| |  |   "
telaInicio2Linha5: string  "  |    | |    | ||||   |   |   | |   |  "
telaInicio2Linha6: string  "   |___/ |____| |__/   |   |   | |    | "
telaInicio2Linha7: string  "                ___    ___   _____      "
telaInicio2Linha8: string  "          |   | |     |   |  |   |      "
telaInicio2Linha9: string  "          |___| |___  |___|  |   |      "
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


telaJogo1Linha0  : string "SCORE   |     |     |     |     |       "
telaJogo1Linha1  : string "        |     |     |     |     |       "
telaJogo1Linha2  : string "        |     |     |     |     |       "
telaJogo1Linha3  : string "        |     |     |     |     |       "
telaJogo1Linha4  : string "        |     |     |     |     |       "
telaJogo1Linha5  : string "        |     |     |     |     |       "
telaJogo1Linha6  : string "        |     |     |     |     |       "
telaJogo1Linha7  : string "        |     |     |     |     |       "
telaJogo1Linha8  : string "        |     |     |     |     |       "
telaJogo1Linha9  : string "        |     |     |     |     |       "
telaJogo1Linha10 : string "        |     |     |     |     |       "
telaJogo1Linha11 : string "        |     |     |     |     |       "
telaJogo1Linha12 : string "        |     |     |     |     |       "
telaJogo1Linha13 : string "        |     |     |     |     |       "
telaJogo1Linha14 : string "        |     |     |     |     |       "
telaJogo1Linha15 : string "        |     |     |     |     |       "
telaJogo1Linha16 : string "        |     |     |     |     |       "
telaJogo1Linha17 : string "        |     |     |     |     |       "
telaJogo1Linha18 : string "        |     |     |     |     |       "
telaJogo1Linha19 : string "        |     |     |     |     |       "
telaJogo1Linha20 : string "        |     |     |     |     |       "
telaJogo1Linha21 : string "        |     |     |     |     |       "
telaJogo1Linha22 : string "        |     |     |     |     |       "
telaJogo1Linha23 : string "        |     |     |     |     |       "
telaJogo1Linha24 : string "        |     |     |     |     |       "
telaJogo1Linha25 : string "        |=====|=====|=====|=====|       "
telaJogo1Linha26 : string "        |     |     |     |     |       "
telaJogo1Linha27 : string "        |     |     |     |     |       "
telaJogo1Linha28 : string "        |     |     |     |     |       "
telaJogo1Linha29 : string "           D     F     J     K          "

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

tela1Linha0  : string "                                        "
tela1Linha1  : string "                                        "
tela1Linha2  : string "                                        "
tela1Linha3  : string "                                        "
tela1Linha4  : string "                                        "
tela1Linha5  : string "                                        "
tela1Linha6  : string "                                        "
tela1Linha7  : string "                                        "
tela1Linha8  : string "                                        "
tela1Linha9  : string "                                        "
tela1Linha10 : string "                                        "
tela1Linha11 : string "                                        "
tela1Linha12 : string "                                        "
tela1Linha13 : string "                                        "
tela1Linha14 : string "                                        "
tela1Linha15 : string "                                        "
tela1Linha16 : string "                                        "
tela1Linha17 : string "                                        "
tela1Linha18 : string "                                        "
tela1Linha19 : string "                                        "
tela1Linha20 : string "                                        "
tela1Linha21 : string "                                        "
tela1Linha22 : string "                                        "
tela1Linha23 : string "                                        "
tela1Linha24 : string "                                        "
tela1Linha25 : string "                                        "
tela1Linha26 : string "                                        "
tela1Linha27 : string "                                        "
tela1Linha28 : string "                                        "
tela1Linha29 : string "                                        "
