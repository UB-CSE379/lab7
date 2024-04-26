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
	.global w_handler
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


color_helper
	PUSH {r4-r12,lr}

	LDR r0, ptr_to_sideflag
	LDR r1, [r0]
	CMP r1, #0
	BEQ helper_face1
	CMP r1, #1
	BEQ helper_face2
	CMP r1, #2
	BEQ helper_face3
	CMP r1, #3
	BEQ helper_face4
	CMP r1, #4
	BEQ helper_face5
	CMP r1, #5
	BEQ helper_face6

helper_face1:
	LDR r6, ptr_to_s1

	b helper_finder

helper_face2:
	LDR r6, ptr_to_s2

	b helper_finder

helper_face3:
	LDR r6, ptr_to_s3

	b helper_finder

helper_face4:
	LDR r6, ptr_to_s4

	b helper_finder

helper_face5:
	LDR r6, ptr_to_s5

	b helper_finder

helper_face6:
	LDR r6, ptr_to_s6

	b helper_finder


helper_finder:
	LDR r0, ptr_to_spos
	LDR r1, [r0]
helper_loop
	CMP r1, #1
	BEQ helper_end


	ADD r6, r6, #1
	SUB r1, r1, #1
	B helper_loop


helper_end:
	LDRB r0, [r6]
	LDR r1, ptr_to_cubecolor
;	STRB r0, [r1]


	POP {r4-r12,lr}   ; Restore registers
    mov pc, lr

;______________________________________________________________________________________________________________

w_handler:
	PUSH {r4-r12,lr}

	LDR r1, ptr_to_sideflag
	LDR r0, [r1]
	CMP r0, #0
	BEQ s1_w
	CMP r0, #1
	BEQ s2_w
	CMP r0, #2
	BEQ s3_w
	CMP r0, #3
	BEQ s4_w
	CMP r0, #4
	BEQ s5_w
	CMP r0, #5
	BEQ s6_w

s1_w:

	LDR r0, ptr_to_spos
	LDR r1, [r0]

	CMP r1, #1
	BEQ s1w_1
	CMP r1, #2
	BEQ s1w_2
	CMP r1, #3
	BEQ s1w_3
	CMP r1, #4
	BEQ s1w_4
	CMP r1, #5
	BEQ s1w_5
	CMP r1, #6
	BEQ s1w_6
	CMP r1, #7
	BEQ s1w_7
	CMP r1, #8
	BEQ s1w_8
	CMP r1, #9
	BEQ s1w_9

s1w_1:
	LDR r0, ptr_to_spos
	LDR r4, [r0]				;******
	MOV r1, #3
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	LDR r5, [r0]				;******
	MOV r1, #4
	STR r1, [r0]

	BL color_helper		;finds color of new face into r0

	LDR r1, ptr_to_cursorcolor	;******
	LDR r2, [r1]				;******

	CMP r0, r2					;******
	BNE skipper_s1w1			;******


	LDR r0, ptr_to_spos			;******
	STR r4, [r0]				;******

	LDR r0, ptr_to_sideflag		;******
	STR r5, [r0]				;******

	B fix_s1w1				;******


skipper_s1w1:					;******

	BL board_handler


	LDR r0, ptr_to_f3
	BL output_string

fix_s1w1:					;******

	B wdone

s1w_2:

	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #1
	STR r1, [r0]

	BL color_helper

	LDR r1, ptr_to_cursorcolor	;******
	LDR r2, [r1]				;******

	CMP r0, r2					;******
	BNE skipper_s1w2			;******

	LDR r0, ptr_to_spos			;******
	STR r4, [r0]				;******

	B fix_s1w2				;******

skipper_s1w2:					;******

	BL board_handler

	LDR r0, ptr_to_f1
	BL output_string

fix_s1w2:					;******

	B wdone


s1w_3:
	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #2
	STR r1, [r0]

	BL color_helper

	LDR r1, ptr_to_cursorcolor	;******
	LDR r2, [r1]				;******

	CMP r0, r2					;******
	BNE skipper_s1w3			;******

	LDR r0, ptr_to_spos			;******
	STR r4, [r0]				;******

	B fix_s1w3				;******

skipper_s1w3:					;******

	BL board_handler

	LDR r0, ptr_to_f2
	BL output_string

fix_s1w3:

	B wdone

s1w_4:

	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #6
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	LDR r5, [r0]
	MOV r1, #4
	STR r1, [r0]

	BL color_helper

	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s1w4


	LDR r0, ptr_to_spos
	STR r4, [r0]

	LDR r0, ptr_to_sideflag
	STR r5, [r0]

	B fix_s1w4

skipper_s1w4:

	BL board_handler

	LDR r0, ptr_to_f6
	BL output_string

fix_s1w4:

	B wdone

s1w_5:

	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #4
	STR r1, [r0]

	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s1w5

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_s1w5

skipper_s1w5:

	BL board_handler

	LDR r0, ptr_to_f4
	BL output_string

fix_s1w5:

	B wdone

s1w_6:
	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #5
	STR r1, [r0]

	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s1w6

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_s1w6

skipper_s1w6:

	BL board_handler

	LDR r0, ptr_to_f5
	BL output_string

fix_s1w6:

	B wdone

s1w_7:

	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #9
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	LDR r5, [r0]
	MOV r1, #4
	STR r1, [r0]

	BL color_helper

	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s1w7


	LDR r0, ptr_to_spos
	STR r4, [r0]

	LDR r0, ptr_to_sideflag
	STR r5, [r0]

	B fix_s1w7

skipper_s1w7:

	BL board_handler


	LDR r0, ptr_to_f9
	BL output_string


fix_s1w7:

	B wdone

s1w_8:
	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #7
	STR r1, [r0]

	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s1w8

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_s1w8

skipper_s1w8:

	BL board_handler

	LDR r0, ptr_to_f7
	BL output_string

fix_s1w8:

	B wdone

s1w_9:

	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #8
	STR r1, [r0]

	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s1w9

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_s1w9

skipper_s1w9:

	BL board_handler

	LDR r0, ptr_to_f8
	BL output_string

fix_s1w9:

	B wdone



s2_w:
	LDR r0, ptr_to_spos
	LDR r1, [r0]

	CMP r1, #1
	BEQ s2w_1
	CMP r1, #2
	BEQ s2w_2
	CMP r1, #3
	BEQ s2w_3
	CMP r1, #4
	BEQ s2w_4
	CMP r1, #5
	BEQ s2w_5
	CMP r1, #6
	BEQ s2w_6
	CMP r1, #7
	BEQ s2w_7
	CMP r1, #8
	BEQ s2w_8
	CMP r1, #9
	BEQ s2w_9

s2w_1:
	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #9
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	LDR r5, [r0]
	MOV r1, #4
	STR r1, [r0]

	BL color_helper

	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s2w1


	LDR r0, ptr_to_spos
	STR r4, [r0]

	LDR r0, ptr_to_sideflag
	STR r5, [r0]

	B fix_s2w1

skipper_s2w1:

	BL board_handler


	LDR r0, ptr_to_f9
	BL output_string

fix_s2w1:

	B wdone

s2w_2:

	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #1
	STR r1, [r0]

	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s2w2

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_s2w2

skipper_s2w2:

	BL board_handler

	LDR r0, ptr_to_f1
	BL output_string

fix_s2w2:

	B wdone

s2w_3:
	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #2
	STR r1, [r0]

	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s2w3

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_s2w3

skipper_s2w3:

	BL board_handler

	LDR r0, ptr_to_f2
	BL output_string

fix_s2w3:

	B wdone

s2w_4:

	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #8
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	LDR r5, [r0]
	MOV r1, #4
	STR r1, [r0]

	BL color_helper

	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s2w4


	LDR r0, ptr_to_spos
	STR r4, [r0]

	LDR r0, ptr_to_sideflag
	STR r5, [r0]

	B fix_s2w4

skipper_s2w4:

	BL board_handler


	LDR r0, ptr_to_f8
	BL output_string

fix_s2w4:

	B wdone

s2w_5:

	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #4
	STR r1, [r0]

	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s2w5

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_s2w5

skipper_s2w5:

	BL board_handler

	LDR r0, ptr_to_f4
	BL output_string

fix_s2w5:

	B wdone

s2w_6:
	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #5
	STR r1, [r0]

	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s2w6

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_s2w6

skipper_s2w6:

	BL board_handler

	LDR r0, ptr_to_f5
	BL output_string

fix_s2w6:

	B wdone

s2w_7:

	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #7
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	LDR r5, [r0]
	MOV r1, #4
	STR r1, [r0]

	BL color_helper

	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s2w7


	LDR r0, ptr_to_spos
	STR r4, [r0]

	LDR r0, ptr_to_sideflag
	STR r5, [r0]

	B fix_s2w7

skipper_s2w7:

	BL board_handler


	LDR r0, ptr_to_f7
	BL output_string

fix_s2w7:

	B wdone

s2w_8:
	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #7
	STR r1, [r0]

	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s2w8

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_s2w8

skipper_s2w8:

	BL board_handler

	LDR r0, ptr_to_f7
	BL output_string

fix_s2w8:

	B wdone

s2w_9:

	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #8
	STR r1, [r0]

	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s2w9

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_s2w9

skipper_s2w9:

	BL board_handler

	LDR r0, ptr_to_f8
	BL output_string

fix_s2w9:

	B wdone

s3_w:
	LDR r0, ptr_to_spos
	LDR r1, [r0]

	CMP r1, #1
	BEQ s3w_1
	CMP r1, #2
	BEQ s3w_2
	CMP r1, #3
	BEQ s3w_3
	CMP r1, #4
	BEQ s3w_4
	CMP r1, #5
	BEQ s3w_5
	CMP r1, #6
	BEQ s3w_6
	CMP r1, #7
	BEQ s3w_7
	CMP r1, #8
	BEQ s3w_8
	CMP r1, #9
	BEQ s3w_9

s3w_1:
	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #7
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	LDR r5, [r0]
	MOV r1, #4
	STR r1, [r0]

	BL color_helper

	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s3w1


	LDR r0, ptr_to_spos
	STR r4, [r0]

	LDR r0, ptr_to_sideflag
	STR r5, [r0]

	B fix_s3w1

skipper_s3w1:
	BL board_handler

	LDR r0, ptr_to_f7
	BL output_string

fix_s3w1:

	B wdone

s3w_2:

	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #1
	STR r1, [r0]

	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s3w2

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_s3w2

skipper_s3w2:
	BL board_handler

	LDR r0, ptr_to_f1
	BL output_string

fix_s3w2:

	B wdone


s3w_3:
	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #2
	STR r1, [r0]

	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s3w3

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_s3w3

skipper_s3w3:
	BL board_handler

	LDR r0, ptr_to_f2
	BL output_string

fix_s3w3:

	B wdone

s3w_4:

	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #4
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	LDR r5, [r0]
	MOV r1, #4
	STR r1, [r0]
	BL color_helper

	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s3w4


	LDR r0, ptr_to_spos
	STR r4, [r0]

	LDR r0, ptr_to_sideflag
	STR r5, [r0]

	B fix_s3w4

skipper_s3w4:

	BL board_handler

	LDR r0, ptr_to_f4
	BL output_string
fix_s3w4:

	B wdone

s3w_5:

	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #4
	STR r1, [r0]

	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s3w5

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_s3w5

skipper_s3w5:

	BL board_handler

	LDR r0, ptr_to_f4
	BL output_string
fix_s3w5:

	B wdone

s3w_6:
	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #5
	STR r1, [r0]

	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s3w6

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_s3w6

skipper_s3w6:

	BL board_handler

	LDR r0, ptr_to_f5
	BL output_string
fix_s3w6:

	B wdone

s3w_7:

	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #1
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	LDR r5, [r0]
	MOV r1, #4
	STR r1, [r0]
	BL color_helper

	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s3w7


	LDR r0, ptr_to_spos
	STR r4, [r0]

	LDR r0, ptr_to_sideflag
	STR r5, [r0]

	B fix_s3w7

skipper_s3w7:

	BL board_handler

	LDR r0, ptr_to_f1
	BL output_string
fix_s3w7:

	B wdone

s3w_8:
	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #7
	STR r1, [r0]

	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s3w8

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_s3w8

skipper_s3w8:

	BL board_handler

	LDR r0, ptr_to_f7
	BL output_string
fix_s3w8:
	B wdone

s3w_9:

	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #8
	STR r1, [r0]
	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s3w9

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_s3w9

skipper_s3w9:

	BL board_handler

	LDR r0, ptr_to_f8
	BL output_string
fix_s3w9:

	B wdone

s4_w:
	LDR r0, ptr_to_spos
	LDR r1, [r0]

	CMP r1, #1
	BEQ s4w_1
	CMP r1, #2
	BEQ s4w_2
	CMP r1, #3
	BEQ s4w_3
	CMP r1, #4
	BEQ s4w_4
	CMP r1, #5
	BEQ s4w_5
	CMP r1, #6
	BEQ s4w_6
	CMP r1, #7
	BEQ s4w_7
	CMP r1, #8
	BEQ s4w_8
	CMP r1, #9
	BEQ s4w_9

s4w_1:
	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #1
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	LDR r5, [r0]
	MOV r1, #4
	STR r1, [r0]

	BL color_helper

	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s4w1


	LDR r0, ptr_to_spos
	STR r4, [r0]

	LDR r0, ptr_to_sideflag
	STR r5, [r0]

	B fix_s4w1

skipper_s4w1:

	BL board_handler


	LDR r0, ptr_to_f1
	BL output_string

fix_s4w1:

	B wdone

s4w_2:

	LDR r0, ptr_to_spos
	MOV r1, #1
	STR r1, [r0]


	BL board_handler

	LDR r0, ptr_to_f1
	BL output_string

	B wdone


s4w_3:
	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #2
	STR r1, [r0]
	BL color_helper
	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s4w3

	LDR r0, ptr_to_spos
	STR r4, [r0]

	B fix_s4w3

skipper_s4w3:

	BL board_handler

	LDR r0, ptr_to_f2
	BL output_string

fix_s4w3:

	B wdone

s4w_4:

	LDR r0, ptr_to_spos
	LDR r4, [r0]
	MOV r1, #2
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	LDR r5, [r0]
	MOV r1, #4
	STR r1, [r0]
	BL color_helper

	LDR r1, ptr_to_cursorcolor
	LDR r2, [r1]

	CMP r0, r2
	BNE skipper_s4w4


	LDR r0, ptr_to_spos
	STR r4, [r0]

	LDR r0, ptr_to_sideflag
	STR r5, [r0]

	B fix_s4w4

skipper_s4w4:

	BL board_handler

	LDR r0, ptr_to_f2
	BL output_string
fix_s4w4:

	B wdone

s4w_5:

	LDR r0, ptr_to_spos
	MOV r1, #4
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f4
	BL output_string

	B wdone

s4w_6:
	LDR r0, ptr_to_spos
	MOV r1, #5
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f5
	BL output_string

	B wdone

s4w_7:

	LDR r0, ptr_to_spos
	MOV r1, #3
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	MOV r1, #4
	STR r1, [r0]

	BL board_handler


	LDR r0, ptr_to_f3
	BL output_string

	B wdone

s4w_8:
	LDR r0, ptr_to_spos
	MOV r1, #7
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f7
	BL output_string

	B wdone

s4w_9:

	LDR r0, ptr_to_spos
	MOV r1, #8
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f8
	BL output_string

	B wdone

s5_w:

	LDR r0, ptr_to_spos
	LDR r1, [r0]

	CMP r1, #1
	BEQ s5w_1
	CMP r1, #2
	BEQ s5w_2
	CMP r1, #3
	BEQ s5w_3
	CMP r1, #4
	BEQ s5w_4
	CMP r1, #5
	BEQ s5w_5
	CMP r1, #6
	BEQ s5w_6
	CMP r1, #7
	BEQ s5w_7
	CMP r1, #8
	BEQ s5w_8
	CMP r1, #9
	BEQ s5w_9

s5w_1:
	LDR r0, ptr_to_spos
	MOV r1, #7
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	MOV r1, #2
	STR r1, [r0]

	BL board_handler


	LDR r0, ptr_to_f7
	BL output_string

	B wdone

s5w_2:

	LDR r0, ptr_to_spos
	MOV r1, #1
	STR r1, [r0]


	BL board_handler

	LDR r0, ptr_to_f1
	BL output_string

	B wdone


s5w_3:
	LDR r0, ptr_to_spos
	MOV r1, #2
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f2
	BL output_string

	B wdone

s5w_4:

	LDR r0, ptr_to_spos
	MOV r1, #4
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	MOV r1, #2
	STR r1, [r0]

	BL board_handler


	LDR r0, ptr_to_f4
	BL output_string

	B wdone

s5w_5:

	LDR r0, ptr_to_spos
	MOV r1, #4
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f4
	BL output_string

	B wdone

s5w_6:
	LDR r0, ptr_to_spos
	MOV r1, #5
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f5
	BL output_string

	B wdone

s5w_7:

	LDR r0, ptr_to_spos
	MOV r1, #1
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	MOV r1, #2
	STR r1, [r0]

	BL board_handler


	LDR r0, ptr_to_f1
	BL output_string

	B wdone

s5w_8:
	LDR r0, ptr_to_spos
	MOV r1, #7
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f7
	BL output_string

	B wdone

s5w_9:

	LDR r0, ptr_to_spos
	MOV r1, #8
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f8
	BL output_string

	B wdone

s6_w:
	LDR r0, ptr_to_spos
	LDR r1, [r0]

	CMP r1, #1
	BEQ s6w_1
	CMP r1, #2
	BEQ s6w_2
	CMP r1, #3
	BEQ s6w_3
	CMP r1, #4
	BEQ s6w_4
	CMP r1, #5
	BEQ s6w_5
	CMP r1, #6
	BEQ s6w_6
	CMP r1, #7
	BEQ s6w_7
	CMP r1, #8
	BEQ s6w_8
	CMP r1, #9
	BEQ s6w_9

s6w_1:
	LDR r0, ptr_to_spos
	MOV r1, #3
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	MOV r1, #0
	STR r1, [r0]

	BL board_handler


	LDR r0, ptr_to_f3
	BL output_string

	B wdone

s6w_2:

	LDR r0, ptr_to_spos
	MOV r1, #1
	STR r1, [r0]


	BL board_handler

	LDR r0, ptr_to_f1
	BL output_string

	B wdone


s6w_3:
	LDR r0, ptr_to_spos
	MOV r1, #2
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f2
	BL output_string

	B wdone

s6w_4:

	LDR r0, ptr_to_spos
	MOV r1, #6
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	MOV r1, #0
	STR r1, [r0]

	BL board_handler


	LDR r0, ptr_to_f6
	BL output_string

	B wdone

s6w_5:

	LDR r0, ptr_to_spos
	MOV r1, #4
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f4
	BL output_string

	B wdone

s6w_6:
	LDR r0, ptr_to_spos
	MOV r1, #5
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f5
	BL output_string

	B wdone

s6w_7:

	LDR r0, ptr_to_spos
	MOV r1, #9
	STR r1, [r0]

	LDR r0, ptr_to_sideflag
	MOV r1, #0
	STR r1, [r0]

	BL board_handler


	LDR r0, ptr_to_f9
	BL output_string

	B wdone

s6w_8:
	LDR r0, ptr_to_spos
	MOV r1, #7
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f7
	BL output_string

	B wdone

s6w_9:

	LDR r0, ptr_to_spos
	MOV r1, #8
	STR r1, [r0]

	BL board_handler

	LDR r0, ptr_to_f8
	BL output_string

	B wdone

wdone:


	POP {r4-r12,lr}   ; Restore registers
    mov pc, lr
;________________________________________________________________________________________________________________________

