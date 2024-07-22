.data

cadena: 	.asciiz "ejemplo"
result:		.word 0

.code
		daddi $t1, $t0, cadena
		dadd $t2, $0, $0
loop:		lbu $t3, 0($t1)
		daddi $t2, $t2, 2
		bnez $t3, loop
		daddi $t1, $t1, 1
		sd $t2, result($0)
halt