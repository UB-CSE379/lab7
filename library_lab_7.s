	.data

bs_var: 	.word 0

	.global board
	.global current
	.global maxtime
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

	.global paused

	.global cubecolor
	.global cursorcolor

	.text
	.global uart_init
	.global output_character
	.global output_string
	.global read_string
	.global int2string
	.global UART0_Handler
	.global Switch_Handler
	.global board_handler
	.global color_handler
	.global space_handler

	.global gpio_interrupt_init
	.global uart_interrupt_init
	.global timer_interrupt_init
	.global simple_read_character
	.global read_character
	.global read_from_push_btns		; alice board inputs
	.global gpio_btn_and_LED_init
	.global cursor_color
	.global illuminate_RGB_LED
	.global side_checker




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

ptr_to_paused:			.word paused
ptr_to_maxtime:			.word maxtime

ptr_to_cubecolor		.word cubecolor
ptr_to_cursorcolor		.word cursorcolor

ptr_to_bs				.word bs_var


;_______________________________________________________________________________________

U0FR: 		.equ 0x18

;_______________________________________________________________________________________


simple_read_character:

	MOV r1, #0xC000
    MOVT r1, #0x4000
   	LDRB r0, [r1]

	MOV pc, lr

;_______________________________________________________________________________________

Switch_Handler:
; Your code for your Switch handler goes here.
	; Remember to preserver registers r4-r11 by pushing then popping
	; them to & from the stack at the beginning & end of the handler
	PUSH {r4 - r12,lr}

	; Clear Interrupt
	MOV r4, #0x5000
	MOVT r4, #0x4002

	; Get Timer 0 Base Address
	MOV r5, #0x0000
	MOVT r5, #0x4003 ; Timer 0 Base Address

	;GPIOICR Offset
	LDRB r6, [r4, #0x41C]
	ORR r6, r6, #0x10 ; 0001 0000
	STRB r6, [r4, #0x41C]

	; check if game is paused
	LDR r7, ptr_to_pauseflag
	LDRB r8, [r7]
	CMP r8, #1 ; if 1, need to resume game
	BEQ RESUME


	; If not paused, need to pause the game
	; Disable the timer
	LDR r9, [r5, #0x00C]
	BIC r9, r9, #0x01
	STR r9, [r5, #0x00C]

	; Add 1 to pauseFlag saying game is paused now
	ADD r8, r8, #1
	STRB r8, [r7]

	LDR r0, ptr_to_paused
	BL output_string


	B SWITCH_END

RESUME: ;If flag is 1, game is paused, need to resume, enable timer
	;Enable Timer
	LDR r9, [r5, #0x00C]
	ORR r9, r9, #0x01 ;Write 1 to bit 0 to enable timer
	STR r9, [r5, #0x00C]
	; Set pauseflag to 0 saying game is not paused
	SUB r8, r8, #1 ; r8 was 1, r8 - 1 = 0
	STRB r8, [r7]

	BL board_handler



SWITCH_END:


	POP {r4 - r12,lr}

	BX lr       	; Return

;_______________________________________________________________________________________


UART0_Handler:
	PUSH {r4-r12,lr}

	MOV r4, #0xC000				;clears the interupt
	MOVT r4, #0x4000
	LDR r5, [ r4, #0x044]
	ORR r5, r5, #16
	STR r5, [ r4, #0x044]

	BL simple_read_character
	MOV r5, r0

	CMP r0, #'w'
	BEQ w
	CMP r0, #'d'
	BEQ d
	CMP r0, #'a'
	BEQ a
	CMP r0, #'s'
	BEQ s
	CMP r0, #' '
	BEQ space
	B end2

w:
	LDR r4, ptr_to_current
	STR r0, [r4]
	B end2

d:
	LDR r4, ptr_to_current
	STR r0, [r4]
	B end2

a:
	LDR r4, ptr_to_current
	STR r0, [r4]
	B end2

s:
	LDR r4, ptr_to_current
	STR r0, [r4]
	B end2

space:

	LDR r4, ptr_to_current
	STR r0, [r4]

 	B end2

end2:

	POP {r4-r12,lr}
	BX lr       	; Return
;_______________________________________________________________________________________

uart_init:
	PUSH {r4-r12,lr} 	; Store any registers in the range of r4 through r12
							; Your code for your uart_init routine is placed here
	MOV r0, #0xE618
    MOVT r0, #0x400F
    MOV r1, #0x1
    STR r1, [r0]



    MOV r0, #0xE608
    MOVT r0, #0x400F
    MOV r1, #0x1
    STR r1, [r0]



    MOV r0, #0xC030
    MOVT r0, #0x4000
    MOV r1, #0x0
    STR r1, [r0]



     MOV r0, #0xC024
    MOVT r0, #0x4000
    MOV r1, #8
    STR r1, [r0]



    MOV r0, #0xC028
    MOVT r0, #0x4000
    MOV r1, #44
    STR r1, [r0]



    MOV r0, #0xCFC8
    MOVT r0, #0x4000
    MOV r1, #0x0
    STR r1, [r0]



    MOV r0, #0xC02C
    MOVT r0, #0x4000
    MOV r1, #0x60
    STR r1, [r0]



    MOV r0, #0xC030
    MOVT r0, #0x4000
    MOV r1, #0x301
    STR r1, [r0]



    MOV r0, #0x451C
    MOVT r0, #0x4000
    MOV r1, #0x03
    LDR r2 ,[r0]
    ORR r1 , r1, r2
    STR r1, [r0]


    MOV r0, #0x4420
    MOVT r0, #0x4000
    MOV r1, #0x03
    LDR r2 ,[r0]
    ORR r1 , r1, r2
    STR r1, [r0]


	MOV r0, #0x452C
    MOVT r0, #0x4000
    MOV r1, #0x11
    LDR r2 ,[r0]
    ORR r1 , r1, r2
    STR r1, [r0]

	POP {r4-r12,lr}  	; Restore registers from stack
	MOV pc, lr

;_______________________________________________________________________________________

output_character:
	PUSH {r4-r12,lr}	; Spill registers to stack

          ; Your code is placed here
	MOV r1, #0xC000			;Base address
	MOVT r1, #0x4000
LOOP2:
	LDRB r2, [r1, #U0FR]
	AND r2,r2, #0x20
	CMP r2, #0x20
	BEQ LOOP2
	STRB r0,[r1]

	POP {r4-r12,lr}  	; Restore registers from stack
	MOV pc, lr


;_______________________________________________________________________________________


read_character:
	PUSH {r4-r12,lr}	; Spill registers to stack

          ; Your code is placed here
  	MOV r1, #0xC000
	MOVT r1, #0x4000

LOOP1:

	LDRB r2, [r1, #U0FR]
	AND r2,r2, #0x10
	CMP r2, #0x10
	BEQ LOOP1

	LDRB r0,[r1]

	POP {r4-r12,lr}  	; Restore registers from stack
	MOV pc, lr


;_______________________________________________________________________________________

read_string:
	PUSH {r4-r12,lr}	; Spill registers to stack

          ; Your code is placed here
    MOV r4, r0

LOOP_RS:
    BL read_character
    CMP r0, #0xD
    BEQ ENTER
    STRB r0, [r4]
    BL output_character
    ADD r4, r4, #1
    B LOOP_RS

ENTER:
    MOV r0, #0x0
    STRB r0, [r4]

	POP {r4-r12,lr}  	; Restore registers from stack
	MOV pc, lr

;_______________________________________________________________________________________


output_string:
	PUSH {r4-r12,lr}	; Spill registers to stack

          ; Your code is placed here
    MOV r4, r0

LOOP_OS:
	LDRB r6, [r4]
	ADD r4, r4, #1

	CMP r6, #0x0
	BEQ EXIT
	MOV r0,r6
	BL output_character
	B LOOP_OS



EXIT:

	POP {r4-r12,lr}  	; Restore registers from stack
	MOV pc, lr


;_______________________________________________________________________________________

int2string:
	PUSH {r4-r12,lr} 	; Store any registers in the range of r4 through r12
							; that are used in your routine.  Include lr if this
							; routine calls another routine.

						; Your code for your int2string routine is placed here
						;handle negatives
    MOV r4, r0
    MOV r5, r1        ; Move int into r5
    MOV r10, #0       ; Initialize accum

    CMP r5, #0
    BGE pos      ; If positive
    MOV r8, #'-'
    STRB r8, [r4], #1
    RSB r5, r5, #0    ; make positive

pos: ; Check if the num is zero
    CMP r5, #0
    BEQ zero_fin ; If zero, go to zero_finalize

conversion:
    ; Extract digits from the number
    MOV r7, #10
    UDIV r8, r5, r7
    MUL r11, r8, r7
    SUB r7, r5, r11
    ADD r7, r7, #'0'
    PUSH {r7}
    ADD r10, r10, #1  ; Increment
    MOV r5, r8
    CMP r5, #0
    BNE conversion ; Loop

r_loop:
    CMP r10, #0
    BEQ f
    POP {r7}
    STRB r7, [r4], #1 ; Store the digit
    SUBS r10, r10, #1 ; Decrement
    B r_loop    ; Repeat until all digits are stored



zero_fin:
    MOV r8, #'0'
    STRB r8, [r4], #1 ; Store and increment
    B f       ; Go to f to null-term and end

f:

    MOV r8, #0
    STRB r8, [r4]

    POP {r4-r12,lr}   ; Restore registers
    mov pc, lr


;_______________________________________________________________________________________

gpio_interrupt_init:

	; Your code to initialize the SW1 interrupt goes here
	; Don't forget to follow the procedure you followed in Lab #4
	; to initialize SW1.

	;Enable Clock Address for Port F
    MOV r1, #0xE000
    MOVT r1, #0x400F

    ;NEED TO ENABLE CLOCK FOR ONLY PORT F
    LDRB r4, [r1, #0x608]
    ORR r4, r4, #0x20	; find specfic port 0010 0000
    STRB r4, [r1, #0x608] ;enable clock for Port F


    ;Initlize r3 with Port F address
    ; Set Pin 4 Direction to Input
    MOV r3, #0x5000
    MOVT r3, #0x4002
    LDRB r5, [r3, #0x400] ;offset 0x400 to port F
    AND r5, r5, #0xEF ; configure pin 4 as input
    STRB r5, [r3, #0x400] ; write 0 to configure pin 4 as input

	;Enable pull-up resistor
	LDRB r6, [r3, #0x510]
	ORR r6, r6, #0x10 ;
	STRB r6, [r3, #0x510] ;Write 1 to enable pull-up resistor

    ;Initilize pin as digital
    LDRB r7, [r3, #0x51C]
    ORR r7, r7, #0x10  ; enable pin 4 , by writing 1
	STRB r7, [r3, #0x51C] ;write 1 to make pin digital

	;Enable Edge Sensitive GPIOIS
	LDR r8, [r3, #0x404]
	BIC r8, r8, #0x10	;Write 0 to pin 4 to enable edge sensitive
	STR r8, [r3, #0x404]

	; Allow GPIOEV to determine edge, write 0 to pin on port
	LDR r9, [r3, #0x408]
	BIC r9, r9, #0x10
	STR r9, [r3, #0x408]

	; Write 0 to pin when button press ; Select this
	LDR r6, [r3, #0x40C]
	BIC r6, r6, #0x10
	STR r6, [r3, #0x40C]

	;Enable the Interrupt, write 1 to Bit 4
	LDR r7, [r3, #0x410]
	ORR r7, r7, #0x10 ; 0001 0000
	STR r7, [r3, #0x410]

	;ENO, set bit 30 bit
	MOV r8, #0xE000
	MOVT r8, #0xE000 ;ENO Base Address

	MOV r12, #1

	LDR r9, [r8, #0x100] ; ENO Offset
	LSL r12, r12, #30   ; 0100 0000 0000 0000 0000 0000 0000 0000
	ORR r9, r9, r12
	STR r9, [r8, #0x100]

	MOV pc, lr


;_______________________________________________________________________________________

uart_interrupt_init:

	PUSH {lr}
	; Set the Receive Interrupt Mask

	MOV r0, #0xC000
	MOVT r0, #0x4000 ; UART Base Address

	LDR r4, [r0, #0x038] ; UARTIM Offset

	ORR r4, r4, #0x10 ; 0001 0000
	STR r4, [r0, #0x038]

	;Configure Processor to Allow Interrupts in UART
	MOV r1, #0xE000
	MOVT r1, #0xE000 ; ENO Base Address

	LDR r5, [r1, #0x100]
	ORR r5, r5, #0x20 ; 0010 0000
	STR r5, [r1, #0x100]


	POP {lr}
	MOV pc, lr
;_______________________________________________________________________________________
;Initalize timer interrupt
timer_interrupt_init:
	PUSH {lr}
	; Connect Clock to Timer
	MOV r1, #0xE000
	MOVT r1, #0x400F

	;RCGCTIMER, using Timer 0
	LDR r5, [r1, #0x604]
	;Write a 1 to bit 0
	ORR r5, r5, #0x01
	STR r5, [r1, #0x604]

	;Disable Timer to Configure (GPTMCTL), write 0 to TAEN
	MOV r1, #0x0000
	MOVT r1, #0x4003 ; Timer 0 Base Address

	LDR r5, [r1, #0x00C]
	BIC r5, r5, #0x01
	STR r5, [r1, #0x00C]

	;Put Timer in 32-bit Mode
	LDR r5, [r1, #0x000]
	BIC r5, r5, #0x000 	; clear bits 0 1 and 2
	STR r5, [r1, #0x000]

	;Put Timer in Periodic Mode
	LDR r5, [r1, #0x004]
	ORR r5, r5, #0x02 	; Write 2 to TAMR
	STR r5, [r1, #0x004]

	;Setup Interval Period
	LDR r5, [r1, #0x028] ;16MHz per second, want to move 2 spaces per second
							; so interval needs to be half 8 X 10^6, 1 space per half sec
	MOV r6, #0x1200   ; 8 million into r6 to store into reg
	MOVT r6, #0x007A
	STR r6, [r1, #0x028]

	;Enable Timer to Interrupt Processor
	LDR r5, [r1, #0x018]
	ORR r5, r5, #0x01 ; Write 1 to TATOIM, bit 0
	STR r5, [r1, #0x018]

	;Config Timer to Allow Timer to Interrupt /
	; ENO Base Address
	MOV r7, #0xE000
	MOVT r7, #0xE000

	LDR r5, [r7, #0x100]
	; Set Bit 19 (TIMER0A) to 1
	ORR r5, r5, #0x00080000
	STR r5, [r7, #0x100]

	;Enable Timer
	LDR r5, [r1, #0x00C]
	ORR r5, r5, #0x01 ; Write 1 to bit 0 to enable timer
	STR r5, [r1, #0x00C]

	POP {lr}
	MOV pc, lr

;_______________________________________________________________________________________

gpio_btn_and_LED_init:
	PUSH {r4-r12,lr}	; Spill registers to stack

	;Enable Clocks for Ports B, D, and F
	MOV r4, #0xE000
	MOVT r4, #0x400F
	LDRB r5, [r4, #0x608]		  ;00  1  0  1  0  1  0
	ORR r5, r5, #0x2A ;0010 1010  Port F, E, D, C, B, A
	STRB r5, [r4, #0x608]

	;Port F Pin 4 is input, write 0
		; - need a pull-up resistor for SW1
	; Port D Pins 0-3 are input for Btns, write 0
	; Port B Pins 0-3 are output for LEDs, write 1
	; Port B Base Address-> 0x40005000
	MOV r6, #0x5000
	MOVT r6, #0x4000
	;Port D Base Address -> 0x40007000
	MOV r7, #0x7000
	MOVT r7, #0x4000

	;Port F Base Address -> 0x40025000
	MOV r8, #0x5000
	MOVT r8, #0x4002

	;Set Pin Directions
	;Port B Pin Direction is Output, write 1 to pins 0 - 3
	LDRB r9, [r6, #0x400]
    ORR r9, r9, #0x0F ;configure pins 0 - 3 as output
    STRB r9, [r6, #0x400] ; write 1 to mem

	;Port D Pin Direction is Input, Write 0 to pins 0-3
	LDRB r9, [r7, #0x400]
	AND r9, r9, #0x00
	STRB r9, [r7, #0x400]

	;Port F Pin Direction is Input, Write 0 to pin 4
	; Port F Pin Direction Output for pins 0 - 3, write 1
	LDRB r9, [r8, #0x400]
	ORR r9, r9, #0x0E ; 0000 1110
	STRB r9, [r8, #0x400]

    ;SET PIN AS DIGITAL
    ; Set Pins 0-3 in Port B Digital, write 1
    LDRB r10, [r6, #0x51C]
    ORR r10, r10, #0x0F
    STRB r10, [r6, #0x51C]

    ; Set Pins 0-3 in Port D Digital, write 1
    LDRB r11, [r7, #0x51C]
    ORR r11, r11, #0x0F
    STRB r11, [r7, #0x51C]

    ; Initilize Pull-up resistor for Port F, write 1
    LDRB r12, [r8, #0x510]
    ORR r12, r12, #0x10
    STRB r12, [r8, #0x510]

    ; Set Pin pins 1-4 in Port F Digital, write 1
    LDRB r12, [r8, #0x51C]
    ORR r12, r12, #0x1E
    STRB r12, [r8, #0x51C]

          ; Your code is placed here

	POP {r4-r12,lr}  	; Restore registers from stack
	MOV pc, lr
;_________________________________________________________________________________________________________________

read_from_push_btns:
	PUSH {r4-r12,lr}	; Spill registers to stack

    ; Your code is placed here
    ;Initilize r3 with PORT D Base Address
    MOV r3, #0x7000
    MOVT r3, #0x4000

	LDR r4, ptr_to_maxtime

LOOP20:
 	;GPIODATA
 	LDRB r9, [r3, #0x3FC]
 	AND r9, r9, #0x0F ; if r9 == 0000 0001 SW5 is pressed
 					  ; if r9 == 0000 0010 SW4 is pressed
 					  ; if r9 == 0000 0100 SW3 is pressed
 					  ; if r9 == 0000 1000 SW2 is pressed

 	;Find which button was pressed
 	CMP r9, #0x01 ; SW5 is pressed
 	BEQ PRESS_5

 	CMP r9, #0x02; SW4 is pressed
 	BEQ PRESS_4

 	CMP r9, #0x04; SW3 is pressed
 	BEQ PRESS_3

 	CMP r9, #0x08; SW2 is pressed
 	BEQ PRESS_2

 	B LOOP20

PRESS_5: ;100 seconds for sw5
	MOV r6, #100
	STR r6, [r4]
	B STOP_BTNS

PRESS_4: 	;200 seconds limit for sw4
	MOV r6, #200
	STR r6, [r4]
	B STOP_BTNS

PRESS_3:	;300 seconds limit for sw3
	MOV r6, #300
	STR r6, [r4]
	B STOP_BTNS
PRESS_2:	; unlimited limit for sw2, FIX LATER
	MOV r6, #-1
	STR r6, [r4]
	B STOP_BTNS

STOP_BTNS:
	POP {r4-r12,lr}  	; Restore registers from stack
	MOV pc, lr

;_______________________________________________________________________________________


board_handler:
	PUSH {r4-r12,lr}

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

	BNE end_l

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

	LDR r0, ptr_to_positionflag
	MOV r1, #0
	STR r1, [r0]

	LDR r0, ptr_to_spos
	LDR r1, [r0]
	CMP r1, #1
	BEQ cur_1
	CMP r1, #2
	BEQ cur_2
	CMP r1, #3
	BEQ cur_3
	CMP r1, #4
	BEQ cur_4
	CMP r1, #5
	BEQ cur_5
	CMP r1, #6
	BEQ cur_6
	CMP r1, #7
	BEQ cur_7
	CMP r1, #8
	BEQ cur_8
	CMP r1, #9
	BEQ cur_9

cur_1:
	LDR r0, ptr_to_f1
	BL output_string
	B final_end
cur_2:
	LDR r0, ptr_to_f2
	BL output_string
	B final_end
cur_3:
	LDR r0, ptr_to_f3
	BL output_string
	B final_end
cur_4:
	LDR r0, ptr_to_f4
	BL output_string
	B final_end
cur_5:
	LDR r0, ptr_to_f5
	BL output_string
	B final_end
cur_6:
	LDR r0, ptr_to_f6
	BL output_string
	B final_end
cur_7:
	LDR r0, ptr_to_f7
	BL output_string
	B final_end
cur_8:
	LDR r0, ptr_to_f8
	BL output_string
	B final_end
cur_9:
	LDR r0, ptr_to_f9
	BL output_string
	B final_end

final_end:
	BL illuminate_RGB_LED


	POP {r4-r12,lr}   ; Restore registers
    mov pc, lr

color_handler
	PUSH {r4-r12,lr}

	LDR r0, ptr_to_sideflag
	LDR r1, [r0]
	CMP r1, #0
	BEQ c_face1
	CMP r1, #1
	BEQ c_face2
	CMP r1, #2
	BEQ c_face3
	CMP r1, #3
	BEQ c_face4
	CMP r1, #4
	BEQ c_face5
	CMP r1, #5
	BEQ c_face6

c_face1:
	LDR r6, ptr_to_s1

	b c_finder

c_face2:
	LDR r6, ptr_to_s2

	b c_finder

c_face3:
	LDR r6, ptr_to_s3

	b c_finder

c_face4:
	LDR r6, ptr_to_s4

	b c_finder

c_face5:
	LDR r6, ptr_to_s5

	b c_finder

c_face6:
	LDR r6, ptr_to_s6

	b c_finder


c_finder:
	LDR r0, ptr_to_spos
	LDR r1, [r0]
c_loop
	CMP r1, #1
	BEQ c_end


	ADD r6, r6, #1
	SUB r1, r1, #1
	B c_loop


c_end:
	LDRB r0, [r6]
	LDR r1, ptr_to_cubecolor
	STRB r0, [r1]


	POP {r4-r12,lr}   ; Restore registers
    mov pc, lr

;----------------------------------------------------------------------------------------

space_handler:
	PUSH {r4-r12,lr}

	LDR r0, ptr_to_sideflag
	LDR r1, [r0]
	CMP r1, #0
	BEQ s_face1
	CMP r1, #1
	BEQ s_face2
	CMP r1, #2
	BEQ s_face3
	CMP r1, #3
	BEQ s_face4
	CMP r1, #4
	BEQ s_face5
	CMP r1, #5
	BEQ s_face6

s_face1:
	LDR r6, ptr_to_s1

	b end_s

s_face2:
	LDR r6, ptr_to_s2

	b end_s

s_face3:
	LDR r6, ptr_to_s3

	b end_s

s_face4:
	LDR r6, ptr_to_s4

	b end_s

s_face5:
	LDR r6, ptr_to_s5

	b end_s

s_face6:
	LDR r6, ptr_to_s6

	b end_s

end_s:
	LDR r0, ptr_to_spos
	LDR r1, [r0]
s_loop
	CMP r1, #1
	BEQ s_end


	ADD r6, r6, #1
	SUB r1, r1, #1
	B s_loop

s_end:
	LDR r1, ptr_to_cubecolor
	LDR r0, [r1]
	LDR r2, ptr_to_cursorcolor
	LDR r3, [r2]

	STRB r3, [r6]
	STR r0, [r2]

	POP {r4-r12,lr}   ; Restore registers
    mov pc, lr

cursor_color:
	PUSH {r4-r12,lr}
	LDR r0, ptr_to_cursorcolor
	LDR r1, [r0]
	CMP r1, #'1'
	BEQ r_cursor
	CMP r1, #'3'
	BEQ b_cursor
	CMP r1, #'5'
	BEQ y_cursor
	CMP r1, #'6'
	BEQ p_cursor
	CMP r1, #'8'
	BEQ w_cursor
	CMP r1, #'9'
	BEQ g_cursor


r_cursor:
	LDR r0, ptr_to_f1
	MOV r2, #'1'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f2
	MOV r2, #'1'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f3
	MOV r2, #'1'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f4
	MOV r2, #'1'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f5
	MOV r2, #'1'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f6
	MOV r2, #'1'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f7
	MOV r2, #'1'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f8
	MOV r2, #'1'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f9
	MOV r2, #'1'
	STRB r2, [r0, #3]

	BL board_handler

	b cursor_end
b_cursor:

	LDR r0, ptr_to_f1
	MOV r2, #'4'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f2
	MOV r2, #'4'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f3
	MOV r2, #'4'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f4
	MOV r2, #'4'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f5
	MOV r2, #'4'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f6
	MOV r2, #'4'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f7
	MOV r2, #'4'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f8
	MOV r2, #'4'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f9
	MOV r2, #'4'
	STRB r2, [r0, #3]

	BL board_handler

	b cursor_end

y_cursor:

	LDR r0, ptr_to_f1
	MOV r2, #'3'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f2
	MOV r2, #'3'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f3
	MOV r2, #'3'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f4
	MOV r2, #'3'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f5
	MOV r2, #'3'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f6
	MOV r2, #'3'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f7
	MOV r2, #'3'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f8
	MOV r2, #'3'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f9
	MOV r2, #'3'
	STRB r2, [r0, #3]

	BL board_handler

	b cursor_end
p_cursor:
	LDR r0, ptr_to_f1
	MOV r2, #'5'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f2
	MOV r2, #'5'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f3
	MOV r2, #'5'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f4
	MOV r2, #'5'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f5
	MOV r2, #'5'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f6
	MOV r2, #'5'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f7
	MOV r2, #'5'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f8
	MOV r2, #'5'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f9
	MOV r2, #'5'
	STRB r2, [r0, #3]

	BL board_handler

	b cursor_end
w_cursor:
	LDR r0, ptr_to_f1
	MOV r2, #'7'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f2
	MOV r2, #'7'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f3
	MOV r2, #'7'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f4
	MOV r2, #'7'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f5
	MOV r2, #'7'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f6
	MOV r2, #'7'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f7
	MOV r2, #'7'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f8
	MOV r2, #'7'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f9
	MOV r2, #'7'
	STRB r2, [r0, #3]

	BL board_handler

	b cursor_end
g_cursor:
	LDR r0, ptr_to_f1
	MOV r2, #'2'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f2
	MOV r2, #'2'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f3
	MOV r2, #'2'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f4
	MOV r2, #'2'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f5
	MOV r2, #'2'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f6
	MOV r2, #'2'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f7
	MOV r2, #'2'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f8
	MOV r2, #'2'
	STRB r2, [r0, #3]

	LDR r0, ptr_to_f9
	MOV r2, #'2'
	STRB r2, [r0, #3]

	BL board_handler
	b cursor_end

cursor_end:


	POP {r4-r12,lr}   ; Restore registers
    mov pc, lr

	.end
