.data
	# iskeypressed_address: .word  0xFFFF0000
	# key_address:          .word  0xFFFF0004
	left_key:           .word   0x6A # j
	right_key:          .word   0x6B # k
	start_key:          .word   0x73 # s
	b10_3x5_pixels:     .byte   1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1 # 0
						.byte 	0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0 # 1
						.byte	1, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1 # 2
						.byte	1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 1, 1, 0 # 3
						.byte	1, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1 # 4
						.byte	1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 1, 1, 0 # 5
						.byte	0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0 # 6
						.byte	1, 1, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0 # 7
						.byte	0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0 # 8
						.byte	0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 0 # 9
	score:              .word   0
	display_address:    .word	0x10008000
	# divsu stands for div size // unit
	# Or in other words screen_size / pixels_per_unit
	divsu:              .word   32 # 512 // 16 is a good one.
	# entity_xywh will store the x, y, w, h info of an entity.
	# It will allow the paint_entity function's code to be a lot cleaner.
	entity_xywh:        .space  16
	# The player is a struct with 4 words.
	# x, y, xvel, yvel
	player:             .space  16
	# Each platform is a struct with 3 words
	# horizontal_vel, x, y
	# And we will have up to 5 platforms. => 5x3x4
	platforms:          .space  60
	scroll_threshold:   .word   6
	bg:                 .word   0x424242
	platform_color:     .word   0x00e5ff
	player_color:       .word   0xffffff
	score_color:        .word   0x757575
	newline:               .asciiz "\n"

.text
main:
	lw $s2, start_key
	main_MENU:
	jal get_key_pressed
	bne $v0, $s2, main_MENU

	main_START:
	lw $a0, bg
	jal paint_bg

	jal init_entities

	main_LOOPINIT:
	main_WHILE:
	main_DO:
		jal update_entities
		jal paint_entities

		li $v0, 32
		li $a0, 30
		syscall

		jal exit_if_game_over
		jal erase_entities

		j main_WHILE
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
		li $a1, 23
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
		# beqz $t4, paint_platforms_UPDATE
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
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	la $t0, player
	la $t1, entity_xywh
	lw $t2, 0($t0)
	sw $t2, 0($t1)
	lw $t2, 4($t0)
	sw $t2, 4($t1)
	li $t2, 1
	sw $t2, 8($t1)
	sw $t2, 12($t1) 
	jal paint_entity

	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra


paint_score:
	lw $t0, score
	lw $t1, divsu
	la $t2, b10_3x5_pixels
	lw $t9, display_address
	paint_score_LOOPINIT:
		move $t3, $t1
		addi $t3, $t3, -3
	paint_score_WHILE:
		blt $t3, $0, paint_score_END
	paint_score_DO:
		li $t6, 10
		div $t0, $t6
		mflo $t0
		mfhi $t7
		li $t6, 15
		mul $t7, $t7, $t6

		addu $t7, $t7, $t2
		paint_score_drow_LOOPINIT:
			li $t4, 0
		paint_score_drow_WHILE:
			li $t6, 5
			bge $t4, $t6, paint_score_drow_END
		paint_score_drow_DO:
			paint_score_dcol_LOOPINIT:
				li $t5, 0
			paint_score_dcol_WHILE:
				li $t6, 3
				bge $t5, $t6, paint_score_dcol_END
			paint_score_dcol_DO:
				lbu $t6, 0($t7)
				beqz $t6, paint_score_dcol_UPDATE
				# Calculate the display address of number's pixel:
				mul $t6, $t1, $t4
				add $t6, $t6, $t3
				add $t6, $t6, $t5
				sll $t6, $t6, 2
				add $t6, $t6, $t9
				# Finally we have $t6 =
				# DISP_ADDR + 4 * ((n + dcol) + drow * divsu)
				sw $a0, 0($t6)
			paint_score_dcol_UPDATE:
				addi $t7, $t7, 1
				addi $t5, $t5, 1
				j paint_score_dcol_WHILE
			paint_score_dcol_END:
			addi $t4, $t4, 1
			j paint_score_drow_WHILE
		paint_score_drow_END:
		addi $t3, $t3, -4
		j paint_score_WHILE
	paint_score_END:
	jr $ra


paint_entities:
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	lw $a0, score_color
	jal paint_score
	lw $a0, platform_color
	jal paint_platforms
	lw $a0, player_color
	jal paint_player

	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra


erase_entities:
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	lw $a0, bg
	jal paint_score
	jal paint_platforms
	jal paint_player
	lw $ra, 0($sp)

	addi $sp, $sp, 4
	jr $ra


init_platform:
	# Given $a0 := address of single platform, randomly reinitialize it at the top
	move $t0, $a0
	sw $0, 0($t0)
	sw $0, 8($t0)
	li $v0, 42
	li $a1, 23
	syscall
	sw $a0, 4($t0)
	jr $ra


update_platforms:
	# $a0 -> scroll
	update_platforms_IF:
		beqz $a0, update_platforms_ENDIF
		# bne $a0, $0, ENDIF
	update_platforms_THEN:
		la $t2, platforms
		lw $t3, divsu
		update_platforms_LOOPINIT:
			move $t0, $0
			li $t1, 5
		update_platforms_WHILE:
			bge $t0, $t1, update_platforms_END
		update_platforms_DO:
			lw $t4, 8($t2)
			addi $t4, $t4, 1

			bne $t4, $t3, update_platforms_case_no_reinitialize
			update_platforms_case_reinitialize:
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

				move $a0, $t2
				jal init_platform

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

				j update_platforms_endcases
			update_platforms_case_no_reinitialize:
				sw $t4, 8($t2)
			update_platforms_endcases:
			addi $t0, $t0, 1
			addi $t2, $t2, 12
			j update_platforms_WHILE
		update_platforms_END:
	update_platforms_ENDIF:

	jr $ra


update_player:
	# Assume velocities are correct.
	# Update position based upon them.
	# Return (with $v0) 1 if player's new y pos would be less than 6, 0 otherwise
	la $t0, player
	lw $t1, 8($t0)
	lw $t3, scroll_threshold
	lw $t4, divsu

	update_player_x_case_0:
		beqz $t1, update_player_x_endcases
	update_player_x_case_left:
		bgt $t1, $0, update_player_x_case_right
		lw $t2, 0($t0)
		addi $t2, $t2, -1
		add $t2, $t2, $t4
		div $t2, $t4
		mfhi $t2
		sw $t2, 0($t0)
		j update_player_x_endcases
	update_player_x_case_right:
		ble $t1, $0, update_player_x_endcases
		lw $t2, 0($t0)
		addi $t2, $t2, 1
		add $t2, $t2, $t4
		div $t2, $t4
		mfhi $t2
		sw $t2, 0($t0)
		j update_player_x_endcases
	update_player_x_endcases:

	lw $t1, 12($t0)
	update_player_y_case_0:
		beqz $t1, update_player_y_endcases
	update_player_y_case_down:
		blt $t1, $0, update_player_y_case_up
		lw $t2, 4($t0)
		addi $t2, $t2, 1
		sw $t2, 4($t0)
		j update_player_y_endcases
	update_player_y_case_up:
		bgt $t1, $0, update_player_y_endcases
		lw $t2, 4($t0)
		addi $t2, $t2, -1
		# Set $v0 to 1 if should scroll
		update_player_y_IF:
			bge $t2, $t3, update_player_y_ELSE
		update_player_y_THEN:
			li $v0, 1
			j update_player_y_ENDIF
		update_player_y_ELSE:
			# If no scroll then actually update the y pos
			li $v0, 0
			sw $t2, 4($t0)
		update_player_y_ENDIF:
		j update_player_y_endcases
	update_player_y_endcases:
	jr $ra


is_player_on_platform:
	la $t0, platforms
	la $t5, player
	lw $t6, 4($t5) # player y
	lw $t5, 0($t5) # player x
	addi $t6, $t6, 1
	# Now $t6 equals player_y + 1
	is_player_on_platform_LOOPINIT:
		move $t1, $0
		li $t2, 5
	is_player_on_platform_WHILE:
		bge $t1, $t2, is_player_on_platform_FALSE
	is_player_on_platform_DO:
		lw $t3, 4($t0) # platform x
		lw $t4, 8($t0) # platform y
		is_player_on_platform_IF:
			bne $t6, $t4, is_player_on_platform_ENDIF
			blt $t5, $t3, is_player_on_platform_ENDIF
			addi $t3, $t3, 9
			bgt $t5, $t3, is_player_on_platform_ENDIF
			is_player_on_platform_TRUE:
				li $v0, 1
				jr $ra
		is_player_on_platform_ENDIF:
		addi $t0, $t0, 12
		addi $t1, $t1, 1
		j is_player_on_platform_WHILE
	is_player_on_platform_FALSE:
	li $v0, 0
	jr $ra


update_player_velocity:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	la $t0, player
	# Switch ($a0 := key_pressed)
	# Case 0:

	update_player_x_velocity_case_0:
		bne $a0, $0 update_player_x_velocity_case_left
		move $t1, $0
		sw $t1, 8($t0)
		j update_player_x_velocity_endcases
	update_player_x_velocity_case_left:
		lw $t1, left_key
		bne $a0, $t1, update_player_x_velocity_case_right
		li $t1, -1
		sw $t1, 8($t0)
		j update_player_x_velocity_endcases
	update_player_x_velocity_case_right:
		lw $t1, right_key
		bne $a0, $t1, update_player_x_velocity_endcases
		li $t1, 1
		sw $t1, 8($t0)
		j update_player_x_velocity_endcases
	update_player_x_velocity_endcases:

	jal is_player_on_platform
	la $t0, player
	# Switch ($v0 := is_touching_platform)
	update_player_y_velocity_case_going_up:
		lw $t1, 12($t0)
		bge $t1, $0, update_player_y_velocity_case_on_platform
		li $v0, 0
		j update_player_y_velocity_case_not_on_platform
	update_player_y_velocity_case_on_platform:
		beqz $v0, update_player_y_velocity_case_not_on_platform
		li $t1, -10
		j update_player_y_velocity_endcases
	update_player_y_velocity_case_not_on_platform:
		bne $v0, $0, update_player_y_velocity_endcases
		lw $t1, 12($t0)
		addi $t1, $t1, 1
		j update_player_y_velocity_endcases
	update_player_y_velocity_endcases:
	sw $t1, 12($t0)

	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra


get_key_pressed:
	lui $t0, 0xffff
	lw $t0, 0($t0)
	andi $t0, $t0, 1
	get_key_pressed_IF: # Is key pressed?
		beqz $t0, get_key_pressed_ELSE
	get_key_pressed_THEN:
		lui $t0, 0xffff
		lbu $v0, 4($t0)
		j get_key_pressed_ENDIF
	get_key_pressed_ELSE:
		li $v0, 0
	get_key_pressed_ENDIF:
	jr $ra

update_score:
	beqz $a0, update_score_return
	lw $t0, score
	addi $t0, $t0, 1
	sw $t0, score
	update_score_return:
	jr $ra


update_entities:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	# First get key press
	jal get_key_pressed
	move $a0, $v0

	#Go to menu if start_key pressed
	lw $t0, start_key
	beq $a0, $t0, main_MENU

	# Update player then platforms
	jal update_player_velocity
	jal update_player # Note update player returns $v0 := [should scroll]
	move $a0, $v0
	jal update_platforms
	jal update_score

	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra


exit_if_game_over:
	# Jumps to exit if player y value is divsu-1
	lw $t0, divsu
	addi $t0, $t0, -1
	la $t1, player
	lw $t1, 4($t1)
	sub $t0, $t0, $t1
	beqz $t0, exit
	jr $ra
