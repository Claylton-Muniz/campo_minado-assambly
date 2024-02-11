.include "macros.asm"

.globl checkVictory

checkVictory:
    save_context

    li		$v0, 1		# $v0 = 0 - parar o jogo - win

    li		$t0, 0		# $t0 = 0 - count = 0 - start checkVitory

    li		$s1, 0		# $s1 = 0 - i = 0
    begin_for_i_check:  # for (i = 0; i < SIZE; i++)
    bge		$s1, SIZE, end_for_i_check	# if $s1 >= SIZE ir para end_for_i_check
        
        li		$s2, 0		# $s2 = 0 - j = 0
        begin_for_j_check:  # for (j = 0; j < SIZE; j++)
        bge		$s2, SIZE, end_for_j_check	# if $s2 >= SIZE ir para end_for_j_check

           sll		$t1, $s1, 5
           sll		$t2, $s2, 2
           add		$t1, $t1, $t2		    # calculo da linha e coluna - calc_i_j
           add		$t1, $t1, $s0		    # board[i][j] <- endereco + calc_i_j
           lw		$t2, 0($t1)             # $t2 = board[i][j]
           bge		$t2, $zero, if_open	    # if $t2 >= $zero ir para if_open
           j		end_if_open			    # ir para end_if_open
           if_open:
                addi	$t0, $t0, 1			# count++
           end_if_open:

        addi	$s2, $s2, 1			    # $s2 = $s2 + 1 - j++
        j		begin_for_j_check	    # volte para end_for_j_check
        end_for_j_check:
    
    addi	$s1, $s1, 1			        # $s1 = $s1 + 1 - i++
    j		begin_for_i_check			# volte para begin_for_i_check
    end_for_i_check:

    li		$t1, SIZE		            # $t1 = SIZE
    mul 	$t2, $t1, $t1               # $t2 = SIZE * SIZE
    sub		$t1, $t2, BOMB_COUNT	    # $t1 = $t2 - BOMB_COUNT
    blt		$t0, $t1, if_count_bomb	    # if (count < SIZE * SIZE - BOMB_COUNT)
    j		end_if_count_bomb			# ir para end_if_count_bomb
    if_count_bomb:
        li		$v0, 0		# $v0 = 0 - continue o jogo
    end_if_count_bomb:
    
    restore_context
    jr		$ra				    # retorna ao end. q chamou a função