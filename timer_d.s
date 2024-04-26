	.data
	.global board
	.global current
	.global pauseflag
	.global moves

	.global face1
	.global face2
	.global face3
	.global face4
	.global face5
	.global face6
	.global face7
	.global face8
	.global face9

	.global sideflag
	.global positionflag
	.global startingpos


	.global redtile
	.global bluetile
	.global greentile
	.global whitetile
	.global purpletile
	.global yellowtile
	.global resettile
	.global clearline


	.global cube1
	.global cube2
	.global cube3
	.global cube4
	.global cube5
	.global cube6


	.global b1sqr1_1
	.global b1sqr1_2
	.global b1sqr1_3

	.global b1sqr2_1
	.global b1sqr2_2
	.global b1sqr2_3

	.global b1sqr3_1
	.global b1sqr3_2
	.global b1sqr3_3

	.global b1sqr4_1
	.global b1sqr4_2
	.global b1sqr4_3

	.global b1sqr5_1
	.global b1sqr5_2
	.global b1sqr5_3

	.global b1sqr6_1
	.global b1sqr6_2
	.global b1sqr6_3

	.global b1sqr7_1
	.global b1sqr7_2
	.global b1sqr7_3

	.global b1sqr8_1
	.global b1sqr8_2
	.global b1sqr8_3

	.global b1sqr9_1
	.global b1sqr9_2
	.global b1sqr9_3

	.global scoreline

	.global clearscreen
	.global	leftside
	.global position

	.global cursorcolor
	.global cubecolor


	.text
	.global uart_init
	.global output_character
	.global output_string
	.global read_string
	.global int2string
	.global UART0_Handler
	.global Switch_Handler
	.global board_handler

	.global gpio_interrupt_init
	.global uart_interrupt_init
	.global timer_interrupt_init
	.global simple_read_character


	.text
	.global d_handler
	.global color_helper


ptr_to_current:			.word current
ptr_position:			.word position


ptr_to_pauseflag:		.word pauseflag
ptr_to_sideflag:		.word sideflag
ptr_to_positionflag:	.word positionflag
ptr_to_spos				.word startingpos


ptr_to_redtile:			.word redtile
ptr_to_bluetile:		.word bluetile
ptr_to_greentile:		.word greentile
ptr_to_whitetile:		.word whitetile
ptr_to_purpletile:		.word purpletile
ptr_to_yellowtile:		.word yellowtile
ptr_to_resettile:		.word resettile
ptr_to_clearline:		.word clearline

;cursor pointers

ptr_to_f1:				.word face1
ptr_to_f2:				.word face2
ptr_to_f3:				.word face3
ptr_to_f4:				.word face4
ptr_to_f5:				.word face5
ptr_to_f6:				.word face6
ptr_to_f7:				.word face7
ptr_to_f8:				.word face8
ptr_to_f9:				.word face9


ptr_to_s1:				.word cube1
ptr_to_s2:				.word cube2
ptr_to_s3:				.word cube3
ptr_to_s4:				.word cube4
ptr_to_s5:				.word cube5
ptr_to_s6:				.word cube6

;side 1

ptr_to_b1sqr1_1:		.word b1sqr1_1
ptr_to_b1sqr1_2:		.word b1sqr1_2
ptr_to_b1sqr1_3:		.word b1sqr1_3

ptr_to_b1sqr2_1:		.word b1sqr2_1
ptr_to_b1sqr2_2:		.word b1sqr2_2
ptr_to_b1sqr2_3:		.word b1sqr2_3

ptr_to_b1sqr3_1:		.word b1sqr3_1
ptr_to_b1sqr3_2:		.word b1sqr3_2
ptr_to_b1sqr3_3:		.word b1sqr3_3

ptr_to_b1sqr4_1:		.word b1sqr4_1
ptr_to_b1sqr4_2:		.word b1sqr4_2
ptr_to_b1sqr4_3:		.word b1sqr4_3

ptr_to_b1sqr5_1:		.word b1sqr5_1
ptr_to_b1sqr5_2:		.word b1sqr5_2
ptr_to_b1sqr5_3:		.word b1sqr5_3

ptr_to_b1sqr6_1:		.word b1sqr6_1
ptr_to_b1sqr6_2:		.word b1sqr6_2
ptr_to_b1sqr6_3:		.word b1sqr6_3

ptr_to_b1sqr7_1:		.word b1sqr7_1
ptr_to_b1sqr7_2:		.word b1sqr7_2
ptr_to_b1sqr7_3:		.word b1sqr7_3

ptr_to_b1sqr8_1:		.word b1sqr8_1
ptr_to_b1sqr8_2:		.word b1sqr8_2
ptr_to_b1sqr8_3:		.word b1sqr8_3

ptr_to_b1sqr9_1:		.word b1sqr9_1
ptr_to_b1sqr9_2:		.word b1sqr9_2
ptr_to_b1sqr9_3:		.word b1sqr9_3

ptr_to_clearscreen: 	.word clearscreen
ptr_to_leftside:		.word leftside
ptr_to_board:			.word board

ptr_to_cubecolor:		.word cubecolor
ptr_to_cursorcolor:		.word cursorcolor
ptr_to_moves:			.word moves

d_handler:
	PUSH {r4-r12,lr}

	LDR r1, ptr_to_sideflag
	LDR r0, [r1]
	CMP r0, #0
	BEQ s1_d
	CMP r0, #1
	BEQ s2_d
	CMP r0, #2
	BEQ s3_d
	CMP r0, #3
	BEQ s4_d
	CMP r0, #4
	BEQ s5_d
	CMP r0, #5
	BEQ s6_d

s1_d:
	LDR r0, ptr_to_spos
	LDR r1, [r0]

	CMP r1, #1
	BEQ s1d_1
	CMP r1, #2
	BEQ s1d_2
	CMP r1, #3
	BEQ s1d_3
	CMP r1, #4
	BEQ s1d_4
	CMP r1, #5
	BEQ s1d_5
	CMP r1, #6
	BEQ s1d_6
	CMP r1, #7
	BEQ s1d_7
	CMP r1, #8
	BEQ s1d_8
	CMP r1, #9
	BEQ s1d_9

s1d_1:
	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #4
	STR r1, [r0]

	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s1d1

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_s1d1

skipper_s1d1:

	BL board_handler

	LDR r0, ptr_to_f4
	BL output_string

fix_s1d1:
	B ddone

s1d_2:
	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #5
	STR r1, [r0]

	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s1d2

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_s1d2

skipper_s1d2:

	BL board_handler

	LDR r0, ptr_to_f5
	BL output_string

fix_s1d2:
	B ddone

s1d_3:
	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #6
	STR r1, [r0]
	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s1d3

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_s1d3

skipper_s1d3:

	BL board_handler

	LDR r0, ptr_to_f6
	BL output_string
fix_s1d3:
	B ddone

s1d_4:

	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #7
	STR r1, [r0]
	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s1d4

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_s1d4

skipper_s1d4:

	BL board_handler

	LDR r0, ptr_to_f7
	BL output_string
fix_s1d4:
	B ddone
s1d_5:

	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #8
	STR r1, [r0]
	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s1d5

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_s1d5

skipper_s1d5:

	BL board_handler

	LDR r0, ptr_to_f8
	BL output_string

fix_s1d5:
	B ddone
s1d_6:
	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #9
	STR r1, [r0]
	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s1d6

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_s1d6

skipper_s1d6:
	BL board_handler

	LDR r0, ptr_to_f9
	BL output_string
fix_s1d6:
	B ddone

s1d_7:

	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #1
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	LDR r5, [r0]
	MOV r1, #1
	STR r1, [r0]
	BL color_helper

	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s1d7


	LDR r0, ptr_to_spos
	STR r4, [r0]

	LDR r0, ptr_to_sideflag
	STR r5, [r0]

	B fix_s1d7

skipper_s1d7:

	BL board_handler

	LDR r0, ptr_to_f1
	BL output_string

fix_s1d7:
	B ddone

s1d_8:
	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #2
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	LDR r5, [r0]
	MOV r1, #1
	STR r1, [r0]
	BL color_helper

	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s1d8


	LDR r0, ptr_to_spos
	STR r4, [r0]

	LDR r0, ptr_to_sideflag
	STR r5, [r0]

	B fix_s1d8

skipper_s1d8:
	BL board_handler

	LDR r0, ptr_to_f2
	BL output_string
fix_s1d8:
	B ddone

s1d_9:

	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #3
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	LDR r5, [r0]
	MOV r1, #1
	STR r1, [r0]
	BL color_helper

	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s1d9


	LDR r0, ptr_to_spos
	STR r4, [r0]

	LDR r0, ptr_to_sideflag
	STR r5, [r0]

	B fix_s1d9

skipper_s1d9:
	BL board_handler

	LDR r0, ptr_to_f3
	BL output_string
fix_s1d9:
	B ddone

s2_d:
	LDR r0, ptr_to_spos
	LDR r1, [r0]

	CMP r1, #1
	BEQ s2d_1
	CMP r1, #2
	BEQ s2d_2
	CMP r1, #3
	BEQ s2d_3
	CMP r1, #4
	BEQ s2d_4
	CMP r1, #5
	BEQ s2d_5
	CMP r1, #6
	BEQ s2d_6
	CMP r1, #7
	BEQ s2d_7
	CMP r1, #8
	BEQ s2d_8
	CMP r1, #9
	BEQ s2d_9

s2d_1:
	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #4
	STR r1, [r0]
	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s2d1

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_s2d1

skipper_s2d1:
	BL board_handler

	LDR r0, ptr_to_f4
	BL output_string
fix_s2d1:
	B ddone
s2d_2:
	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #5
	STR r1, [r0]
	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s2d2

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_s2d2

skipper_s2d2:

	BL board_handler

	LDR r0, ptr_to_f5
	BL output_string
fix_s2d2:
	B ddone
s2d_3:
	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #6
	STR r1, [r0]
	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s2d3

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_s2d3

skipper_s2d3:
	BL board_handler

	LDR r0, ptr_to_f6
	BL output_string
fix_s2d3:
	B ddone
s2d_4:

	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #7
	STR r1, [r0]
	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s2d4

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_s2d4

skipper_s2d4:
	BL board_handler

	LDR r0, ptr_to_f7
	BL output_string
fix_s2d4:
	B ddone
s2d_5:

	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #8
	STR r1, [r0]
	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s2d5

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_s2d5

skipper_s2d5:
	BL board_handler

	LDR r0, ptr_to_f8
	BL output_string
fix_s2d5:
	B ddone
s2d_6:
	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #9
	STR r1, [r0]
	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s2d6

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_s2d6

skipper_s2d6:
	BL board_handler

	LDR r0, ptr_to_f9
	BL output_string
fix_s2d6:
	B ddone

s2d_7:

	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #1
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	LDR r5, [r0]
	MOV r1, #2
	STR r1, [r0]
	BL color_helper

	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s2d7


	LDR r0, ptr_to_spos
	STR r4, [r0]

	LDR r0, ptr_to_sideflag
	STR r5, [r0]

	B fix_2d7

skipper_s2d7:
	BL board_handler

	LDR r0, ptr_to_f1
	BL output_string
fix_2d7:
	B ddone

s2d_8:
	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #2
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	LDR r5, [r0]
	MOV r1, #2
	STR r1, [r0]
	BL color_helper

	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s2d8


	LDR r0, ptr_to_spos
	STR r4, [r0]

	LDR r0, ptr_to_sideflag
	STR r5, [r0]

	B fix_2d8

skipper_s2d8:
	BL board_handler

	LDR r0, ptr_to_f2
	BL output_string
fix_2d8:
	B ddone

s2d_9:

	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #3
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	LDR r5, [r0]
	MOV r1, #2
	STR r1, [r0]
	BL color_helper

	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s2d9


	LDR r0, ptr_to_spos
	STR r4, [r0]

	LDR r0, ptr_to_sideflag
	STR r5, [r0]

	B fix_2d9

skipper_s2d9:
	BL board_handler

	LDR r0, ptr_to_f3
	BL output_string
fix_2d9:
	B ddone

s3_d:
	LDR r0, ptr_to_spos
	LDR r1, [r0]

	CMP r1, #1
	BEQ s3d_1
	CMP r1, #2
	BEQ s3d_2
	CMP r1, #3
	BEQ s3d_3
	CMP r1, #4
	BEQ s3d_4
	CMP r1, #5
	BEQ s3d_5
	CMP r1, #6
	BEQ s3d_6
	CMP r1, #7
	BEQ s3d_7
	CMP r1, #8
	BEQ s3d_8
	CMP r1, #9
	BEQ s3d_9

s3d_1:
	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #4
	STR r1, [r0]
	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s3d1

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_3d1

skipper_s3d1:
	BL board_handler

	LDR r0, ptr_to_f4
	BL output_string
fix_3d1:
	B ddone
s3d_2:
	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #5
	STR r1, [r0]
	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s3d2

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_3d2

skipper_s3d2:
	BL board_handler

	LDR r0, ptr_to_f5
	BL output_string
fix_3d2:
	B ddone
s3d_3:
	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #6
	STR r1, [r0]
	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s3d3

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_3d3

skipper_s3d3:
	BL board_handler

	LDR r0, ptr_to_f6
	BL output_string

fix_3d3:
	B ddone
s3d_4:

	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #7
	STR r1, [r0]
	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s3d4

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_3d4

skipper_s3d4:
	BL board_handler

	LDR r0, ptr_to_f7
	BL output_string
fix_3d4:
	B ddone
s3d_5:

	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #8
	STR r1, [r0]
	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s3d5

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_3d5

skipper_s3d5:
	BL board_handler

	LDR r0, ptr_to_f8
	BL output_string
fix_3d5:
	B ddone
s3d_6:
	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #9
	STR r1, [r0]
	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s3d6

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_3d6

skipper_s3d6:
	BL board_handler

	LDR r0, ptr_to_f9
	BL output_string
fix_3d6:
	B ddone

s3d_7:

	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #1
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	LDR r5, [r0]
	MOV r1, #3
	STR r1, [r0]
	BL color_helper

	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s3d7


	LDR r0, ptr_to_spos
	STR r4, [r0]

	LDR r0, ptr_to_sideflag
	STR r5, [r0]

	B fix_3d7

skipper_s3d7:
	BL board_handler

	LDR r0, ptr_to_f1
	BL output_string
fix_3d7:
	B ddone

s3d_8:
	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #2
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	LDR r5, [r0]
	MOV r1, #3
	STR r1, [r0]
	BL color_helper

	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s3d8


	LDR r0, ptr_to_spos
	STR r4, [r0]

	LDR r0, ptr_to_sideflag
	STR r5, [r0]

	B fix_3d8

skipper_s3d8:
	BL board_handler

	LDR r0, ptr_to_f2
	BL output_string
fix_3d8:
	B ddone

s3d_9:

	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #3
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	LDR r5, [r0]
	MOV r1, #3
	STR r1, [r0]
	BL color_helper

	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s3d9


	LDR r0, ptr_to_spos
	STR r4, [r0]

	LDR r0, ptr_to_sideflag
	STR r5, [r0]

	B fix_3d9

skipper_s3d9:
	BL board_handler

	LDR r0, ptr_to_f3
	BL output_string
fix_3d9:
	B ddone

s4_d:
	LDR r0, ptr_to_spos
	LDR r1, [r0]

	CMP r1, #1
	BEQ s4d_1
	CMP r1, #2
	BEQ s4d_2
	CMP r1, #3
	BEQ s4d_3
	CMP r1, #4
	BEQ s4d_4
	CMP r1, #5
	BEQ s4d_5
	CMP r1, #6
	BEQ s4d_6
	CMP r1, #7
	BEQ s4d_7
	CMP r1, #8
	BEQ s4d_8
	CMP r1, #9
	BEQ s4d_9

s4d_1:
	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #4
	STR r1, [r0]
	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s4d1

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_4d1

skipper_s4d1:
	BL board_handler

	LDR r0, ptr_to_f4
	BL output_string
fix_4d1:
	B ddone
s4d_2:
	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #5
	STR r1, [r0]
	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s4d2

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_4d2

skipper_s4d2:
	BL board_handler

	LDR r0, ptr_to_f5
	BL output_string
fix_4d2:
	B ddone
s4d_3:
	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #6
	STR r1, [r0]
	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s4d3

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_4d3

skipper_s4d3:
	BL board_handler

	LDR r0, ptr_to_f6
	BL output_string
fix_4d3:
	B ddone
s4d_4:

	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #7
	STR r1, [r0]
	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s4d4

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_4d4

skipper_s4d4:
	BL board_handler

	LDR r0, ptr_to_f7
	BL output_string
fix_4d4:
	B ddone
s4d_5:

	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #8
	STR r1, [r0]
	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s4d5

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_4d5

skipper_s4d5:
	BL board_handler

	LDR r0, ptr_to_f8
	BL output_string
fix_4d5:
	B ddone
s4d_6:
	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #9
	STR r1, [r0]
	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s4d6

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_4d6

skipper_s4d6:
	BL board_handler

	LDR r0, ptr_to_f9
	BL output_string
fix_4d6:
	B ddone

s4d_7:

	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #1
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	LDR r5, [r0]
	MOV r1, #0
	STR r1, [r0]
	BL color_helper

	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s4d7


	LDR r0, ptr_to_spos
	STR r4, [r0]

	LDR r0, ptr_to_sideflag
	STR r5, [r0]

	B fix_4d7

skipper_s4d7:
	BL board_handler

	LDR r0, ptr_to_f1
	BL output_string
fix_4d7:
	B ddone

s4d_8:
	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #2
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	LDR r5, [r0]
	MOV r1, #0
	STR r1, [r0]
	BL color_helper

	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s4d8


	LDR r0, ptr_to_spos
	STR r4, [r0]

	LDR r0, ptr_to_sideflag
	STR r5, [r0]

	B fix_4d8

skipper_s4d8:
	BL board_handler

	LDR r0, ptr_to_f2
	BL output_string
fix_4d8:
	B ddone

s4d_9:

	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #3
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	LDR r5, [r0]
	MOV r1, #0
	STR r1, [r0]
	BL color_helper

	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s4d9


	LDR r0, ptr_to_spos
	STR r4, [r0]

	LDR r0, ptr_to_sideflag
	STR r5, [r0]

	B fix_4d9

skipper_s4d9:
	BL board_handler

	LDR r0, ptr_to_f3
	BL output_string
fix_4d9:
	B ddone

s5_d:
	LDR r0, ptr_to_spos
	LDR r1, [r0]

	CMP r1, #1
	BEQ s5d_1
	CMP r1, #2
	BEQ s5d_2
	CMP r1, #3
	BEQ s5d_3
	CMP r1, #4
	BEQ s5d_4
	CMP r1, #5
	BEQ s5d_5
	CMP r1, #6
	BEQ s5d_6
	CMP r1, #7
	BEQ s5d_7
	CMP r1, #8
	BEQ s5d_8
	CMP r1, #9
	BEQ s5d_9

s5d_1:
	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #4
	STR r1, [r0]
	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s5d1

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_5d1

skipper_s5d1:
	BL board_handler

	LDR r0, ptr_to_f4
	BL output_string
fix_5d1:
	B ddone
s5d_2:
	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #5
	STR r1, [r0]
	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s5d2

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_5d2

skipper_s5d2:
	BL board_handler

	LDR r0, ptr_to_f5
	BL output_string
fix_5d2:
	B ddone
s5d_3:
	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #6
	STR r1, [r0]
	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s5d3

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_5d3

skipper_s5d3:
	BL board_handler

	LDR r0, ptr_to_f6
	BL output_string
fix_5d3:
	B ddone
s5d_4:

	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #7
	STR r1, [r0]
	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s5d4

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_5d4

skipper_s5d4:
	BL board_handler

	LDR r0, ptr_to_f7
	BL output_string
fix_5d4:
	B ddone
s5d_5:

	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #8
	STR r1, [r0]
	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s5d5

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_5d5

skipper_s5d5:
	BL board_handler

	LDR r0, ptr_to_f8
	BL output_string
fix_5d5:
	B ddone
s5d_6:
	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #9
	STR r1, [r0]
	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s5d6

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_5d6

skipper_s5d6:
	BL board_handler

	LDR r0, ptr_to_f9
	BL output_string
fix_5d6:
	B ddone

s5d_7:

	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #7
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	LDR r5, [r0]
	MOV r1, #1
	STR r1, [r0]
	BL color_helper

	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s5d7


	LDR r0, ptr_to_spos
	STR r4, [r0]

	LDR r0, ptr_to_sideflag
	STR r5, [r0]

	B fix_5d7

skipper_s5d7:
	BL board_handler

	LDR r0, ptr_to_f7
	BL output_string
fix_5d7:
	B ddone

s5d_8:
	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #4
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	LDR r5, [r0]
	MOV r1, #1
	STR r1, [r0]
	BL color_helper

	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s5d8


	LDR r0, ptr_to_spos
	STR r4, [r0]

	LDR r0, ptr_to_sideflag
	STR r5, [r0]

	B fix_5d8

skipper_s5d8:
	BL board_handler

	LDR r0, ptr_to_f4
	BL output_string
fix_5d8:
	B ddone

s5d_9:

	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #1
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	LDR r5, [r0]
	MOV r1, #1
	STR r1, [r0]
	BL color_helper

	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s5d9


	LDR r0, ptr_to_spos
	STR r4, [r0]

	LDR r0, ptr_to_sideflag
	STR r5, [r0]

	B fix_5d9

skipper_s5d9:
	BL board_handler

	LDR r0, ptr_to_f1
	BL output_string
fix_5d9:
	B ddone

s6_d:
	LDR r0, ptr_to_spos
	LDR r1, [r0]

	CMP r1, #1
	BEQ s6d_1
	CMP r1, #2
	BEQ s6d_2
	CMP r1, #3
	BEQ s6d_3
	CMP r1, #4
	BEQ s6d_4
	CMP r1, #5
	BEQ s6d_5
	CMP r1, #6
	BEQ s6d_6
	CMP r1, #7
	BEQ s6d_7
	CMP r1, #8
	BEQ s6d_8
	CMP r1, #9
	BEQ s6d_9

s6d_1:
	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #4
	STR r1, [r0]
	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s6d1

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_6d1

skipper_s6d1:
	BL board_handler

	LDR r0, ptr_to_f4
	BL output_string
fix_6d1:
	B ddone
s6d_2:
	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #5
	STR r1, [r0]
	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s6d2

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_6d2

skipper_s6d2:
	BL board_handler

	LDR r0, ptr_to_f5
	BL output_string
fix_6d2:
	B ddone
s6d_3:
	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #6
	STR r1, [r0]
	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s6d3

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_6d3

skipper_s6d3:
	BL board_handler

	LDR r0, ptr_to_f6
	BL output_string
fix_6d3:
	B ddone
s6d_4:

	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #7
	STR r1, [r0]
	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s6d4

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_6d4

skipper_s6d4:
	BL board_handler

	LDR r0, ptr_to_f7
	BL output_string
fix_6d4:
	B ddone
s6d_5:

	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #8
	STR r1, [r0]
	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s6d5

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_6d5

skipper_s6d5:
	BL board_handler

	LDR r0, ptr_to_f8
	BL output_string
fix_6d5:
	B ddone
s6d_6:
	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #9
	STR r1, [r0]
	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s6d6

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_6d6

skipper_s6d6:
	BL board_handler

	LDR r0, ptr_to_f9
	BL output_string
fix_6d6:
	B ddone

s6d_7:

	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #3
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	LDR r5, [r0]
	MOV r1, #1
	STR r1, [r0]
	BL color_helper

	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s6d7


	LDR r0, ptr_to_spos
	STR r4, [r0]

	LDR r0, ptr_to_sideflag
	STR r5, [r0]

	B fix_6d7

skipper_s6d7:
	BL board_handler

	LDR r0, ptr_to_f3
	BL output_string
fix_6d7:
	B ddone

s6d_8:
	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #6
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	LDR r5, [r0]
	MOV r1, #1
	STR r1, [r0]
	BL color_helper

	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s6d8


	LDR r0, ptr_to_spos
	STR r4, [r0]

	LDR r0, ptr_to_sideflag
	STR r5, [r0]

	B fix_6d8

skipper_s6d8:
	BL board_handler

	LDR r0, ptr_to_f6
	BL output_string
fix_6d8:
	B ddone

s6d_9:

	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #9
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	LDR r5, [r0]
	MOV r1, #1
	STR r1, [r0]
	BL color_helper

	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s6d9


	LDR r0, ptr_to_spos
	STR r4, [r0]

	LDR r0, ptr_to_sideflag
	STR r5, [r0]

	B fix_6d9

skipper_s6d9:
	BL board_handler

	LDR r0, ptr_to_f9
	BL output_string
fix_6d9:
	B ddone

ddone:


	POP {r4-r12,lr}   ; Restore registers
    mov pc, lr
