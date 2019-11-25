// Trabalho final de Organização e Arquitetura de Computadores 2/2019
// Professora: Carla Koike
// Alunos:
// João Pedro Assis dos Santos - 17/0146367
// Estevam Galvão Albuquerque - 16/0005663
// Patrick Vitas Reguera Beal - 15/0143672
// Iuri Cardoso Araújo - 12/0013606


.eqv N 10

.data
vetor: .word 10, 9, 8, 7, 6, 5, 4, 3, 2, 1
newl:	.asciiz "\n"
tab:	.asciiz "\t"
TEXTO1: .asciiz "\nShow:\n"
TEXTO2: .asciiz "\nSort:\n"
pt:	.asciiz "."

.text

main:
	LDA X9, vetor		// Load vector address into X9 register
	ADDI X10, XZR, N	// Load vector size into X10 register
	BL show
	
	LDA X0,vetor
	ADDI X1,XZR,N
	BL sort

	LDA X9,vetor
	ADDI X10,XZR,N
	BL show	
	
	ADDI X8,XZR,#10
	SVC 0
	
sort:
	ORR X21,XZR,X0		// Copying vector adress to X21
	ORR X22,XZR,X1		// Copying vector size to X22
	
	ORR X19,XZR,XZR		// X19 = 0 (i.e int i = 0)
	
for1:	
	SUBS X23,X19,X22	// N - i
	CBZ X23, exit
	BR X30
	
	
show:	LDA X7,TEXTO1
	ADDI X8,XZR,#4
	SVC 0
	ADD X1,X9,XZR
	ADD X2,X10,XZR
	ADD X3,XZR,XZR
	
loop1:  SUBS X4,X2,X3
        B.EQ fim1
	ADDI X8,XZR,#1
	ADD  X20,X9,XZR
	LDUR X7,[X20,#0]
	SVC  0
        LDA X7,tab
	ADDI X8,XZR,#4
	SVC 0	
	ADDI X9,X9,#4
	ADDI X3,X3,#1	
        B loop1
        
fim1:	LDA X7,newl
	ADDI X8,XZR,#4
	SVC 0	
	BR  X30
	
