.data
str: .asciiz "hola"
longitudSTR: .word 0

.code
daddi $sp, r0, 0x400
daddi r1, r0, str ; comienzo de cadena
jal longitud

sd r2, longitudSTR(r0)
halt

longitud: daddi $sp, $sp, -8 ;salvo registros en la pila
	  sd r1, 0($sp)
	  daddi $sp, $sp, -8
	  sd r3, 0($sp)

          daddi r2,r0, 0
loop:	  lbu r3, 0(r1)
	  beqz r3, fin
	  daddi r2, r2, 1
	  daddi r1,r1, 1
	  j loop

fin:	  ld r3, 0($sp) ; restauro registros
	  daddi $sp, $sp, 8
	  ld r1, 0($sp)
	  daddi $sp, $sp, 8
	  jr r31