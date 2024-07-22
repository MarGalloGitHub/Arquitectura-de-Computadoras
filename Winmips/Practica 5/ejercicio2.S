.data
base:	.double 5.85
altura:	.double 13.47
division: .double 0.0

.code
	l.d f1,base(r0)
	l.d f2,altura(r0)
	mul.d f3,f1,f2
	daddi r2,r0,2
	mtc1  r2,f4
	cvt.d.l f5,f4
	div.d f6,f3,f5
	s.d f6,division(r0)
halt