.data
num1: .word 3
num2: .word 5
.code
ld r1, num1(r0)
ld r2, num2(r0)
daddi r4,r0,0

loop: daddi r2,r2,-1
      bnez r2, loop
      dadd r4,r4,r1
halt