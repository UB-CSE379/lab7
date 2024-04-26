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
	.global s_handler
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

s_handler:
	PUSH {r4-r12,lr}

	LDR r1, ptr_to_sideflag
	LDR r0, [r1]
	CMP r0, #0
	BEQ s1_s
	CMP r0, #1
	BEQ s2_s
	CMP r0, #2
	BEQ s3_s
	CMP r0, #3
	BEQ s4_s
	CMP r0, #4
	BEQ s5_s
	CMP r0, #5
	BEQ s6_s

s1_s:
	LDR r0, ptr_to_spos
	LDR r1, [r0]

	CMP r1, #1
	BEQ s1s_1
	CMP r1, #2
	BEQ s1s_2
	CMP r1, #3
	BEQ s1s_3
	CMP r1, #4
	BEQ s1s_4
	CMP r1, #5
	BEQ s1s_5
	CMP r1, #6
	BEQ s1s_6
	CMP r1, #7
	BEQ s1s_7
	CMP r1, #8
	BEQ s1s_8
	CMP r1, #9
	BEQ s1s_9

s1s_1:
	LDR r0, ptr_to_spos
	MOV r1, #2
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f2
	BL output_string

	B sdone
s1s_2:
	LDR r0, ptr_to_spos
	MOV r1, #3
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f3
	BL output_string

	B sdone
s1s_3:
	LDR r0, ptr_to_spos
	MOV r1, #1
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	MOV r1, #5
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f1
	BL output_string

	B sdone
s1s_4:

	LDR r0, ptr_to_spos
	MOV r1, #5
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f5
	BL output_string

	B sdone
s1s_5:

	LDR r0, ptr_to_spos
	MOV r1, #6
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f6
	BL output_string

	B sdone
s1s_6:
	LDR r0, ptr_to_spos
	MOV r1, #4
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	MOV r1, #5
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f4
	BL output_string

	B sdone

s1s_7:

	LDR r0, ptr_to_spos
	MOV r1, #8
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f8
	BL output_string

	B sdone

s1s_8:
	LDR r0, ptr_to_spos
	MOV r1, #9
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f9
	BL output_string

	B sdone

s1s_9:

	LDR r0, ptr_to_spos
	MOV r1, #7
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	MOV r1, #5
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f7
	BL output_string

	B sdone

s2_s:
	LDR r0, ptr_to_spos
	LDR r1, [r0]

	CMP r1, #1
	BEQ s2s_1
	CMP r1, #2
	BEQ s2s_2
	CMP r1, #3
	BEQ s2s_3
	CMP r1, #4
	BEQ s2s_4
	CMP r1, #5
	BEQ s2s_5
	CMP r1, #6
	BEQ s2s_6
	CMP r1, #7
	BEQ s2s_7
	CMP r1, #8
	BEQ s2s_8
	CMP r1, #9
	BEQ s2s_9

s2s_1:
	LDR r0, ptr_to_spos
	MOV r1, #2
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f2
	BL output_string

	B sdone
s2s_2:
	LDR r0, ptr_to_spos
	MOV r1, #3
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f3
	BL output_string

	B sdone
s2s_3:
	LDR r0, ptr_to_spos
	MOV r1, #7
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	MOV r1, #5
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f7
	BL output_string

	B sdone
s2s_4:

	LDR r0, ptr_to_spos
	MOV r1, #5
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f5
	BL output_string

	B sdone
s2s_5:

	LDR r0, ptr_to_spos
	MOV r1, #6
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f6
	BL output_string

	B sdone
s2s_6:
	LDR r0, ptr_to_spos
	MOV r1, #8
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	MOV r1, #5
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f8
	BL output_string

	B sdone

s2s_7:

	LDR r0, ptr_to_spos
	MOV r1, #8
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f8
	BL output_string

	B sdone

s2s_8:
	LDR r0, ptr_to_spos
	MOV r1, #9
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f9
	BL output_string

	B sdone

s2s_9:

	LDR r0, ptr_to_spos
	MOV r1, #9
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	MOV r1, #5
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f9
	BL output_string

	B sdone

s3_s:
	LDR r0, ptr_to_spos
	LDR r1, [r0]

	CMP r1, #1
	BEQ s3s_1
	CMP r1, #2
	BEQ s3s_2
	CMP r1, #3
	BEQ s3s_3
	CMP r1, #4
	BEQ s3s_4
	CMP r1, #5
	BEQ s3s_5
	CMP r1, #6
	BEQ s3s_6
	CMP r1, #7
	BEQ s3s_7
	CMP r1, #8
	BEQ s3s_8
	CMP r1, #9
	BEQ s3s_9

s3s_1:
	LDR r0, ptr_to_spos
	MOV r1, #2
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f2
	BL output_string

	B sdone
s3s_2:
	LDR r0, ptr_to_spos
	MOV r1, #3
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f3
	BL output_string

	B sdone
s3s_3:
	LDR r0, ptr_to_spos
	MOV r1, #9
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	MOV r1, #9
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f9
	BL output_string

	B sdone
s3s_4:

	LDR r0, ptr_to_spos
	MOV r1, #5
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f5
	BL output_string

	B sdone
s3s_5:

	LDR r0, ptr_to_spos
	MOV r1, #6
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f6
	BL output_string

	B sdone
s3s_6:
	LDR r0, ptr_to_spos
	MOV r1, #6
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	MOV r1, #5
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f6
	BL output_string

	B sdone

s3s_7:

	LDR r0, ptr_to_spos
	MOV r1, #8
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f8
	BL output_string

	B sdone

s3s_8:
	LDR r0, ptr_to_spos
	MOV r1, #9
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f9
	BL output_string

	B sdone

s3s_9:

	LDR r0, ptr_to_spos
	MOV r1, #3
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	MOV r1, #5
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f3
	BL output_string

	B sdone

s4_s:
	LDR r0, ptr_to_spos
	LDR r1, [r0]

	CMP r1, #1
	BEQ s4s_1
	CMP r1, #2
	BEQ s4s_2
	CMP r1, #3
	BEQ s4s_3
	CMP r1, #4
	BEQ s4s_4
	CMP r1, #5
	BEQ s4s_5
	CMP r1, #6
	BEQ s4s_6
	CMP r1, #7
	BEQ s4s_7
	CMP r1, #8
	BEQ s4s_8
	CMP r1, #9
	BEQ s4s_9

s4s_1:
	LDR r0, ptr_to_spos
	MOV r1, #2
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f2
	BL output_string

	B sdone
s4s_2:
	LDR r0, ptr_to_spos
	MOV r1, #3
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f3
	BL output_string

	B sdone
s4s_3:
	LDR r0, ptr_to_spos
	MOV r1, #3
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	MOV r1, #5
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f3
	BL output_string

	B sdone
s4s_4:

	LDR r0, ptr_to_spos
	MOV r1, #5
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f5
	BL output_string

	B sdone
s4s_5:

	LDR r0, ptr_to_spos
	MOV r1, #6
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f6
	BL output_string

	B sdone
s4s_6:
	LDR r0, ptr_to_spos
	MOV r1, #2
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	MOV r1, #5
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f2
	BL output_string

	B sdone

s4s_7:

	LDR r0, ptr_to_spos
	MOV r1, #8
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f8
	BL output_string

	B sdone

s4s_8:
	LDR r0, ptr_to_spos
	MOV r1, #9
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f9
	BL output_string

	B sdone

s4s_9:

	LDR r0, ptr_to_spos
	MOV r1, #1
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	MOV r1, #5
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f1
	BL output_string

	B sdone

s5_s:
	LDR r0, ptr_to_spos
	LDR r1, [r0]

	CMP r1, #1
	BEQ s5s_1
	CMP r1, #2
	BEQ s5s_2
	CMP r1, #3
	BEQ s5s_3
	CMP r1, #4
	BEQ s5s_4
	CMP r1, #5
	BEQ s5s_5
	CMP r1, #6
	BEQ s5s_6
	CMP r1, #7
	BEQ s5s_7
	CMP r1, #8
	BEQ s5s_8
	CMP r1, #9
	BEQ s5s_9

s5s_1:
	LDR r0, ptr_to_spos
	MOV r1, #2
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f2
	BL output_string

	B sdone
s5s_2:
	LDR r0, ptr_to_spos
	MOV r1, #3
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f3
	BL output_string

	B sdone
s5s_3:
	LDR r0, ptr_to_spos
	MOV r1, #1
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	MOV r1, #0
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f1
	BL output_string

	B sdone
s5s_4:

	LDR r0, ptr_to_spos
	MOV r1, #5
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f5
	BL output_string

	B sdone
s5s_5:

	LDR r0, ptr_to_spos
	MOV r1, #6
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f6
	BL output_string

	B sdone
s5s_6:
	LDR r0, ptr_to_spos
	MOV r1, #4
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	MOV r1, #0
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f4
	BL output_string

	B sdone

s5s_7:

	LDR r0, ptr_to_spos
	MOV r1, #8
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f8
	BL output_string

	B sdone

s5s_8:
	LDR r0, ptr_to_spos
	MOV r1, #9
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f9
	BL output_string

	B sdone

s5s_9:

	LDR r0, ptr_to_spos
	MOV r1, #7
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	MOV r1, #0
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f7
	BL output_string

	B sdone

s6_s:
	LDR r0, ptr_to_spos
	LDR r1, [r0]

	CMP r1, #1
	BEQ s6s_1
	CMP r1, #2
	BEQ s6s_2
	CMP r1, #3
	BEQ s6s_3
	CMP r1, #4
	BEQ s6s_4
	CMP r1, #5
	BEQ s6s_5
	CMP r1, #6
	BEQ s6s_6
	CMP r1, #7
	BEQ s6s_7
	CMP r1, #8
	BEQ s6s_8
	CMP r1, #9
	BEQ s6s_9

s6s_1:
	LDR r0, ptr_to_spos
	MOV r1, #2
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f2
	BL output_string

	B sdone
s6s_2:
	LDR r0, ptr_to_spos
	MOV r1, #3
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f3
	BL output_string

	B sdone
s6s_3:
	LDR r0, ptr_to_spos
	MOV r1, #9
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	MOV r1, #2
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f9
	BL output_string

	B sdone
s6s_4:

	LDR r0, ptr_to_spos
	MOV r1, #5
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f5
	BL output_string

	B sdone
s6s_5:

	LDR r0, ptr_to_spos
	MOV r1, #6
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f6
	BL output_string

	B sdone
s6s_6:
	LDR r0, ptr_to_spos
	MOV r1, #6
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	MOV r1, #2
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f6
	BL output_string

	B sdone

s6s_7:

	LDR r0, ptr_to_spos
	MOV r1, #8
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f8
	BL output_string

	B sdone

s6s_8:
	LDR r0, ptr_to_spos
	MOV r1, #9
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f9
	BL output_string

	B sdone

s6s_9:

	LDR r0, ptr_to_spos
	MOV r1, #3
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	MOV r1, #2
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f3
	BL output_string

	B sdone


sdone:


	POP {r4-r12,lr}   ; Restore registers
    mov pc, lr
