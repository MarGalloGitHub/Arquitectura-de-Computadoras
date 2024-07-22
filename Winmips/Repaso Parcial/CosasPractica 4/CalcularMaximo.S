	.data
V: 	.word 4, 10, 512, 8, 16
C:	.word 0

	.code
	daddi r2,r0,0 ; maximo inicial
	daddi r3,r0,5 ; elementos del vector
	daddi r5,r0,0 ; desplazamiento

loop:	ld r1, V(r5)
	slt r4, r1, r2 ; si r1 es mas chico que r2 guarda 1 en r4
	bnez r4, min
	daddi r2, r1, 0 ; nuevo valor maximo
min:	daddi r5, r5, 8
	daddi r3, r3, -1
	bnez r3, loop

sd r2, C(r0)
halt