.data
result: .word 0
.code

daddi r4, r0, 4
daddi r5, r0, 3
jal sumar

sd r2, result(r0)
halt


sumar: dadd r2, r4, r5
       jr r31