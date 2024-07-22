	.data
texto: 		.asciiz "Hola, Mundo!"
CONTROL:	.word32 0X10000
DATA:		.word32 0X10008

	.code
	lwu $s0, DATA($0)
	daddi $t0, $0, texto
	sd $t0, 0($s0)
	
	lwu $s1, CONTROL($0)
	daddi $t1, $0, 6
	sd $t1, 0($s1)
	
	daddi $t1, $0, 4
	sd $t1, 0($s1)
	halt