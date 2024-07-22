.data
DIR_CONTROL:	.word32 0x10000
DIR_DATA:	.word32 0x10008
str: 		.asciiz "vamos que se aprueba loco \n"

.code

	lwu $t2, DIR_CONTROL($0)
	lwu $t3, DIR_DATA($0)

	daddi $t0, $0, str
	sd $t0, 0($t3)
	daddi $t4, $0, 10
	daddi $t1, $0, 4
	
loop:	sd $t1, 0($t2)
	daddi $t4, $t4, -1
	bnez $t4, loop
	halt