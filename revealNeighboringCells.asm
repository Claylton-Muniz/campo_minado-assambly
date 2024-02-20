.include "macros.asm"

.globl revealNeighboringCells

revealNeighboringCells:
	# save_context

	# recursiva:

	# # $t0 = &board
	# subi	$t1, $s2, 1			# i = row - 1 #test ------------------------------------------------------
	# subi	$t2, $s3, 1			# j = column - 1
	
	# for_i_revealAdj:
	# 	addi	$t8, $s2, 1						# $t8 = row + 1
	# 	bgt		$t1, $t8, end_for_i_revealAdj	# if i > $t8 then goto for_i_revealAdj

	# 	subi	$t2, $s3, 1			# j = column - 1
	# for_j_revealAdj:
	# 	addi	$t9, $s3, 1						# $t9 = column + 1
	# 	bgt		$t2, $t9, end_for_j_revealAdj	# if j > $t9 then goto for_i_revealAdj

	# 	blt		$t1, $zero, fail_vef
	# 	bge		$t1, SIZE, fail_vef
	# 	blt		$t2, $zero, fail_vef
	# 	bge		$t2, SIZE, fail_vef
		
	# 	# pega a board
	# 	sll		$s6, $t1, 5
	# 	sll		$s7, $t2, 2
	# 	add		$s6, $s6, $s7
	# 	add		$s6, $s6, $s0

	# 	lw		$s7, 0($s6)

	# 	li		$a0, -2		# $a0 = -2
	# 	bne		$s7, $a0, fail_vef

	# 	# save
	# 	move 	$t8, $t1
	# 	move 	$t9, $t2

	# 	jal		countAdjacentBombs

	# 	# restore
	# 	move 	$t1, $t8
	# 	move 	$t2, $t9

	# 	move 	$s6, $t6
	# 	move 	$t0, $t5
	# 	sw		$s6, 0($t0)

	# 	bne		$s6, $zero, fail_vef
	# 	move 	$s2, $t1
	# 	move 	$s3, $t2

	# 	# j		recursiva				# jump to recursiva

	# 	fail_vef:

	# 	addi	$t2, $t2, 1			# j++
	# 	j		for_j_revealAdj
	# end_for_j_revealAdj:

	# addi	$t1, $t1, 1					# i++
	# j		for_i_revealAdj				# jump to for_i_revealAdj
	# end_for_i_revealAdj:

	# restore_context
    # jr		$ra