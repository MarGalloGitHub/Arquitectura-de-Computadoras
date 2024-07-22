.data

DIR_CONTROL:	.word32 0x10000
DIR_DATA:	.word32 0x10008
corte:		.ascii "."
cero:		.word "0"
A:		.ascii "a"
E:		.ascii "e"
I:		.ascii "i"
S:		.ascii "s"
T:		.ascii "t"
cadena:		.byte 0

.code
daddi $sp, $sp , 0x400 ; 		inicializo pila
ld $a0, corte($0);			valor de corte
daddi $a1, $0, cadena;			direccion de cadena
jal str_read ;				primera sub
jal str_leet;				segunda
halt


str_read:	dadd $t5, $0, $0 ; para moverme por string
		lwu $s1, DIR_CONTROL($0)
	  	lwu $s2, DIR_DATA($0)
		daddi $s3, $0, 9
loop1:		sd $s3, 0($s1)     ; leo un caracter de teclado
		lbu $t1, 0($s2)	 ; me traigo valor leido
		beq $t1, $a0, fin
		sd $t1, 0($a1)
		daddi $a1,$a1, 1
		j loop1


fin:		dadd $t6, $0, $0
		sd $t6, 0($a1)
		jr $ra
		 

str_leet:	daddi $sp, $sp, -8  ;guardo direc de retorno
		sd $ra, 0($sp)
		daddi $a1, $0, cadena  ;cadena
		jal car_leet;          ;tercera subrutina
		
		ld $ra, 0($sp)       ; restauro ra
		daddi $sp, $sp, 8
		jr $ra
		
car_leet:	daddi $s2, $0, cero
loop2:		ld $t2, 0($a1) ; caracter de la cadema
		ld $t3, A($0) 		;valores para comparar
		ld $t4, E($0)
		ld $t5, I($0)
		ld $t6, S($0)
		ld $t7, T($0)
		
		beq $t2, $s2, finCAR ; si es cero termina

		beq $t2, $t3, esA
		beq $t2, $t4, esE
		beq $t2, $t5, esI
		beq $t2, $t6, esS
		beq $t2, $t7, esT

armar:		sd $t2, 0($a1)
		daddi $a1, $a1, 1
		j loop2
		
finCAR:		daddi $a1, $a1, 1
		daddi $t0, $0, cero
		sd $t0, 0($a1)
		jr $ra	

	
esA:	daddi $t2, $0, 4
	j armar

esE:	daddi $t2,$0, 3
	j fin

esI:	daddi $t2,$0, 1
	j armar

esS:	daddi $t2,$0, 0
	j armar

esT:  	daddi $t2,$0, 5
	j armar