	.data

	.global board
	.global current
	.global pauseflag
	.global maxTime

testinglookuptable: .string "123456789",0



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


redtile: 	.string 27,"[41m",0
bluetile: 	.string 27,"[44m",0
whitetile:  .string 27,"[47m",0
greentile:  .string 27,"[42m",0
yellowtile: .string 27,"[43m",0
purpletile: .string 27,"[45m",0
resettile: 	.string 27,"[40m",0

select_time_prompt:
					.string "", 0xA, 0xD
					.string "Select one of the Momementary Buttons on the Alice Board for a time limit", 0xA, 0xD
					.string "Press SW5 - 100 second limit", 0xA, 0xD
					.string "Press SW4 - 200 second limit", 0xA, 0xD
					.string "Press SW3 - 300 second limit", 0xA, 0xD
					.string "Press SW2 - No time limit", 0xA, 0xD
					
paused: 			.string "", 0xA, 0xD
					.string "Game Paused!!!", 0xA, 0xD
					.string "",0x0


clearscreen: 		.string 27,"[2J",0
leftside: 			.string 27,"[0;0H",0



newLine: 			.cstring "\r\n"

timeOutput: 		.string "                                h"
time: 				.word 0
runningtime:	.cstring "time: "

moveOutput: 		.string "                                h"
moves: 				.word 0
runningmoves:		.cstring "Moves: "


current:		.string "x",0
position: 		.word 0xFB	; center
pauseflag:		.word 0


;_______________________________________________________________________________________
	.text

	.global uart_interrupt_init
	.global gpio_interrupt_init
	.global timer_interrupt_init
	.global gpio_btn_and_LED_init
	.global UART0_Handler
	.global Switch_Handler
	.global Timer_Handler			; This is needed for Lab #6
	.global simple_read_character
	.global lab7


	; from library file
	.global output_character		; This is from your Lab #4 Library
	.global read_string				; This is from your Lab #4 Library
	.global output_string			; This is from your Lab #4 Library
	.global uart_init				; This is from your Lab #4 Library
	.global int2string				; This is from your Lab #4 Library
	.global read_from_push_btns

;_______________________________________________________________________________________

U0FR: 		.equ 0x18

;_______________________________________________________________________________________


ptr_to_board: 			.word board
ptr_to_clearscreen:		.word clearscreen
ptr_to_leftside:		.word leftside

ptr_to_alice_prompt:	.word select_time_prompt
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

ptr_to_redtile:			.word redtile
ptr_to_bluetile:		.word bluetile
ptr_to_greentile:		.word greentile
ptr_to_whitetile:		.word whitetile
ptr_to_purpletile:		.word purpletile
ptr_to_yellowtile:		.word yellowtile
ptr_to_resettile:		.word resettile
ptr_to_clearline:		.word clearline

ptr_to_b1sqr1_1:		.word b1sqr1_1
ptr_to_b1sqr1_2:		.word b1sqr1_2
ptr_to_b1sqr1_3:		.word b1sqr1_3

ptr_to_b1sqr2_1:		.word b1sqr2_1
ptr_to_b1sqr2_2:		.word b1sqr2_2
ptr_to_b1sqr2_3:		.word b1sqr2_3

ptr_to_b1sqr3_1:		.word b1sqr3_1
ptr_to_b1sqr3_2:		.word b1sqr3_2
ptr_to_b1sqr3_3:		.word b1sqr3_3

ptr_to_scoreline:		.word scoreline
;_______________________________________________________________________________________

lab7:
	PUSH {r4-r12,lr}

	;initializes the things
 	BL uart_init
	BL uart_interrupt_init
	BL gpio_interrupt_init
	BL timer_interrupt_init
	BL gpio_btn_and_LED_init

	
	LDR r0, ptr_to_alice_prompt ;Prompt to tell user to select an Alice button for how long they want the game
	BL output_string

	BL read_from_push_btns ; will loop till one of the buttons pressed, max time limit is set

	LDR r0, ptr_to_clearscreen	; clears the uart
	BL output_string

	LDR r0, ptr_to_leftside		; Goes to left side idk why but from lect
	BL output_string

	LDR r0, ptr_to_board			;prints the initial board
    BL output_string


	LDR r0, ptr_to_redtile
	BL output_string

	LDR r0, ptr_to_b1sqr1_1
	BL output_string

	LDR r0, ptr_to_yellowtile
	BL output_string

	LDR r0, ptr_to_b1sqr2_1
	BL output_string

	LDR r0, ptr_to_bluetile
	BL output_string

	LDR r0, ptr_to_b1sqr3_1
	BL output_string




    B end


lab7loop:


	B lab7loop

lab6GameEnd:

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

	LDR r0, ptr_to_board			;prints the board
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


	LDR r0, ptr_timeOutput
	BL output_string




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

	BNE mdone


wletter:
	LDR r0, ptr_position
	LDR r1, [r0]

	LDR r0, ptr_to_moves	;increases the moves by 1
	LDR r1, [r0]
	ADD r1, r1, #1
	STR r1, [r0]


	B mdone



aletter:

	LDR r0, ptr_position
	LDR r1, [r0]

	LDR r0, ptr_to_moves	;increases the moves by 1
	LDR r1, [r0]
	ADD r1, r1, #1
	STR r1, [r0]


	B mdone


sletter:

	LDR r0, ptr_position
	LDR r1, [r0]

	LDR r0, ptr_to_moves	;increases the moves by 1
	LDR r1, [r0]
	ADD r1, r1, #1
	STR r1, [r0]

	B mdone

dletter:

	LDR r0, ptr_position
	LDR r1, [r0]

	LDR r0, ptr_to_moves	;increases the moves by 1
	LDR r1, [r0]
	ADD r1, r1, #1
	STR r1, [r0]


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

	LDR r0, ptr_to_runningtime ;prints score
	BL output_string

	LDR r0, ptr_timeOutput
	LDR r2, ptr_to_time
	LDR r1, [r2]
	BL int2string

	LDR r0, ptr_timeOutput
	BL output_string



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

