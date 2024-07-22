	.data
		cadena: .asciiz "Hola"
	.code
	daddi $sp, $sp, 0x400
	daddi $a0, $0, cadena  ; direccion de comienzo
	jal mayus
	halt

mayus:  daddi $sp, $sp, -8 ; salvo direccion de retorno
	sd $ra, 0($sp)
	daddi $sp,$sp, -8
	sd $s0, ($sp)
	dadd $s0, $a0, $0 ;uso s porque sub lo podria pisar, es la direc de la cadena de chars

loop:	lbu $a0, 0($s0) ;traigo primer caracter
	beq $a0, $0, fin; si es  termina
	jal mayusCar

	sb $v0, 0($s0) ; guardo el cambio en cadena
	daddi $s0, $s0, 1; avanzo en el string
	j loop

fin: 	ld $s0, 0($sp)
	daddi $sp, $sp, 8 ; restauro registros
	ld $ra, 0($sp)
	daddi $sp, $sp, 8
	jr $ra

mayusCar: dadd $v0, $a0, $0 ; paso a v0 para el resultado
	  slti $t0, $v0, 0x61 ; si es mas chico que a minus pone 1 en t0
	  bnez $t0, salir ; si t0 es 1 salta a salir
	  slti $t0, $v0, 0x7B
	  beqz $t0, salir ; si es mas grande que z minus salta( si t0 es 0)
	  daddi $v0, $v0, -0x20 ; conversion a mayuscula
salir:    jr $ra