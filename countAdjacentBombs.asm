.include "macros.asm"

.globl countAdjacentBombs

countAdjacentBombs:
    save_context

    li		$t6, 0		# $t3 = 0 - count = 0 - start countAdjacentBombs --------------------------------------------------------------------------------

    move 	$t5, $t0		# save $t0
    
    move 	$s4, $s3		# $s4 = column
    move	$s3, $s2		# $s3 = row

    subi	$s1, $s3, 1		            # i = row - 1
    for_i_adj:                          # for (i = row - 1; i <= row + 1; i++)
    addi    $t2, $s3, 1                 # $t2 = row + 1
    bgt		$s1, $t2, end_for_i_adj	    # if i > row + 1 ir para end_for_i_adj
    
        subi	$s2, $s4, 1			    # j = column - 1
        addi    $t2, $s4, 1             # $t2 = column + 1
        for_j_adj:                      # for (j = column - 1; j <= column + 1; ++j)
        bgt		$s2, $t2, end_for_j_adj	# if j > column + 1 ir para end_for_j_adj

            # if (i >= 0 && i < SIZE && j >= 0 && j < SIZE && board[i][j] == -1)
            blt		$s1, $zero, not_if
            bge		$s1, SIZE, not_if
            blt		$s2, $zero, not_if
            bge		$s2, SIZE, not_if

            # board[i][j]
            sll		$t0, $s1, 5
            sll		$t1, $s2, 2
            add		$t0, $t0, $t1
            add		$t0, $t0, $s0
            lw		$t1, 0($t0)

            bne		$t1, -1, not_if

                addi	$t6, $t6, 1			# count++
            
            not_if:

        addi	$s2, $s2, 1		# j++
        j		for_j_adj				# jump to for_j_adj
        end_for_j_adj:

    addi	$s1, $s1, 1	    # i++
    j		for_i_adj		# jump to for_i_adj
    end_for_i_adj:

    restore_context
    jr		$ra
    
    