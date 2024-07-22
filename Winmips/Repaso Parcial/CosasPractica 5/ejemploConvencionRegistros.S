	.data
		datos: .word 2,4,6
	.code
	daddi $s0, $0, 3
	daddi $s1, $0, 0
loop:	ld $a0, datos($s1)
	jal por2
	
	sd $v0, datos($s1)
	daddi $s1, $s1, 8
	daddi $s0, $s0, -1
	bnez $s0, loop
	halt

por2:	daddi $t0, $0, 2
	dmul $v0, $a0, $t0 
	jr $ra