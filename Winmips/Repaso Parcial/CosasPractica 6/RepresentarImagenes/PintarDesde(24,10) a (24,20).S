.data
coorX:		.byte 24; x
coorY:		.byte 10; Y
color:		.byte 0,255,0,0
DIR_CONTROL:	.word32 0x10000
DIR_DATA:	.word32 0x10008

.code
lwu $s6, DIR_CONTROL($0)
lwu $s7, DIR_DATA($0)

lbu 	$s0, coorX($0)
sb 	$s0, 5($s7)
lwu	$s2, color($0)
sw	$s2, 0($s7)
daddi 	$t0, $0, 5
lbu	$s1, coorY($0)
loop:	sb $s1, 4($s7)
	sd $t0, 0($s6)
	daddi $s1,$s1,1 ; avanza en coordenada Y
	slti $s3, $s1,21
	bnez $s3, loop
	halt
	