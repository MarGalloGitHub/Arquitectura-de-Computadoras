.data
DIR_CONTROL:	.word32 0x10000
DIR_DATA:	.word32 0x10008
str: 		.asciiz "vamos que se aprueba loco"

.code

lwu $t2, DIR_CONTROL($0)
lwu $t3, DIR_DATA($0)

daddi $t0, $0, str
sd $t0, 0($t3)

daddi $t1, $0, 4
sd $t1, 0($t2)
halt