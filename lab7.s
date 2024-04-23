	.data

	.global board
	.global current
	.global pauseflag

cube1: .string "272771682",0
cube2: .string "526643143",0
cube3: .string "477135871",0
cube4: .string "329353855",0
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
sideflag:		.word 0
positionflag:	.word 0


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


	; from library file
	.global output_character		; This is from your Lab #4 Library
	.global read_string				; This is from your Lab #4 Library
	.global output_string			; This is from your Lab #4 Library
	.global uart_init				; This is from your Lab #4 Library
	.global int2string				; This is from your Lab #4 Library

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


ptr_to_redtile:			.word redtile
ptr_to_bluetile:		.word bluetile
ptr_to_greentile:		.word greentile
ptr_to_whitetile:		.word whitetile
ptr_to_purpletile:		.word purpletile
ptr_to_yellowtile:		.word yellowtile
ptr_to_resettile:		.word resettile
ptr_to_clearline:		.word clearline


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
;_______________________________________________________________________________________

lab7:
	PUSH {r4-r12,lr}

	;initializes the things
 	BL uart_init
	BL uart_interrupt_init
	BL gpio_interrupt_init
	BL timer_interrupt_init


	LDR r0, ptr_to_clearscreen	; clears the uart
	BL output_string

	LDR r0, ptr_to_leftside		; Goes to left side idk why but from lect
	BL output_string

	LDR r0, ptr_to_sideflag
	LDR r1, [r0]

	CMP r1,#0
	BEQ side1

	CMP r1,#1
	BEQ side2

	CMP r1,#2
	BEQ side3

	CMP r1,#3
	BEQ side4

	CMP r1,#4
	BEQ side5

	CMP r1,#5
	BEQ side6

	BNE lab7loop

side1:

	LDR r0, ptr_to_board			;prints the initial board
    BL output_string
    LDR r6, ptr_to_s1

    B byte_loop1

side2:

	LDR r0, ptr_to_board			;prints the initial board
    BL output_string
    LDR r6, ptr_to_s2

    B byte_loop1

side3:

	LDR r0, ptr_to_board			;prints the initial board
    BL output_string
    LDR r6, ptr_to_s3

    B byte_loop1

side4:

	LDR r0, ptr_to_board			;prints the initial board
    BL output_string
    LDR r6, ptr_to_s4

    B byte_loop1

side5:

	LDR r0, ptr_to_board			;prints the initial board
    BL output_string
    LDR r6, ptr_to_s5

    B byte_loop1

side6:

	LDR r0, ptr_to_board			;prints the initial board
    BL output_string
    LDR r6, ptr_to_s6

    B byte_loop1


byte_loop1:
	MOV r1, r6
	LDRB r0, [r1]
	CMP r0, #0
	BEQ end_l
	B process_byte
post_proc:
	LDR r4, ptr_to_positionflag
	LDR r5, [r4]
	ADD r5, r5, #1
	STR r5,[r4]
	CMP r5, #9
	BEQ end_l
	ADD r6, r6, #1
	B byte_loop1


process_byte:
	CMP r0, #'1'
	BEQ red
	CMP r0, #'2'
	BEQ red
	CMP r0, #'3'
	BEQ blue
	CMP r0, #'4'
	BEQ blue
	CMP r0, #'5'
	BEQ yellow
	CMP r0, #'6'
	BEQ purple
	CMP r0, #'7'
	BEQ purple
	CMP r0, #'8'
	BEQ white
	CMP r0, #'9'
	BEQ green

	BNE r_end

red:
	LDR r4, ptr_to_positionflag
	LDR r0, [r4]
	CMP r0, #0
	BEQ rmem1
	CMP r0, #1
	BEQ rmem2
	CMP r0, #2
	BEQ rmem3
	CMP r0, #3
	BEQ rmem4
	CMP r0, #4
	BEQ rmem5
	CMP r0, #5
	BEQ rmem6
	CMP r0, #6
	BEQ rmem7
	CMP r0, #7
	BEQ rmem8
	CMP r0, #8
	BEQ rmem9
	bne r_end

rmem1:
	LDR r0, ptr_to_redtile
	BL output_string

	LDR r0, ptr_to_b1sqr1_1
	BL output_string
	b r_end

rmem2:
	LDR r0, ptr_to_redtile
	BL output_string

	LDR r0, ptr_to_b1sqr2_1
	BL output_string

	b r_end
rmem3:
	LDR r0, ptr_to_redtile
	BL output_string

	LDR r0, ptr_to_b1sqr3_1
	BL output_string

	b r_end

rmem4:
	LDR r0, ptr_to_redtile
	BL output_string

	LDR r0, ptr_to_b1sqr4_1
	BL output_string

	b r_end

rmem5:
	LDR r0, ptr_to_redtile
	BL output_string

	LDR r0, ptr_to_b1sqr5_1
	BL output_string

	b r_end

rmem6:
	LDR r0, ptr_to_redtile
	BL output_string

	LDR r0, ptr_to_b1sqr6_1
	BL output_string

	b r_end

rmem7:
	LDR r0, ptr_to_redtile
	BL output_string

	LDR r0, ptr_to_b1sqr7_1
	BL output_string

	b r_end

rmem8:
	LDR r0, ptr_to_redtile
	BL output_string

	LDR r0, ptr_to_b1sqr8_1
	BL output_string

	b r_end

rmem9:
	LDR r0, ptr_to_redtile
	BL output_string

	LDR r0, ptr_to_b1sqr9_1
	BL output_string

	b r_end


blue:
	LDR r4, ptr_to_positionflag
	LDR r0, [r4]
	CMP r0, #0
	BEQ bmem1
	CMP r0, #1
	BEQ bmem2
	CMP r0, #2
	BEQ bmem3
	CMP r0, #3
	BEQ bmem4
	CMP r0, #4
	BEQ bmem5
	CMP r0, #5
	BEQ bmem6
	CMP r0, #6
	BEQ bmem7
	CMP r0, #7
	BEQ bmem8
	CMP r0, #8
	BEQ bmem9
	bne r_end

bmem1:
	LDR r0, ptr_to_bluetile
	BL output_string

	LDR r0, ptr_to_b1sqr1_1
	BL output_string
	b r_end

bmem2:
	LDR r0, ptr_to_bluetile
	BL output_string

	LDR r0, ptr_to_b1sqr2_1
	BL output_string

	b r_end
bmem3:
	LDR r0, ptr_to_bluetile
	BL output_string

	LDR r0, ptr_to_b1sqr3_1
	BL output_string

	b r_end

bmem4:
	LDR r0, ptr_to_bluetile
	BL output_string

	LDR r0, ptr_to_b1sqr4_1
	BL output_string

	b r_end

bmem5:
	LDR r0, ptr_to_bluetile
	BL output_string

	LDR r0, ptr_to_b1sqr5_1
	BL output_string

	b r_end

bmem6:
	LDR r0, ptr_to_bluetile
	BL output_string

	LDR r0, ptr_to_b1sqr6_1
	BL output_string

	b r_end

bmem7:
	LDR r0, ptr_to_bluetile
	BL output_string

	LDR r0, ptr_to_b1sqr7_1
	BL output_string

	b r_end

bmem8:
	LDR r0, ptr_to_bluetile
	BL output_string

	LDR r0, ptr_to_b1sqr8_1
	BL output_string

	b r_end

bmem9:
	LDR r0, ptr_to_bluetile
	BL output_string

	LDR r0, ptr_to_b1sqr9_1
	BL output_string

	b r_end

yellow:
	LDR r4, ptr_to_positionflag
	LDR r0, [r4]
	CMP r0, #0
	BEQ ymem1
	CMP r0, #1
	BEQ ymem2
	CMP r0, #2
	BEQ ymem3
	CMP r0, #3
	BEQ ymem4
	CMP r0, #4
	BEQ ymem5
	CMP r0, #5
	BEQ ymem6
	CMP r0, #6
	BEQ ymem7
	CMP r0, #7
	BEQ ymem8
	CMP r0, #8
	BEQ ymem9
	bne r_end

ymem1:
	LDR r0, ptr_to_yellowtile
	BL output_string

	LDR r0, ptr_to_b1sqr1_1
	BL output_string
	b r_end

ymem2:
	LDR r0, ptr_to_yellowtile
	BL output_string

	LDR r0, ptr_to_b1sqr2_1
	BL output_string

	b r_end
ymem3:
	LDR r0, ptr_to_yellowtile
	BL output_string

	LDR r0, ptr_to_b1sqr3_1
	BL output_string

	b r_end

ymem4:
	LDR r0, ptr_to_yellowtile
	BL output_string

	LDR r0, ptr_to_b1sqr4_1
	BL output_string

	b r_end

ymem5:
	LDR r0, ptr_to_yellowtile
	BL output_string

	LDR r0, ptr_to_b1sqr5_1
	BL output_string

	b r_end

ymem6:
	LDR r0, ptr_to_yellowtile
	BL output_string

	LDR r0, ptr_to_b1sqr6_1
	BL output_string

	b r_end

ymem7:
	LDR r0, ptr_to_yellowtile
	BL output_string

	LDR r0, ptr_to_b1sqr7_1
	BL output_string

	b r_end

ymem8:
	LDR r0, ptr_to_yellowtile
	BL output_string

	LDR r0, ptr_to_b1sqr8_1
	BL output_string

	b r_end

ymem9:
	LDR r0, ptr_to_yellowtile
	BL output_string

	LDR r0, ptr_to_b1sqr9_1
	BL output_string

	b r_end

purple:
	LDR r4, ptr_to_positionflag
	LDR r0, [r4]
	CMP r0, #0
	BEQ pmem1
	CMP r0, #1
	BEQ pmem2
	CMP r0, #2
	BEQ pmem3
	CMP r0, #3
	BEQ pmem4
	CMP r0, #4
	BEQ pmem5
	CMP r0, #5
	BEQ pmem6
	CMP r0, #6
	BEQ pmem7
	CMP r0, #7
	BEQ pmem8
	CMP r0, #8
	BEQ pmem9
	bne r_end

pmem1:
	LDR r0, ptr_to_purpletile
	BL output_string

	LDR r0, ptr_to_b1sqr1_1
	BL output_string
	b r_end

pmem2:
	LDR r0, ptr_to_purpletile
	BL output_string

	LDR r0, ptr_to_b1sqr2_1
	BL output_string

	b r_end
pmem3:
	LDR r0, ptr_to_purpletile
	BL output_string

	LDR r0, ptr_to_b1sqr3_1
	BL output_string

	b r_end

pmem4:
	LDR r0, ptr_to_purpletile
	BL output_string

	LDR r0, ptr_to_b1sqr4_1
	BL output_string

	b r_end

pmem5:
	LDR r0, ptr_to_purpletile
	BL output_string

	LDR r0, ptr_to_b1sqr5_1
	BL output_string

	b r_end

pmem6:
	LDR r0, ptr_to_purpletile
	BL output_string

	LDR r0, ptr_to_b1sqr6_1
	BL output_string

	b r_end

pmem7:
	LDR r0, ptr_to_purpletile
	BL output_string

	LDR r0, ptr_to_b1sqr7_1
	BL output_string

	b r_end

pmem8:
	LDR r0, ptr_to_purpletile
	BL output_string

	LDR r0, ptr_to_b1sqr8_1
	BL output_string

	b r_end

pmem9:
	LDR r0, ptr_to_purpletile
	BL output_string

	LDR r0, ptr_to_b1sqr9_1
	BL output_string

	b r_end

white:
	LDR r4, ptr_to_positionflag
	LDR r0, [r4]
	CMP r0, #0
	BEQ wmem1
	CMP r0, #1
	BEQ wmem2
	CMP r0, #2
	BEQ wmem3
	CMP r0, #3
	BEQ wmem4
	CMP r0, #4
	BEQ wmem5
	CMP r0, #5
	BEQ wmem6
	CMP r0, #6
	BEQ wmem7
	CMP r0, #7
	BEQ wmem8
	CMP r0, #8
	BEQ wmem9
	bne r_end

wmem1:
	LDR r0, ptr_to_whitetile
	BL output_string

	LDR r0, ptr_to_b1sqr1_1
	BL output_string
	b r_end

wmem2:
	LDR r0, ptr_to_whitetile
	BL output_string

	LDR r0, ptr_to_b1sqr2_1
	BL output_string

	b r_end
wmem3:
	LDR r0, ptr_to_whitetile
	BL output_string

	LDR r0, ptr_to_b1sqr3_1
	BL output_string

	b r_end

wmem4:
	LDR r0, ptr_to_whitetile
	BL output_string

	LDR r0, ptr_to_b1sqr4_1
	BL output_string

	b r_end

wmem5:
	LDR r0, ptr_to_whitetile
	BL output_string

	LDR r0, ptr_to_b1sqr5_1
	BL output_string

	b r_end

wmem6:
	LDR r0, ptr_to_whitetile
	BL output_string

	LDR r0, ptr_to_b1sqr6_1
	BL output_string

	b r_end

wmem7:
	LDR r0, ptr_to_whitetile
	BL output_string

	LDR r0, ptr_to_b1sqr7_1
	BL output_string

	b r_end

wmem8:
	LDR r0, ptr_to_whitetile
	BL output_string

	LDR r0, ptr_to_b1sqr8_1
	BL output_string

	b r_end

wmem9:
	LDR r0, ptr_to_whitetile
	BL output_string

	LDR r0, ptr_to_b1sqr9_1
	BL output_string

	b r_end

green:
	LDR r4, ptr_to_positionflag
	LDR r0, [r4]
	CMP r0, #0
	BEQ gmem1
	CMP r0, #1
	BEQ gmem2
	CMP r0, #2
	BEQ gmem3
	CMP r0, #3
	BEQ gmem4
	CMP r0, #4
	BEQ gmem5
	CMP r0, #5
	BEQ gmem6
	CMP r0, #6
	BEQ gmem7
	CMP r0, #7
	BEQ gmem8
	CMP r0, #8
	BEQ gmem9
	bne r_end

gmem1:
	LDR r0, ptr_to_greentile
	BL output_string

	LDR r0, ptr_to_b1sqr1_1
	BL output_string
	b r_end

gmem2:
	LDR r0, ptr_to_greentile
	BL output_string

	LDR r0, ptr_to_b1sqr2_1
	BL output_string

	b r_end
gmem3:
	LDR r0, ptr_to_greentile
	BL output_string

	LDR r0, ptr_to_b1sqr3_1
	BL output_string

	b r_end

gmem4:
	LDR r0, ptr_to_greentile
	BL output_string

	LDR r0, ptr_to_b1sqr4_1
	BL output_string

	b r_end

gmem5:
	LDR r0, ptr_to_greentile
	BL output_string

	LDR r0, ptr_to_b1sqr5_1
	BL output_string

	b r_end

gmem6:
	LDR r0, ptr_to_greentile
	BL output_string

	LDR r0, ptr_to_b1sqr6_1
	BL output_string

	b r_end

gmem7:
	LDR r0, ptr_to_greentile
	BL output_string

	LDR r0, ptr_to_b1sqr7_1
	BL output_string

	b r_end

gmem8:
	LDR r0, ptr_to_greentile
	BL output_string

	LDR r0, ptr_to_b1sqr8_1
	BL output_string

	b r_end

gmem9:
	LDR r0, ptr_to_greentile
	BL output_string

	LDR r0, ptr_to_b1sqr9_1
	BL output_string

	b r_end

r_end:

	b post_proc

end_l:







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

