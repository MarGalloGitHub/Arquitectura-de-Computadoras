	.data
CONTROL: 	.word32 0X10000
DATA: 		.word32 0X10008
str:		.asciiz ".........."

	.code
	lwu $s0 , CONTROL($0)
	lwu $s1 , DATA($0)
	daddi $t0, $0, 6 ; para limpiar pantalla numerica
	daddi $t1, $0, 9 ; para escribir un caracter
	daddi $t2, $0, 0 ; para avanzar en arreglo
	daddi $t3, $0, 9 ; para contar cuantos elementos
	sd $t0, 0($s0)
loop:	sd $t1, 0($s0)
	ld $t4, 0($s1)
	sd $t4, str($t2)
	daddi $t2, $t2, 1
	daddi $t3, $t3, -1
	bnez $t3 , loop

	daddi $t4, $0, str
	sd $t4, 0($s1)
	daddi $t1, $0, 4
	sd $t1, 0($s0)
	halt
	