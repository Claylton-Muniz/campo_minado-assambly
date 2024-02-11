.include "macros.asm"

.globl checkVictory

checkVictory:
    save_context
    li		$t0, 0		# $t0 = 0 - count = 0 - start checkVitory

    li		$s1, 0		# $s1 = 0 - i = 0
    begin_for_i_check:  # for (i = 0; i < SIZE; i++)
    bge		$s1, SIZE, end_for_i_check	# if $s1 >= SIZE ir para end_for_i_check
        
        li		$s2, 0		# $s2 = 0 - j = 0
        begin_for_j_check:  # for (j = 0; j < SIZE; j++)
        bge		$s2, SIZE, end_for_j_check	# if $s2 >= SIZE ir para end_for_j_check



        addi	$s2, $s2, 1			# $s2 = $s2 + 1 - j++
        j		begin_for_j_check	    # volte para end_for_j_check
        end_for_j_check:
    
    addi	$s1, $s1, 1			# $s1 = $s1 + 1 - i++
    j		begin_for_i_check				# volte para begin_for_i_check
    end_for_i_check:
    # ocorreu um pequeno erro de lógica no code, o 0 continua o jogo e 1 vence
    li		$v0, 0		# $v0 = 0 - continue o jogo
    
    
    restore_context
    jr		$ra				    # retorna ao end. q chamou a função