	.data
CONTROL: 	.word32 0X10000
DATA: 		.word32 0X10008

sale:		.byte 0x20
cero:		.byte 0x30
nueve:		.byte 0x39

letras:		.asciiz "cero"
		.asciiz "uno"
		.asciiz "dos"
		.asciiz "tres"
		.asciiz "cuatro"
		.asciiz "cinco"
		.asciiz "seis"
		.asciiz "siete"
		.asciiz "ocho"
		.asciiz "nueve"
		
	.code
	daddi $s0, $0, -1
salto:	jal ingreso
	beq $s0, $v0, final
	dadd $a0, $0, $v0
	jal muestra
	j salto
final:	halt

ingreso: lwu $t2, CONTROL($0)
	 lwu $t3, DATA($0)
	 
	 lbu $t4, cero($0)
	 lbu $t5, nueve($0)
	 lbu $t7, sale($0)
	 daddi $t0, $0, 9 
sigue:	 sd $t0, 0($t2)
	 ld $t1, 0( $t3)
	 bne $t7, $t1, comp
	 daddi $v0, $0, -1
	 j fin_ing

comp:	slt