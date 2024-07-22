.data
DIR_CONTROL:	.word32 0x10000
DIR_DATA:	.word32 0x10008
A:		.word 25
B:		.word 50

.code
lwu $t2, DIR_CONTROL($0)
lwu $t3, DIR_DATA($0)

ld $t0, A($0)
ld $t1, B($0)

dadd $t5, $t0, $t1 ; suma

sd $t5, 0($t3) ; pongo valor en data
daddi $t4, $0, 1 ; 1 para entero sin signo
sd $t4, 0($t2) ; pongo valor en control para imprimir
halt