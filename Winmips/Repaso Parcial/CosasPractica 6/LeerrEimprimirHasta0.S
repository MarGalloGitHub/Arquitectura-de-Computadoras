.data
DIR_CONTROL:	.word32 0x10000
DIR_DATA:	.word32 0x10008

.code
lwu $t6, DIR_CONTROL($0)
lwu $t7, DIR_DATA($0)

daddi $t0, $0, 8; leer num
daddi $t2, $0, 0

loop: 	sd $t0, 0($t6)
	ld $t1, 0($t7)
	beqz $t1, fin ; si es 0 salta al final
	dadd $t2, $t2, $t1
	j loop

fin:	sd $t2, 0($t7)
	daddi $t5, $0, 1
	sd $t5, 0 ($t6)
	halt