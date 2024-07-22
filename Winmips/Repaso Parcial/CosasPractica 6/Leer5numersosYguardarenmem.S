.data
DIR_CONTROL:	.word32 0x10000
DIR_DATA:	.word32 0x10008
vec:		.word 0,0,0,0,0
.code
lwu $t6, DIR_CONTROL($0)
lwu $t7, DIR_DATA($0)
daddi 	$t0,$0,8 ; leer num
daddi 	$t2,$0,0
daddi 	$t4,$0,5
loop 	sd $t0, 0($t6)
	ld $t1, 0($t7)
	sd $t1,vec($t2)
	daddi $t2, $t2, 8
	daddi $t4, $t4, -1
	bnez $t4, loop
halt