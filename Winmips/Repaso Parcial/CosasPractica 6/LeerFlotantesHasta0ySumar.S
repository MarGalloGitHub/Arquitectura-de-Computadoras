.data
DIR_CONTROL:	.word32 0x10000
DIR_DATA:	.word32 0x10008
cero:		.double 0

.code
lwu $t6, DIR_CONTROL($0)
lwu $t7, DIR_DATA($0)

daddi $t0, $0, 8; leer num
l.d f0, cero($0)
ld. f2, cero($0)

loop:	sd $t0, 0($t6)
	l.d f1, 0($t7)
	c.eq.d f2,f1 ; deja cero en fp si son iguales
	bc1t fin
	add.d f0,f0, f1
	j loop

fin:	sd f0, 0($t7)
	daddi $t5,$0, 3
	sd $t5, 0($t6)
	halt