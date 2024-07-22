.data
tabla: .word 1,2,3,4,5,6,7,8,9,10
cant: .word 0 
X: .word 5
RES: .word 0


.code
daddi r7,r0,0
daddi r9,r0,10
ld r1, X(r0)
daddi r2, r0, 0
loop: ld r3, tabla(r2)
      slt r4,r1,r3
      bnez r4, mayor
      daddi r5,r0,0
      sd r5, RES(r2)
next: daddi r2,r2,8
      daddi r9,r9, -1
      bnez r9, loop
      j fin

mayor: daddi r5,r0,1
       sd r5, RES(r2)
       daddi r7,r7 , 1 
       j next     

fin:  sd r7, cant(r0)
      halt