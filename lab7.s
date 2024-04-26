	.data

	.global board
	.global current
	.global pauseflag
	.global maxtime

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

	.global paused

	.global cursorcolor
	.global cubecolor


;cube1: .string "111111111",0
;cube2: .string "333333333",0
;cube3: .string "555555555",0
;cube4: .string "666666666",0
;cube5: .string "888888888",0
;cube6: .string "999999999",0

cube1: .string "161661681",0
cube2: .string "516633133",0
cube3: .string "366135861",0
cube4: .string "319353855",0
cube5: .string "858599598",0
cube6: .string "859988999",0

board:	.string "+--------------------+", 0xA, 0xD
		.string "|      |      |      |", 0xA, 0xD
		.string "|      |      |      |", 0xA, 0xD
		.string "|      |      |      |", 0xA, 0xD
		.string "|--------------------|", 0xA, 0xD
		.string "|      |      |      |", 0xA, 0xD
		.string "|      |      |      |", 0xA, 0xD
		.string "|      |      |      |", 0xA, 0xD
		.string "|--------------------|", 0xA, 0xD
		.string "|      |      |      |", 0xA, 0xD
		.string "|      |      |      |", 0xA, 0xD
		.string "|      |      |      |", 0xA, 0xD
		.string "+--------------------+", 0

scoreline:		.string 27,"[15;1H",0
clearline:		.string 27,"[K",0

;cursor positions
face1:			.string 27,"[44m"
				.string 27,"[3;4H  "
				.string 27,"[40m",0

face2:			.string 27,"[44m"
				.string 27,"[7;4H  "
				.string 27,"[40m",0

face3:			.string 27,"[44m"
				.string 27,"[11;4H  "
				.string 27,"[40m",0

face4:			.string 27,"[44m"
				.string 27,"[3;11H  "
				.string 27,"[40m",0

face5:			.string 27,"[44m"
				.string 27,"[7;11H  "
				.string 27,"[40m",0

face6:			.string 27,"[44m"
				.string 27,"[11;11H  "
				.string 27,"[40m",0

face7:			.string 27,"[44m"
				.string 27,"[3;18H  "
				.string 27,"[40m",0

face8:			.string 27,"[44m"
				.string 27,"[7;18H  "
				.string 27,"[40m",0

face9:			.string 27,"[44m"
				.string 27,"[11;18H  "
				.string 27,"[40m",0

;side 1

b1sqr1_1:		.string 27,"[2;2H      "
b1sqr1_2:		.string 27,"[3;2H      "
b1sqr1_3:		.string 27,"[4;2H      "
				.string 27,"[40m",0

b1sqr2_1:		.string 27,"[6;2H      "
b1sqr2_2:		.string 27,"[7;2H      "
b1sqr2_3:		.string 27,"[8;2H      "
				.string 27,"[40m",0

b1sqr3_1:		.string 27,"[10;2H      "
b1sqr3_2:		.string 27,"[11;2H      "
b1sqr3_3:		.string 27,"[12;2H      "
				.string 27,"[40m",0

b1sqr4_1:		.string 27,"[2;9H      "
b1sqr4_2:		.string 27,"[3;9H      "
b1sqr4_3:		.string 27,"[4;9H      "
				.string 27,"[40m",0

b1sqr5_1:		.string 27,"[6;9H      "
b1sqr5_2:		.string 27,"[7;9H      "
b1sqr5_3:		.string 27,"[8;9H      "
				.string 27,"[40m",0

b1sqr6_1:		.string 27,"[10;9H      "
b1sqr6_2:		.string 27,"[11;9H      "
b1sqr6_3:		.string 27,"[12;9H      "
				.string 27,"[40m",0

b1sqr7_1:		.string 27,"[2;16H      "
b1sqr7_2:		.string 27,"[3;16H      "
b1sqr7_3:		.string 27,"[4;16H      "
				.string 27,"[40m",0

b1sqr8_1:		.string 27,"[6;16H      "
b1sqr8_2:		.string 27,"[7;16H      "
b1sqr8_3:		.string 27,"[8;16H      "
				.string 27,"[40m",0

b1sqr9_1:		.string 27,"[10;16H      "
b1sqr9_2:		.string 27,"[11;16H      "
b1sqr9_3:		.string 27,"[12;16H      "
				.string 27,"[40m",0

redtile: 	.string 27,"[41m",0
bluetile: 	.string 27,"[44m",0
whitetile:  .string 27,"[47m",0
greentile:  .string 27,"[42m",0
yellowtile: .string 27,"[43m",0
purpletile: .string 27,"[45m",0
resettile: 	.string 27,"[40m",0


paused: 			.string 27,"[3;9HGame Paused""",0


prompt1: 			.string "******************************************", 0xA, 0xD
					.string "  Welcome to the CSE379 RUBIX CUBE game!  ", 0xA, 0xD
					.string "******************************************", 0xA, 0xD
					.string " Press enter to begin setting up the game ", 0xA, 0xD
					.string "******************************************", 0xA, 0xD
					.string "",0x0

prompt2: 			.string "******************************************", 0xA, 0xD
					.string "  		Press SW2 For Unlimited Time ", 0xA, 0xD
					.string "******************************************", 0xA, 0xD
					.string "  		  Press SW3 For 300 Seconds ", 0xA, 0xD
					.string "******************************************", 0xA, 0xD
					.string "  		  Press SW4 For 200 Seconds ", 0xA, 0xD
					.string "******************************************", 0xA, 0xD
					.string "  		  Press SW5 For 100 Seconds ", 0xA, 0xD
					.string "******************************************", 0xA, 0xD
					.string "",0x0

rprompt: 			.string "******************************************", 0xA, 0xD
					.string "      Would You Like to Run It Back?  ", 0xA, 0xD
					.string "******************************************", 0xA, 0xD
					.string "       Press enter to start again", 0xA, 0xD
					.string "******************************************", 0xA, 0xD
					.string "",0x0


clearscreen: 		.string 27,"[2J",0
leftside: 			.string 27,"[0;0H",0



newLine: 			.cstring "\r\n"

timeOutput: 		.string "                                h"
time: 				.word 90
runningtime:	.cstring "time: "

moveOutput: 		.string "                                h"
moves: 				.word 0
runningmoves:		.cstring "Moves: "


current:		.string "x",0
position: 		.word 0xFB	; center
pauseflag:		.word 0
sideflag:		.word 0
positionflag:	.word 0		; used to render the board
startingpos:	.word 5		; used to track the cursor

data:			.string "",0
maxtime: 		.word -1

cursorcolor:	.word 51
cubecolor:		.word 0


;_______________________________________________________________________________________
	.text

	.global uart_interrupt_init
	.global gpio_interrupt_init
	.global timer_interrupt_init
	.global UART0_Handler
	.global Switch_Handler
	.global Timer_Handler			; This is needed for Lab #6
	.global simple_read_character
	.global lab7
	.global board_handler
	.global read_from_push_btns		; alice board inputs
	.global gpio_btn_and_LED_init
	.global color_handler
	.global space_handler
	.global illuminate_RGB_LED
	.global side_checker
	.global validate_move



	.global w_handler
	.global a_handler
	.global s_handler
	.global d_handler


	; from library file
	.global output_character		; This is from your Lab #4 Library
	.global read_string				; This is from your Lab #4 Library
	.global output_string			; This is from your Lab #4 Library
	.global uart_init				; This is from your Lab #4 Library
	.global int2string				; This is from your Lab #4 Library
	.global read_character
	.global cursor_color


;_______________________________________________________________________________________

U0FR: 		.equ 0x18

;_______________________________________________________________________________________


ptr_to_board: 			.word board
ptr_to_clearscreen:		.word clearscreen
ptr_to_leftside			.word leftside

ptr_to_paused: 			.word paused


ptr_to_time:			.word time
ptr_to_runningtime: 	.word runningtime
ptr_timeOutput: 		.word timeOutput

ptr_to_moves:			.word moves
ptr_to_runningmoves: 	.word runningmoves
ptr_moveOutput: 		.word moveOutput


ptr_newLine: 			.word newLine

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


ptr_to_scoreline:		.word scoreline

ptr_to_prompt1:			.word prompt1
ptr_to_prompt2:			.word prompt2

ptr_to_rprompt:			.word rprompt
ptr_to_data:			.word data
ptr_to_maxtime:			.word maxtime

ptr_to_cubecolor		.word cubecolor
ptr_to_cursorcolor		.word cursorcolor
;_______________________________________________________________________________________

lab7:
	PUSH {r4-r12,lr}

	;initializes the things
 	BL uart_init
	BL uart_interrupt_init
	BL gpio_interrupt_init
	BL gpio_btn_and_LED_init

new_start
	LDR r0, ptr_to_clearscreen	; clears the uart
	BL output_string

	LDR r0, ptr_to_leftside		; Goes to left side idk why but from lect
	BL output_string

	LDR r0, ptr_to_pauseflag
	MOV r1, #0
	STR r1, [r0]

	LDR r2, ptr_to_time
	MOV r1, #0
	STR r1, [r2]


invalid_start:
	LDR r0, ptr_to_prompt1
	BL output_string

	BL read_character

	CMP r0, #13
	BNE invalid_start

	LDR r0, ptr_to_clearscreen	; clears the uart
	BL output_string

	LDR r0, ptr_to_leftside		; Goes to left side idk why but from lect
	BL output_string

;	LDR r0, ptr_to_prompt2		;prompt to setup time limit
;	BL output_string

;	BL read_from_push_btns		;reads input from alice

	BL timer_interrupt_init

	BL board_handler

	BL color_handler

lab7loop:

	B lab7loop

lab7GameEnd

	LDR r0, ptr_to_pauseflag
	MOV r1, #1
	STR r1, [r0]

	LDR r0, ptr_to_clearscreen	; clears the uart
	BL output_string

	LDR r0, ptr_to_leftside		; Goes to left side idk why but from lect
	BL output_string

	;outputs score during each tick
	LDR r0, ptr_to_runningtime
	BL output_string


	LDR r0, ptr_timeOutput
	LDR r2, ptr_to_time
	LDR r1, [r2]
	BL int2string

	LDR r0, ptr_timeOutput
	BL output_string

	LDR r0, ptr_newLine
	BL output_string


	LDR r0, ptr_to_runningmoves
	BL output_string


	LDR r0, ptr_moveOutput
	LDR r2, ptr_to_moves
	LDR r1, [r2]
	BL int2string

	LDR r0, ptr_moveOutput
	BL output_string
	LDR r0, ptr_newLine
	BL output_string

	LDR r0, ptr_to_rprompt
	BL output_string

	BL read_character

	CMP r0, #13
	BEQ new_start


	B end


	POP {lr}
	MOV pc, lr


;_______________________________________________________________________________________





Timer_Handler:
	PUSH {r4-r12,lr}


	MOV r0, #0x0000				; clear interrupt
	MOVT r0, #0x4003
	LDRB r1, [r0, #0x024]
	ORR r1, #1
	STRB r1, [r0, #0x024]

								; check pause
	LDR r0, ptr_to_pauseflag
	LDR r1, [r0]
	CMP r1, #1
	BEQ PAUSE


							; prev keys
	LDR r0, ptr_to_current
	LDR r1, [r0]
	CMP r1, #'s'
	BEQ sletter
	CMP r1, #'d'
	BEQ dletter
	CMP r1, #'a'
	BEQ aletter
	CMP r1, #'w'
	BEQ wletter
	CMP r1, #' '
	BEQ spaceletter

	BNE mdone

;_______________________________________________________________________________________

wletter:

	BL w_handler


	LDR r0, ptr_to_moves	;increases the moves by 1
	LDR r1, [r0]
	ADD r1, r1, #1
	STR r1, [r0]

	BL color_handler

	B mdone

;_______________________________________________________________________________________


aletter:

	BL a_handler

	LDR r0, ptr_position
	LDR r1, [r0]

	LDR r0, ptr_to_moves	;increases the moves by 1
	LDR r1, [r0]
	ADD r1, r1, #1
	STR r1, [r0]

	BL color_handler


	B mdone

;_______________________________________________________________________________________

sletter:

	BL s_handler

	LDR r0, ptr_position
	LDR r1, [r0]

	LDR r0, ptr_to_moves	;increases the moves by 1
	LDR r1, [r0]
	ADD r1, r1, #1
	STR r1, [r0]

	BL color_handler

	B mdone

;_______________________________________________________________________________________


dletter:


	BL d_handler

	LDR r0, ptr_position
	LDR r1, [r0]

	LDR r0, ptr_to_moves	;increases the moves by 1
	LDR r1, [r0]
	ADD r1, r1, #1
	STR r1, [r0]

	BL color_handler


	B mdone

;_______________________________________________________________________________________

spaceletter:

	BL space_handler

	BL cursor_color

	BL color_handler

	BL board_handler



	B mdone

mdone:


	LDR r0, ptr_to_time	;increases the score by 1
	LDR r1, [r0]
	ADD r1, r1, #1
	STR r1, [r0]
	B outputFunction


outputFunction:

	LDR r0, ptr_to_scoreline
	BL output_string

	LDR r0, ptr_to_clearline
	BL output_string

	LDR r0, ptr_to_leftside		; Goes to left side idk why but from lect
	BL output_string



	LDR r0, ptr_to_scoreline
	BL output_string

	LDR r0, ptr_to_runningtime ;prints time
	BL output_string

	LDR r0, ptr_timeOutput
	LDR r2, ptr_to_time
	LDR r1, [r2]
	BL int2string

	LDR r0, ptr_timeOutput
	BL output_string

	LDR r2, ptr_to_time
	LDR r1, [r2]
	LDR r3, ptr_to_maxtime
	LDR r4, [r3]
	CMP r1, r4
	BEQ lab7GameEnd



    LDR r0, ptr_newLine
	BL output_string

	LDR r0, ptr_to_runningmoves ;prints score
	BL output_string

	LDR r0, ptr_moveOutput
	LDR r2, ptr_to_moves
	LDR r1, [r2]
	BL int2string

	LDR r0, ptr_moveOutput
	BL output_string

	LDR r0, ptr_to_current
	LDR r1, [r0]
	MOV r1, #'x'
	STR r1, [r0]


    B timerEnd

lout:

	LDR r0, ptr_to_clearscreen	; clears the uart
	BL output_string

	LDR r0, ptr_to_leftside		; Goes to left side idk why but from lect
	BL output_string


    B timerEnd

PAUSE:

	LDR r0, ptr_to_paused
	BL output_string

timerEnd:
	POP {r4-r12,lr}
	BX lr       	; Return

end:

	.end

