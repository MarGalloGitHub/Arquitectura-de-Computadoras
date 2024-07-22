.code
daddi r29, r0, 0x400 ; pila
daddi r4, r0,  10
daddi r6, r0, 20

daddi r29, r29, -8; push
sd r4, 0(r29) 

daddi r29, r29, -8
sd r6, 0(r29)

ld r4, 0(r29)   ; pop
daddi r29, r29, 8

ld r6, 0(r29)
daddi r29, r29, 8

halt