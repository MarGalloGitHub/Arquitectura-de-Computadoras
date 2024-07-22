.data
DIR_CONTROL:	.word 0x10000
DIR_DATA:	.word 0x10008

.code

lwu $t6, DIR_CONTROL($0)
lwu $t7, DIR_DATA($0)

daddi $t0, $0, 8 

sd $t0, 0($t6)
ld $t1, 0($t7); leo num1

sd $t0, 0($t6)
ld $t2, 0($t7); leo num2

dadd $t3, $t1, $t2 

sd $t3, 0($t7) ; guardo resultado en data

daddi $t4, $0, 1
sd $t4, 0($t6) ; imprimo resultado
halt