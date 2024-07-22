.data
DIR_CONTROL:	.word32  0x10000
DIR_DATA:	.word32  0x10008
FRASE:		.asciiz "el numero pasado a flotante es: "

.code

lwu $s0, DIR_CONTROL($0)
lwu $s1, DIR_DATA($0)

daddi $t0, $0, 6 ; limpio pantalla
sd $t0, 0($s0)

daddi $t1, $0, 8; leo un entero
sd $t1, 0($s0)

ld $t2, 0($s1) ; numero leido

mtc1 $t2, f1 ; paso a registro flotante
cvt.d.l f1,f1 ; convierto a flotante


daddi $s3, $0, FRASE
sd $s3, 0($s1)
daddi $t4, $0, 4
sd $t4, 0($s0)

s.d f1, 0($s1) ;guardo el numero convertido en data
daddi $t5, $0, 3
sd $t5, 0($s0) ; imprimo numero

halt