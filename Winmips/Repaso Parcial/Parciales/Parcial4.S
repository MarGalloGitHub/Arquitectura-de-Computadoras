.data
DIR_CONTROL:	.word32 0x10000
DIR_DATA:	.word32 0X10008
VALOR:		.double 7.0
ResultEs:	.asciiz "El resultado es:"

.code
lwu $s0, DIR_CONTROL($0)
lwu $s1, DIR_DATA($0)
daddi $s4,$0,ResultEs ;ld $s4, ResultEs($0)

daddi $t0, $0, 8
sd $t0, 0($s0)

l.d f1, 0($s1)   ; valor ingresado
l.d f2, VALOR($0) ; valor a comparar	

c.lt.d f2,f1 ; si el primero es menor al segundo
bc1t calculoMayor

c.lt.d f2,f1
bc1f calculoMenor

l.d f3, VALOR($0)

fin: 	sd $s4, 0($s1) ; con esto imprimo mensaje
	daddi $t3, $0, 4
	sd $t3, 0($s0)   
	s.d f3, 0($s1)  ; con esto imprimo resultado
	daddi $t6, $0, 3
	sd $t6, 0($s0)
	halt

calculoMayor: sub.d f3, f1, f2 ; al ingresado le resto el que compara
	      mul.d f3, f3, f1 ; el resultado se multi por el ingresado
	      j fin


calculoMenor: sub.d f3, f2,f1 
	      div.d f3, f3, f1	
	      j fin