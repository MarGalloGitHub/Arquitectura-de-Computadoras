.data
str: .asciiz "hola"
longitudSTR: .word 0

.code
daddi r1, r0, str ; comienzo de cadena
jal longitud

sd r2, longitudSTR(r0)
halt

longitud: daddi r2,r0, 0
loop:	  lbu r3, 0(r1)
	  beqz r3, fin
	  daddi r2, r2, 1
	  daddi r1,r1, 1
	  j loop
fin:	  jr r31