.data
X: .word 0
Y: .word 0
A: .word 0


.code
daddi r1,r0, 5
daddi r2,r0, 4
daddi r3,r0, 7
sd r1, X(r0)
sd r2, Y(r0)
sd r3, A(r0)
loop: ld r4, Y(r0)
      ld r5, X(r0)
      dadd r5, r5, r4
      sd r5, X(r0)
      ld r6, A(r0)
      daddi r6,r6, -1
      bnez r6, loop
      sd r6, A(r0)
halt