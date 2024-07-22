.data
peso:	.double 63.2
altura:	.double 1.81
IMC:	.double 0.0
estado: .word 0
infrapeso: .double 18.5


.code
l.d f1, infrapeso(r0)
l.d f2, peso(r0)
l.d f3,altura(r0)
mul.d f4,f3,f3   
div.d f5,f2,f4 	
s.d f5, IMC(r0)
daddi r1,r0,25  
mtcl r1,f6
cvt.d.l f6,f7
daddi r2,r0,30 
mtc1 r2,f8
cvt.d.1 f8,f9

c.lt.d f5,f1
bclt infra
c.lt.d f5,f7
bclt normal
c.lt.d f5,f9
bclt sobrep
c.eq.d f9,f5
bclt obeso

fin: halt

infra: r5,r0,1
       sd r5, estado(r0)
       j fin

normal: r5,r0,2
	sd r5,estado(r0)
	jfin
sobrep:	r5,r0,3
	sd r5, estado(r0)
	j fin
obeso:	r5,r0,4
	sd r5, estado(r0)
	j fin
halt