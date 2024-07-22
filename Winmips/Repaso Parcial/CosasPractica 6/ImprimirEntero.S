.data

DIR_CONTROL:	.word32 0x10000
DIR_DATA:	.word32 0x10008
num:		.word 5

.code
ld $t2, DIR_CONTROL($0)
ld $t3, DIR_DATA($0)

ld $t1, num($0) ; cargo el num
sd $t1, 0($t3) ; guardo en data

daddi $t1, $0, 1 ; 1 para imprimir numero entero sin signo
sd $t1, 0($t2)
halt