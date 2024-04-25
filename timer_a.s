	.data
	.global board
	.global current
	.global pauseflag

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
	.global a_handler


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

a_handler:
	PUSH {r4-r12,lr}

	LDR r1, ptr_to_sideflag
	LDR r0, [r1]
	CMP r0, #0
	BEQ s1_a
	CMP r0, #1
	BEQ s2_a
	CMP r0, #2
	BEQ s3_a
	CMP r0, #3
	BEQ s4_a
	CMP r0, #4
	BEQ s5_a
	CMP r0, #5
	BEQ s6_a

s1_a:
	LDR r0, ptr_to_spos
	LDR r1, [r0]

	CMP r1, #1
	BEQ s1a_1
	CMP r1, #2
	BEQ s1a_2
	CMP r1, #3
	BEQ s1a_3
	CMP r1, #4
	BEQ s1a_4
	CMP r1, #5
	BEQ s1a_5
	CMP r1, #6
	BEQ s1a_6
	CMP r1, #7
	BEQ s1a_7
	CMP r1, #8
	BEQ s1a_8
	CMP r1, #9
	BEQ s1a_9

s1a_1:
	LDR r0, ptr_to_spos
	MOV r1, #7
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	MOV r1, #3
	STR r1, [r0]

	BL board_handler


	LDR r0, ptr_to_f7
	BL output_string

	B adone

s1a_2:
	LDR r0, ptr_to_spos
	MOV r1, #8
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	MOV r1, #3
	STR r1, [r0]

	BL board_handler


	LDR r0, ptr_to_f8
	BL output_string

	B adone
s1a_3:
	LDR r0, ptr_to_spos
	MOV r1, #9
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	MOV r1, #3
	STR r1, [r0]

	BL board_handler


	LDR r0, ptr_to_f9
	BL output_string

	B adone

s1a_4:

	LDR r0, ptr_to_spos
	MOV r1, #1
	STR r1, [r0]

	BL board_handler


	LDR r0, ptr_to_f1
	BL output_string

	B adone

s1a_5:

	LDR r0, ptr_to_spos
	MOV r1, #2
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f2
	BL output_string

	B adone

s1a_6:
	LDR r0, ptr_to_spos
	MOV r1, #3
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f3
	BL output_string

	B adone

s1a_7:

	LDR r0, ptr_to_spos
	MOV r1, #4
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f4
	BL output_string

	B adone

s1a_8:
	LDR r0, ptr_to_spos
	MOV r1, #5
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f5
	BL output_string

	B adone

s1a_9:

	LDR r0, ptr_to_spos
	MOV r1, #6
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f6
	BL output_string

	B adone

s2_a:
	LDR r0, ptr_to_spos
	LDR r1, [r0]

	CMP r1, #1
	BEQ s2a_1
	CMP r1, #2
	BEQ s2a_2
	CMP r1, #3
	BEQ s2a_3
	CMP r1, #4
	BEQ s2a_4
	CMP r1, #5
	BEQ s2a_5
	CMP r1, #6
	BEQ s2a_6
	CMP r1, #7
	BEQ s2a_7
	CMP r1, #8
	BEQ s2a_8
	CMP r1, #9
	BEQ s2a_9

s2a_1:
	LDR r0, ptr_to_spos
	MOV r1, #7
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	MOV r1, #0
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f7
	BL output_string

	B adone
s2a_2:
	LDR r0, ptr_to_spos
	MOV r1, #8
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	MOV r1, #0
	STR r1, [r0]

	BL board_handler


	LDR r0, ptr_to_f8
	BL output_string

	B adone
s2a_3:
	LDR r0, ptr_to_spos
	MOV r1, #9
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	MOV r1, #0
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f9
	BL output_string

	B adone
s2a_4:

	LDR r0, ptr_to_spos
	MOV r1, #1
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f1
	BL output_string

	B adone
s2a_5:

	LDR r0, ptr_to_spos
	MOV r1, #2
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f2
	BL output_string

	B adone
s2a_6:
	LDR r0, ptr_to_spos
	MOV r1, #3
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f3
	BL output_string

	B adone

s2a_7:

	LDR r0, ptr_to_spos
	MOV r1, #4
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f4
	BL output_string

	B adone

s2a_8:
	LDR r0, ptr_to_spos
	MOV r1, #5
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f5
	BL output_string

	B adone

s2a_9:

	LDR r0, ptr_to_spos
	MOV r1, #6
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f6
	BL output_string

	B adone

s3_a:
	LDR r0, ptr_to_spos
	LDR r1, [r0]

	CMP r1, #1
	BEQ s3a_1
	CMP r1, #2
	BEQ s3a_2
	CMP r1, #3
	BEQ s3a_3
	CMP r1, #4
	BEQ s3a_4
	CMP r1, #5
	BEQ s3a_5
	CMP r1, #6
	BEQ s3a_6
	CMP r1, #7
	BEQ s3a_7
	CMP r1, #8
	BEQ s3a_8
	CMP r1, #9
	BEQ s3a_9

s3a_1:
	LDR r0, ptr_to_spos
	MOV r1, #7
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	MOV r1, #1
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f7
	BL output_string

	B adone
s3a_2:
	LDR r0, ptr_to_spos
	MOV r1, #8
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	MOV r1, #1
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f8
	BL output_string

	B adone
s3a_3:
	LDR r0, ptr_to_spos
	MOV r1, #9
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	MOV r1, #1
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f9
	BL output_string

	B adone
s3a_4:

	LDR r0, ptr_to_spos
	MOV r1, #1
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f1
	BL output_string

	B adone
s3a_5:

	LDR r0, ptr_to_spos
	MOV r1, #2
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f2
	BL output_string

	B adone
s3a_6:
	LDR r0, ptr_to_spos
	MOV r1, #3
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f3
	BL output_string

	B adone

s3a_7:

	LDR r0, ptr_to_spos
	MOV r1, #4
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f4
	BL output_string

	B adone

s3a_8:
	LDR r0, ptr_to_spos
	MOV r1, #5
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f5
	BL output_string

	B adone

s3a_9:

	LDR r0, ptr_to_spos
	MOV r1, #6
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f6
	BL output_string

	B adone

s4_a:
	LDR r0, ptr_to_spos
	LDR r1, [r0]

	CMP r1, #1
	BEQ s4a_1
	CMP r1, #2
	BEQ s4a_2
	CMP r1, #3
	BEQ s4a_3
	CMP r1, #4
	BEQ s4a_4
	CMP r1, #5
	BEQ s4a_5
	CMP r1, #6
	BEQ s4a_6
	CMP r1, #7
	BEQ s4a_7
	CMP r1, #8
	BEQ s4a_8
	CMP r1, #9
	BEQ s4a_9

s4a_1:
	LDR r0, ptr_to_spos
	MOV r1, #7
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	MOV r1, #2
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f7
	BL output_string

	B adone
s4a_2:
	LDR r0, ptr_to_spos
	MOV r1, #8
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	MOV r1, #2
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f8
	BL output_string

	B adone
s4a_3:
	LDR r0, ptr_to_spos
	MOV r1, #9
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	MOV r1, #2
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f9
	BL output_string

	B adone
s4a_4:

	LDR r0, ptr_to_spos
	MOV r1, #1
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f1
	BL output_string

	B adone
s4a_5:

	LDR r0, ptr_to_spos
	MOV r1, #2
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f2
	BL output_string

	B adone
s4a_6:
	LDR r0, ptr_to_spos
	MOV r1, #3
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f3
	BL output_string

	B adone

s4a_7:

	LDR r0, ptr_to_spos
	MOV r1, #4
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f4
	BL output_string

	B adone

s4a_8:
	LDR r0, ptr_to_spos
	MOV r1, #5
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f5
	BL output_string

	B adone

s4a_9:

	LDR r0, ptr_to_spos
	MOV r1, #6
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f6
	BL output_string

	B adone

s5_a:
	LDR r0, ptr_to_spos
	LDR r1, [r0]

	CMP r1, #1
	BEQ s5a_1
	CMP r1, #2
	BEQ s5a_2
	CMP r1, #3
	BEQ s5a_3
	CMP r1, #4
	BEQ s5a_4
	CMP r1, #5
	BEQ s5a_5
	CMP r1, #6
	BEQ s5a_6
	CMP r1, #7
	BEQ s5a_7
	CMP r1, #8
	BEQ s5a_8
	CMP r1, #9
	BEQ s5a_9

s5a_1:
	LDR r0, ptr_to_spos
	MOV r1, #1
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	MOV r1, #3
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f1
	BL output_string

	B adone
s5a_2:
	LDR r0, ptr_to_spos
	MOV r1, #4
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	MOV r1, #3
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f4
	BL output_string

	B adone
s5a_3:
	LDR r0, ptr_to_spos
	MOV r1, #7
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	MOV r1, #3
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f7
	BL output_string

	B adone
s5a_4:

	LDR r0, ptr_to_spos
	MOV r1, #1
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f1
	BL output_string

	B adone
s5a_5:

	LDR r0, ptr_to_spos
	MOV r1, #2
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f2
	BL output_string

	B adone
s5a_6:
	LDR r0, ptr_to_spos
	MOV r1, #3
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f3
	BL output_string

	B adone

s5a_7:

	LDR r0, ptr_to_spos
	MOV r1, #4
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f4
	BL output_string

	B adone

s5a_8:
	LDR r0, ptr_to_spos
	MOV r1, #5
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f5
	BL output_string

	B adone

s5a_9:

	LDR r0, ptr_to_spos
	MOV r1, #6
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f6
	BL output_string

	B adone

s6_a:
	LDR r0, ptr_to_spos
	LDR r1, [r0]

	CMP r1, #1
	BEQ s6a_1
	CMP r1, #2
	BEQ s6a_2
	CMP r1, #3
	BEQ s6a_3
	CMP r1, #4
	BEQ s6a_4
	CMP r1, #5
	BEQ s6a_5
	CMP r1, #6
	BEQ s6a_6
	CMP r1, #7
	BEQ s6a_7
	CMP r1, #8
	BEQ s6a_8
	CMP r1, #9
	BEQ s6a_9

s6a_1:
	LDR r0, ptr_to_spos
	MOV r1, #9
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	MOV r1, #3
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f9
	BL output_string

	B adone
s6a_2:
	LDR r0, ptr_to_spos
	MOV r1, #6
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	MOV r1, #3
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f6
	BL output_string

	B adone
s6a_3:
	LDR r0, ptr_to_spos
	MOV r1, #3
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	MOV r1, #3
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f3
	BL output_string

	B adone
s6a_4:

	LDR r0, ptr_to_spos
	MOV r1, #1
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f1
	BL output_string

	B adone
s6a_5:

	LDR r0, ptr_to_spos
	MOV r1, #2
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f2
	BL output_string

	B adone
s6a_6:
	LDR r0, ptr_to_spos
	MOV r1, #3
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f3
	BL output_string

	B adone

s6a_7:

	LDR r0, ptr_to_spos
	MOV r1, #4
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f4
	BL output_string

	B adone

s6a_8:
	LDR r0, ptr_to_spos
	MOV r1, #5
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f5
	BL output_string

	B adone

s6a_9:

	LDR r0, ptr_to_spos
	MOV r1, #6
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f6
	BL output_string

	B adone

adone:


	POP {r4-r12,lr}   ; Restore registers
    mov pc, lr
