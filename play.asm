.include "macros.asm"

.globl play

play:
    save_context
    
    sll		$t0, $s2, 5			# calc_i = i * 2^5
    sll		$t1, $s3, 2			# calc_j = j * 2^2
    add		$t0, $t0, $t1		# end[i][j] = calc_i + calc_j
    add		$t0, $t0, $s0		# board[i][j] = end[i][j] + board

    lw		$t1, 0($t0)	    	# $t1 = board[i][j]
    
    restore_context
    jr		$ra					# retorna ao end. q chamou a função
    
    
