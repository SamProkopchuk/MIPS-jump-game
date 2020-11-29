.data
	display_address: .word	0x10008000
	# divsu stands for div size // unit
	# Or in other words screen_size / pixels_per_unit
	divsu:           .word  32 # 512 // 16 is a good one.
	# entity_xywh will store the x, y, w, h info of an entity.
	# It will allow the pain_entity function's code to be a lot cleaner.
	entity_xywh:     .space 16
	# The player is a struct with 4 words.
	# x, y, xvel, yvel
	player:          .space 16
	# Each platform is a struct with 3 words
	# exists, x, y
	# And we will have up to 5 platforms. => 5x3x4
	platforms:       .space 60
	bg:              .word  0xfffdd0
	platform_color:  .word  0x388e3c
	player_color:    .word  0x000000
	newline:         .asciiz "\n"

.text
main:
	lw $a0, bg
	jal paint_bg
	jal init_entities

	main_LOOPINIT:
		move $s0, $0
		li $s1, 1
		sll $s1, $s1, 10
	main_WHILE:
		bge $s0, $s1, main_END
	main_DO:
		la $a0, bg
		jal paint_entities
		addi $s0, $s0, 1
	main_END:
exit:
	li $v0, 10
	syscall


paint_bg:
	lw $t0, display_address
	move $t1, $a0 # The color
	paint_bg_LOOPINIT:
		move $t2, $0
		li $t3, 1
		sll $t3, $t3, 10
	paint_bg_WHILE:
		bge $t2, $t3, paint_bg_END
	paint_bg_DO:
		sw $t1, 0($t0)
		addi $t0, $t0, 4
		addi $t2, $t2, 1
		j paint_bg_WHILE
	paint_bg_END:
	jr $ra


init_platforms:
	la $t0, platforms
	li $t5, 31
	# First add platform 0 which will
	# be the one the player starts on:

	li $t1, 1
	sw $t1, 0($t0)
	li $t1, 10
	sw $t1, 4($t0)
	sw $t5, 8($t0)
	addi $t0, $t0, 12

	li $t4, 6
	init_platforms_LOOPINIT:
		move $t2, $0
		li $t3, 4
	init_platforms_WHILE:
		bge $t2, $t3, init_platforms_END
	init_platforms_DO:
		sub $t5, $t5, $t4
		li $t1, 1
		sw $t1, 0($t0)
		li $v0, 42
		li $a1, 21
		syscall
		sw $a0, 4($t0)
		sw $t5, 8($t0)
		addi $t0, $t0, 12
		addi $t2, $t2, 1
		j init_platforms_WHILE
	init_platforms_END:
	jr $ra


init_player:
	la $t0, player
	li $t1, 16
	sw $t1, 0($t0)
	li $t1, 30
	sw $t1, 4($t0)
	sw $0, 8($t0)
	sw $0, 12($t0)
	jr $ra


init_entities:
	addi $sp, $sp, -4
	# Push $ra onto the stack
    sw $ra, 0($sp)
	jal init_platforms
	jal init_player
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

paint_entity:
	# $a0 -> color
	lw $t0, display_address
	la $t1, entity_xywh
	lw $t2, 0($t1)  # x
	lw $t3, 4($t1)  # y
	lw $t4, 8($t1)  # w
	lw $t5, 12($t1) # h

	lw $t8, divsu
	mul $t3, $t3, $t8
	add $t3, $t3, $t2
	sll $t3, $t3, 2
	add $t0, $t0, $t3
	# [$t0 := disp_addr] +=  y * divsu + x
	dy_LOOPINIT:
		move $t6, $0
	dy_WHILE:
		bge $t6, $t5, dy_END
	dy_DO:
		dx_LOOPINIT:
			move $t7, $0
		dx_WHILE:
			bge $t7, $t4, dx_END
		dx_DO:
			sw $a0, 0($t0)
			addi $t0, $t0, 4
			addi $t7, $t7, 1
			j dx_WHILE
		dx_END:
		add $t0, $t0, $t8
		addi $t6, $t6, 1
		j dy_WHILE
	dy_END:
	jr $ra


paint_platforms:
	la $t0, platforms
	la $t3, entity_xywh
	paint_platforms_LOOPINIT:
		move $t1, $0
		li $t2, 5
	paint_platforms_WHILE:
		bge $t1, $t2, paint_platforms_END
	paint_platforms_DO:
		lw $t4, 0($t0)
		beqz $t4, paint_platforms_UPDATE
		lw $t4, 4($t0)
		sw $t4, 0($t3)
		lw $t4, 8($t0)
		sw $t4, 4($t3)
		li $t4, 10
		sw $t4, 8($t3)
		li $t4, 1
		sw $t4, 12($t3)

		addi $sp, $sp -4
		sw $t0, 0($sp)
		addi $sp, $sp -4
		sw $t1, 0($sp)
		addi $sp, $sp -4
		sw $t2, 0($sp)
		addi $sp, $sp -4
		sw $t3, 0($sp)
		addi $sp, $sp -4
		sw $t4, 0($sp)
		addi $sp, $sp -4
		sw $ra, 0($sp)
		jal paint_entity
		lw $ra, 0($sp)
		addi $sp, $sp, 4
		lw $t4, 0($sp)
		addi $sp, $sp, 4
		lw $t3, 0($sp)
		addi $sp, $sp, 4
		lw $t2, 0($sp)
		addi $sp, $sp, 4
		lw $t1, 0($sp)
		addi $sp, $sp, 4
		lw $t0, 0($sp)
		addi $sp, $sp, 4
	paint_platforms_UPDATE:
		addi $t0, $t0, 12
		addi $t1, $t1, 1
		j paint_platforms_WHILE
	paint_platforms_END:
	jr $ra

paint_player:

paint_entities:
	addi $sp, $sp, -4
	# Push $ra onto the stack
	sw $ra, 0($sp)
	lw $a0, platform_color
	jal paint_platforms
	# jal paint_player
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
