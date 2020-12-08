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
	letter_3x5_pixels:  .byte   0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1 # a
						.byte   1, 1, 0, 1, 0, 1, 1, 1, 0, 1, 0, 1, 1, 1, 0 # b
						.byte   0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 0, 1, 0, 1, 0 # c
						.byte   1, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0 # d
						.byte   1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1 # e
						.byte   1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0 # f
						.byte   0, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1 # g
						.byte   1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1 # h
						.byte   0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1 # i
						.byte   0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 1, 0 # j
						.byte   1, 0, 1, 1, 0, 1, 1, 1, 0, 1, 0, 1, 1, 0, 1 # k
						.byte   1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 1 # l
						.byte   1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1 # m
						.byte   1, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1 # n
						.byte   0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0 # o
						.byte   1, 1, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 0, 0 # p
						.byte   0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1 # q
						.byte   1, 1, 0, 1, 0, 1, 1, 1, 0, 1, 0, 1, 1, 0, 1 # r
						.byte   0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 0 # s
						.byte   1, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0 # t
						.byte   1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1 # u
						.byte   1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 0, 1, 0 # v
						.byte   1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1 # w
						.byte   1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1 # x
						.byte   1, 0, 1, 1, 0, 1, 1, 1, 1, 0, 1, 0, 0, 1, 0 # y
						.byte   1, 1, 1, 0, 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1 # z
	message:            .word   0      # {0: None, 1: 'press s to start', 2: 'nice!', 3: 'ggwp'}
	score:              .word   4000
	display_address:    .word	0x10008000
	# divsu stands for div size // unit
	# Or in other words screen_size / pixels_per_unit
	divsu:              .word   32 # 512 // 16 is a good one.
	# entity_xywh will store the x, y, w, h info of an entity.
	# It will allow the paint_entity function's code to be a lot cleaner.
	entity_xywh:        .space  16
	# The player is a struct with 4 words.
	# x, y, xvel, yvel, ypxdelta
	player:             .space  20
	# Each platform is a struct with 3 words
	# horizontal_vel, x, y
	# And we will have up to 5 platforms. => 5x3x4
	platforms:          .space  60
	# Exists, x, y
	jet_pack:           .space  12
	scroll_threshold:   .word   6
	bg:                 .word   0x424242
	platform_color:     .word   0x00e5ff
	player_color:       .word   0xffffff
	score_color:        .word   0x757575
	jet_pack_color:     .word   0x00e676
	text_color:         .word   0xcfd8dc
	newline:               .asciiz "\n"

.text
main:
	lw $s2, start_key
	main_show_menu:
	jal show_menu
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

		jal calculate_sleep_time
		move $a0, $v0
		li $v0, 32
		syscall

		jal exit_if_game_over
		jal erase_entities

		j main_WHILE
	main_END:
exit:
	jal show_endgame
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
	lw $t5, divsu
	addi $t5, $t5, -1
	# First add platform 0 which will
	# be the one the player starts on:

	sw $0, 0($t0)
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
		sw $0, 0($t0)
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


init_jet_pack:
	lw $t0, score
	la $t1 jet_pack
	li $t2, 200
	sw $0, 0($t1)
	blt $t0, $t2, init_jet_pack_RETURN
	li $t2, 1
	sw $t2, 0($t1)
	lw $t3, divsu
	li $a1, 500
	li $v0, 42
	syscall
	bge $a0, $t3, init_jet_pack_RETURN
	sw $a0, 4($t1)
	sw $0, 8($t1)
	init_jet_pack_RETURN:
	jr $ra


init_entities:
	addi $sp, $sp, -4
	# Push $ra onto the stack
    sw $ra, 0($sp)
	jal init_platforms
	jal init_player
	jal init_jet_pack
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


paint_jet_pack:
	la $t0, jet_pack
	lw $t1, 0($t0)
	beqz $t1, paint_jet_pack_RETURN

	addi $sp, $sp, -4
	sw $ra, 0($sp)

	la $t2, entity_xywh
	lw $t1, 4($t0)
	sw $t1, 0($t2)
	lw $t1, 8($t0)
	sw $t1, 4($t2)
	li $t1, 1
	sw $t1, 8($t2)
	sw $t1, 12($t2)
	jal paint_entity

	lw $ra, 0($sp)
	addi $sp, $sp, 4
	paint_jet_pack_RETURN:
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
	lw $a0, jet_pack_color
	jal paint_jet_pack

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
	jal paint_jet_pack
	lw $ra, 0($sp)

	addi $sp, $sp, 4
	jr $ra


init_platform:
	# Given $a0 := address of single platform, randomly reinitialize it at the top
	move $t0, $a0

	lw $t1, score
	addi $t1, $t1, 1
    li $t2, 2000
    bgt $t1, $t2, init_platform_move
    div $t2, $t2, $t1
    addi $a1, $t2, 1
    li $v0, 42
    syscall
    beqz $a0, init_platform_move
    sw $0, 0($t0)
    j init_platform_no_move
    init_platform_move:
    li $a1, 3
    li $v0, 42
    syscall
    addi $a0, $a0, -1
    sw $a0, 0($t0)
    init_platform_no_move:
	sw $0, 8($t0)
	li $v0, 42
	li $a1, 23
	syscall
	sw $a0, 4($t0)
	jr $ra


update_platforms:
	# $a0 -> scroll
	la $t2, platforms
	lw $t3, divsu
	update_platforms_LOOPINIT:
		move $t0, $0
		li $t1, 5
	update_platforms_WHILE:
		bge $t0, $t1, update_platforms_END
	update_platforms_DO:
		# Check if platform moves left/right
		lw $t4, 0($t2)
		beqz $t4, update_platforms_NO_MOVE
		lw $t5, 4($t2)
		beqz $t5, update_platforms_MOVE_RIGHT
		addi $t6, $t5, 10
		beq $t6, $t3, update_platforms_MOVE_LEFT
		j update_platforms_UPDATE_MOVE
		update_platforms_MOVE_RIGHT:
		li $t4, 1
		sw $t4, 0($t2)
		j update_platforms_UPDATE_MOVE
		update_platforms_MOVE_LEFT:
		li $t4, -1
		sw $t4, 0($t2)
		j update_platforms_UPDATE_MOVE
		update_platforms_UPDATE_MOVE:
		add $t5, $t5, $t4

		sw $t5, 4($t2)
		update_platforms_NO_MOVE:

		beqz $a0, update_platforms_endcases

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
		lw $t4, 16($t0)
		add $t4, $t4, $t1
		li $t5, -8
		ble $t4, $t5, update_player_y_FR
		sw $t4, 16($t0)
		j update_player_y_endcases
		update_player_y_FR:
		sw $0, 16($t0)
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
		li $t1, -14
		j update_player_y_velocity_endcases
	update_player_y_velocity_case_not_on_platform:
		bne $v0, $0, update_player_y_velocity_endcases
		lw $t1, 12($t0)
		addi $t1, $t1, 1
		j update_player_y_velocity_endcases
	update_player_y_velocity_endcases:
	sw $t1, 12($t0)

	# Check if touching jet pack:
	la $t1, jet_pack
	lw $t2, 0($t1)
	beqz $t2, update_player_velocity_RETURN
	lw $t2, 0($t0)
	lw $t3, 4($t0)
	lw $t4, 4($t1)
	lw $t5, 8($t1)
	bne $t2, $t4, update_player_velocity_RETURN
	bne $t3, $t5, update_player_velocity_RETURN
	sw $0, 0($t1)
	li $t1, -100
	sw $t1, 12($t0)

	update_player_velocity_RETURN:
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra


update_jet_pack:
	move $t9, $a0
	la $t0, jet_pack
	lw $t1, 0($t0)
	bgt $t1, $0, update_jet_pack_Y
	lw $t2, score
	li $t3, 200
	blt $t2, $t3, update_jet_pack_RETURN
	li $a1, 400
	li $v0, 42
	syscall
	lw $t3, divsu
	bge $a0, $t3, update_jet_pack_RETURN
	li $t2, 1
	sw $t2, 0($t0)
	sw $a0, 4($t0)
	sw $0, 8($t0)
	j update_jet_pack_RETURN
	update_jet_pack_Y:
		beqz $t9, update_jet_pack_RETURN
		lw $t2, 8($t0)
		addi $t2, $t2, 1
		lw $t3, divsu
		bne $t2, $t3, update_jet_pack_NOT_BOTTOM
		sw $0, 0($t0)
	update_jet_pack_NOT_BOTTOM:
		sw $t2, 8($t0)
	update_jet_pack_RETURN:
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
	beq $a0, $t0, main_show_menu

	# Update player then platforms
	jal update_player_velocity
	jal update_player # Note update player returns $v0 := [should scroll]
	move $a0, $v0
	jal update_platforms
	jal update_jet_pack
	jal update_score

	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra


calculate_sleep_time:
    lw $t0, score
    li $t1, 100
    div $t0, $t0, $t1
    li $t1, 60
    sub $v0, $t1, $t0
    li $t0, 30
    bge $v0, $t0, calculate_sleep_time_RETURN
    move $v0, $t0
    calculate_sleep_time_RETURN:
    jr $ra


show_menu:
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	lw $a0, bg
	jal paint_bg
	lw $a0, score_color
	jal paint_score

	lw $a0, text_color
	lw $t0, display_address
	addi $t0, $t0, 4
	lw $t1, divsu
	sll $t1, $t1, 2
	li $t2, 6
	mul $t2, $t1, $t2
	add $t0, $t0, $t2
	sw $a0, 0($t0)
	sw $a0, 4($t0)
	sw $a0, 16($t0)
	sw $a0, 20($t0)
	sw $a0, 32($t0)
	sw $a0, 36($t0)
	sw $a0, 40($t0)
	sw $a0, 52($t0)
	sw $a0, 56($t0)
	sw $a0, 68($t0)
	sw $a0, 72($t0)
	sw $a0, 100($t0)
	sw $a0, 104($t0)
	add $t0, $t0, $t1
	sw $a0, 0($t0)
	sw $a0, 8($t0)
	sw $a0, 16($t0)
	sw $a0, 24($t0)
	sw $a0, 32($t0)
	sw $a0, 48($t0)
	sw $a0, 64($t0)
	sw $a0, 96($t0)
	add $t0, $t0, $t1
	sw $a0, 0($t0)
	sw $a0, 4($t0)
	sw $a0, 16($t0)
	sw $a0, 20($t0)
	sw $a0, 32($t0)
	sw $a0, 36($t0)
	sw $a0, 40($t0)
	sw $a0, 52($t0)
	sw $a0, 68($t0)
	sw $a0, 100($t0)
	add $t0, $t0, $t1
	sw $a0, 0($t0)
	sw $a0, 16($t0)
	sw $a0, 24($t0)
	sw $a0, 32($t0)
	sw $a0, 56($t0)
	sw $a0, 72($t0)
	sw $a0, 104($t0)
	add $t0, $t0, $t1
	sw $a0, 0($t0)
	sw $a0, 16($t0)
	sw $a0, 24($t0)
	sw $a0, 32($t0)
	sw $a0, 36($t0)
	sw $a0, 40($t0)
	sw $a0, 48($t0)
	sw $a0, 52($t0)
	sw $a0, 64($t0)
	sw $a0, 68($t0)
	sw $a0, 96($t0)
	sw $a0, 100($t0)
	add $t0, $t0, $t1
	add $t0, $t0, $t1
	sw $a0, 0($t0)
	sw $a0, 4($t0)
	sw $a0, 8($t0)
	sw $a0, 20($t0)
	sw $a0, 52($t0)
	sw $a0, 56($t0)
	sw $a0, 64($t0)
	sw $a0, 68($t0)
	sw $a0, 72($t0)
	sw $a0, 84($t0)
	sw $a0, 96($t0)
	sw $a0, 100($t0)
	sw $a0, 112($t0)
	sw $a0, 116($t0)
	sw $a0, 120($t0)
	add $t0, $t0, $t1
	sw $a0, 4($t0)
	sw $a0, 16($t0)
	sw $a0, 24($t0)
	sw $a0, 48($t0)
	sw $a0, 68($t0)
	sw $a0, 80($t0)
	sw $a0, 88($t0)
	sw $a0, 96($t0)
	sw $a0, 104($t0)
	sw $a0, 116($t0)
	add $t0, $t0, $t1
	sw $a0, 4($t0)
	sw $a0, 16($t0)
	sw $a0, 24($t0)
	sw $a0, 52($t0)
	sw $a0, 68($t0)
	sw $a0, 80($t0)
	sw $a0, 84($t0)
	sw $a0, 88($t0)
	sw $a0, 96($t0)
	sw $a0, 100($t0)
	sw $a0, 116($t0)
	add $t0, $t0, $t1
	sw $a0, 4($t0)
	sw $a0, 16($t0)
	sw $a0, 24($t0)
	sw $a0, 56($t0)
	sw $a0, 68($t0)
	sw $a0, 80($t0)
	sw $a0, 88($t0)
	sw $a0, 96($t0)
	sw $a0, 104($t0)
	sw $a0, 116($t0)
	add $t0, $t0, $t1
	sw $a0, 4($t0)
	sw $a0, 20($t0)
	sw $a0, 48($t0)
	sw $a0, 52($t0)
	sw $a0, 68($t0)
	sw $a0, 80($t0)
	sw $a0, 88($t0)
	sw $a0, 96($t0)
	sw $a0, 104($t0)
	sw $a0, 116($t0)

	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra


show_endgame:
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	lw $a0, bg
	jal paint_bg
	lw $a0, score_color
	jal paint_score

	lw $a0, text_color
	lw $t0, display_address
	addi $t0, $t0, 4
	lw $t1, divsu
	sll $t1, $t1, 2
	li $t2, 6
	mul $t2, $t1, $t2
	add $t0, $t0, $t2
	sw $a0, 4($t0)
	sw $a0, 8($t0)
	sw $a0, 20($t0)
	sw $a0, 24($t0)
	sw $a0, 32($t0)
	sw $a0, 40($t0)
	sw $a0, 48($t0)
	sw $a0, 52($t0)
	add $t0, $t0, $t1
	sw $a0, 0($t0)
	sw $a0, 16($t0)
	sw $a0, 32($t0)
	sw $a0, 40($t0)
	sw $a0, 48($t0)
	sw $a0, 56($t0)
	add $t0, $t0, $t1
	sw $a0, 0($t0)
	sw $a0, 16($t0)
	sw $a0, 32($t0)
	sw $a0, 40($t0)
	sw $a0, 48($t0)
	sw $a0, 52($t0)
	add $t0, $t0, $t1
	sw $a0, 0($t0)
	sw $a0, 8($t0)
	sw $a0, 16($t0)
	sw $a0, 24($t0)
	sw $a0, 32($t0)
	sw $a0, 36($t0)
	sw $a0, 40($t0)
	sw $a0, 48($t0)
	add $t0, $t0, $t1
	sw $a0, 4($t0)
	sw $a0, 8($t0)
	sw $a0, 20($t0)
	sw $a0, 24($t0)
	sw $a0, 32($t0)
	sw $a0, 40($t0)
	sw $a0, 48($t0)

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
