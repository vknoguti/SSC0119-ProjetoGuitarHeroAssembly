# SSC0119 - Prática em Organização e Arquitetura de Computadores
## Professor: Eduardo do Valle Simões

## Membros
| **Aluno**                         | **nUSP** |
|-----------------------------------|-----------|
| Vinicius Kazuo Fujikawa Noguti    | 11803121  |
| Thiago Shimada                    | 12691032  |


## Modificações na CPU
Implementação da instrução aritmética NAND.
## NAND
### defs.h
```c
#define BREAKP_CODE             94
#define LMOD_CODE               95
#define NOP_CODE                0
#define INPUT_CODE              96
#define OUTPUT_CODE             97
#define NAND_CODE				98

/* Logic Instructions (All should begin with "01"): */
#define LAND            "010010"
#define LOR             "010011"
#define LXOR            "010100"
#define LNOT            "010101"
#define SHIFT           "010000"
#define CMP             "010110"
#define LNAND			"010001"

/* NAND */
#define NAND_STR				"NAND"
```
### montador.c
```c
/* Instrucoes de 3 argumentos e 1 linha : instr (), (), () -> [...] */
            case ADD_CODE :
            case ADDC_CODE :
            case SUB_CODE :
            case SUBC_CODE :
            case MUL_CODE :
            case DIV_CODE :
	        case LMOD_CODE :	    
            case AND_CODE :
            
            /* NAND */
            case NAND_CODE :
            
            case OR_CODE :
            case XOR_CODE :
                parser_SkipUntil(',');
                parser_SkipUntil(',');
                parser_SkipUntilEnd();
                end_cnt++;
                break;
             
            .
            .
            .
             
             /* ==============
                   Nand Rx, Ry, Rz
                   ==============
                */
                
                case NAND_CODE :
                    str_tmp1 = parser_GetItem_s();
                    val1 = BuscaRegistrador(str_tmp1);
                    free(str_tmp1);
                    parser_Match(',');
                    str_tmp2 = parser_GetItem_s();
                    val2 = BuscaRegistrador(str_tmp2);
                    free(str_tmp2);
                    parser_Match(',');
                    str_tmp3 = parser_GetItem_s();
                    val3 = BuscaRegistrador(str_tmp3);
                    free(str_tmp3);
                    str_tmp1 = ConverteRegistrador(val1);
                    str_tmp2 = ConverteRegistrador(val2);
                    str_tmp3 = ConverteRegistrador(val3);
                    sprintf(str_msg,"%s%s%s%s0",LNAND,str_tmp1,str_tmp2,str_tmp3);
                    free(str_tmp1);
                    free(str_tmp2);
                    free(str_tmp3);
                    parser_Write_Inst(str_msg,end_cnt);
                    end_cnt += 1;
                    break;
            .
            .
            .
            
            else if (strcmp(str_tmp,NAND_STR) == 0)
            {
                return NAND_CODE;
            }
```
## Guitar Hero
O jogo é uma implementação em Assembly do tão conhecido jogo Guitar Hero.
### Modo de Jogar
O usuário deve pressionar D, F, J, K no momento exato em que as teclas sobrepõem o símbolo representado pelo '='. Caso acerte, sua pontuação score aumentará em 20, caso contrário, não aumentará. 
O objetivo do jogo é marcar a máxima pontuação possível durante a partida. Ao final é exibido seu score na tela final, perguntando se o player deseja jogar novamente.

### Telas de Jogo

![inicio1](https://user-images.githubusercontent.com/37368029/181780868-00124224-42f7-40b0-bb88-a5f6f5c08a24.png)


Ao pressionar a tecla no momento exato a pontuação do score aumenta.
![imagemjogo1](https://user-images.githubusercontent.com/37368029/181780889-255e1f62-9465-4dcc-9c0a-5a3124e7c67e.png)

Ao fim do round o programa exibe o score acumulado e pergunta se o player deseja jogar novamente.
![imagemfim1](https://user-images.githubusercontent.com/37368029/181780921-a04d15fb-3002-409a-81d8-be876ff27b4d.png)


          
