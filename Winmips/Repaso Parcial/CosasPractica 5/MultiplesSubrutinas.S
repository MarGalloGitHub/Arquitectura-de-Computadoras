.code
	daddi $sp, $sp, 0x400
	jal subrutina1
	halt
	
	subrutina2: nop
		    jr $ra

	subrutina1: daddi $sp, $sp, -8
		    sd $ra, 0($sp); guarda direccion de retorno
		
		    jal subrutina2
		    nop

		    ld $ra, 0($sp) ; recupero direccion de retorno
		    daddi $sp, $sp, 8
	            jr $ra