.data
coorX:		.byte 24; coordenada X
coorY:		.byte 10; coordenada Y
color:		.byte 255, 0, 255, 0 ; color violeta
DIR_CONTROL:	.word32 0x10000
DIR_DATA:	.word32 0x10008

.code
	lwu $s6, DIR_CONTROL($0)
	lwu $s7, DIR_DATA($0)
	lbu $s0, coorX($0)
	sb $s0, 5($s7); 	DATA + 5 guardo coorX
	lbu $s1, coorY($0)
	sb $s1, 4($s7);		DATA + 4 guardo coorY
	lwu $s2, color($0);	color
	sw $s2, 0($s7);		DATA color
	daddi $s3, $0, 5;		salida grafica
	sd $s3, 0($s6)
halt