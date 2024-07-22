.data

cadena: .asciiz "abcdeaghajklen"
car: .asciiz "a"
cant: .word 0


.code
lbu r1, car(r0)
dadd r2,r0,r0
dadd r3,r0,r0
loop:	lbu r4, cadena(r2)
	beq r4,r1, sison
volver:	daddi r2,r2, 8
	bnez r4, loop 
	j fin

sison:	daddi r3,r3, 1      
	sd r3,cant(r0)
	j volver

fin: halt