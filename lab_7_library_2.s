	.data
	.global cursorcolor

	.global sideflag
	.global positionflag
	.global startingpos
	.global current
	.global sidesdone

	.global cube1
	.global cube2
	.global cube3
	.global cube4
	.global cube5
	.global cube6

sidesdone: 	.word 0




	.text

	.global illuminate_RGB_LED
	.global side_checker
	.global validate_move

ptr_to_cursorcolor: .word cursorcolor

ptr_to_s1:				.word cube1
ptr_to_s2:				.word cube2
ptr_to_s3:				.word cube3
ptr_to_s4:				.word cube4
ptr_to_s5:				.word cube5
ptr_to_s6:				.word cube6

ptr_to_sidesdone:		.word sidesdone

ptr_to_sideflag:		.word sideflag
ptr_to_positionflag:	.word positionflag
ptr_to_spos:			.word startingpos
ptr_to_current:			.word current


illuminate_RGB_LED:

	PUSH {r4-r12,lr}	; Spill registers to stack

          ; Your code is placed here
    ;Initialize Clock Address
    ; Color is passed in from r0
    ;MOV r0, #1 	;RED
    ;MOV r0, #2 ;BLUE
    ;MOV r0, #3 ;GREEN
    ;MOV r0, #4 ;PURPLE -> RED AND BLUE
    ;MOV r0, #5 ;YELLOW -> RED AND GREEN
    ;MOV r0, #6 ;WHITE -> RED, BLUE, AND GREEN



    MOV r3, #0x5000
    MOVT r3, #0x4002

    LDRB r9, [r3, #0x3FC] ; GPIODATA

    MOV r9, #0x0     ; need to turn pin 1 on that is 0000 0010
    STRB r9, [r3, #0x3FC]		; Turn on 0000 0010

    LDR r1, ptr_to_cursorcolor
    LDR r0, [r1]

	CMP r0, #'1'
	BEQ RED

 	CMP r0, #'3'
  	BEQ BLUE

   	CMP r0, #'9'
	BEQ GREEN

	CMP r0, #'6'
	BEQ PURPLE

	CMP r0, #'5'
	BEQ YELLOW

	CMP r0, #'8'
	BEQ WHITE


    ; RED , turn on pin 1, turn off pin 2 and 3
RED:
    ORR r9, r9, #0x02     ; need to turn pin 1 on that is 0000 0010
    STRB r9, [r3, #0x3FC]		; Turn on 0000 0010
	B COLOR_STOP

    ; BLUE, turn on pin 2, turn off pin 1 and 3 so 0000 0100
BLUE:
	ORR r9, r9, #0x04
	STRB r9, [r3, #0x3FC]
	B COLOR_STOP

    ; GREEN, turn on pin 3, turn off pin 1 and 2 so 0000 1000
GREEN:
	ORR r9, r9, #0x08
	STRB r9, [r3, #0x3FC]
	B COLOR_STOP

    ; PURPLE = red + blue, pins 1 and 2 on, 3 off -> 0000 0110
PURPLE:
	ORR r9, r9, #06
	STRB r9, [r3, #0x3FC]
	B COLOR_STOP

    ; YELLOW = red + green, pins 1 and 3, 2 off -> 0000 1010
YELLOW:
	ORR r9, r9, #0x0A
	STRB r9, [r3, #0x3FC]
	B COLOR_STOP

    ; WHITE = red + blue + green, pins 1-3 on -> 0000 1110
WHITE:
	ORR r9, r9, #0x0E
	STRB r9, [r3, #0x3FC]
	B COLOR_STOP

COLOR_STOP:

	POP {r4-r12,lr}  	; Restore registers from stack
	MOV pc, lr

;_________________________________________________________________________________________________________________________________________________

side_checker:
	PUSH {r4-r12,lr}	; Spill registers to stack

	MOV r2, #0			; this will be used to track the # of sides done
	MOV r3, #0			; this will be used to store the ascii value of the first character
	MOV r4, #0			; will be a running sum to 9


	LDR r0, ptr_to_s1
	LDRB r1, [r0]
	MOV r3, r1
checker_loop1:
	CMP r3, r1
	BNE side2
	ADD r4, r4, #1
	CMP r4, #8
	BEQ side1_done
	LDRB r1, [r0, #1]
	b checker_loop1

side1_done:
	ADD r2, r2, #1
	b side2


side2:
	MOV r4, #0
	LDR r0, ptr_to_s2
	LDRB r1, [r0]
	MOV r3, r1
checker_loop2:
	CMP r3, r1
	BNE side3
	ADD r4, r4, #1
	CMP r4, #8
	BEQ side2_done
	LDRB r1, [r0, #1]
	b checker_loop2

side2_done:
	ADD r2, r2, #1
	b side3

side3:
	MOV r4, #0
	LDR r0, ptr_to_s3
	LDRB r1, [r0]
	MOV r3, r1
checker_loop3:
	CMP r3, r1
	BNE side4
	ADD r4, r4, #1
	CMP r4, #8
	BEQ side3_done
	LDRB r1, [r0, #1]
	b checker_loop3

side3_done:
	ADD r2, r2, #1
	b side4

side4:
	MOV r4, #0
	LDR r0, ptr_to_s4
	LDRB r1, [r0]
	MOV r3, r1
checker_loop4:
	CMP r3, r1
	BNE side5
	ADD r4, r4, #1
	CMP r4, #8
	BEQ side4_done
	LDRB r1, [r0, #1]
	b checker_loop4

side4_done:
	ADD r2, r2, #1
	b side5

side5:
	MOV r4, #0
	LDR r0, ptr_to_s5
	LDRB r1, [r0]
	MOV r3, r1
checker_loop5:
	CMP r3, r1
	BNE side6
	ADD r4, r4, #1
	CMP r4, #8
	BEQ side5_done
	LDRB r1, [r0, #1]
	b checker_loop5

side5_done:
	ADD r2, r2, #1
	b side6

side6:
	MOV r4, #0
	LDR r0, ptr_to_s6
	LDRB r1, [r0]
	MOV r3, r1
checker_loop6:
	CMP r3, r1
	BNE checker_end
	ADD r4, r4, #1
	CMP r4, #8
	BEQ side6_done
	LDRB r1, [r0, #1]
	b checker_loop6

side6_done:
	ADD r2, r2, #1
	b checker_end

checker_end:
	LDR r0, ptr_to_sidesdone
	STR r2, [r0]

	BL illuminateLEDs

	POP {r4-r12,lr}  	; Restore registers from stack
	MOV pc, lr

;_________________________________________________________________________________________________
illuminateLEDs:
    PUSH {r4-r12,lr}    ; Spill registers to stack

          ; Your code is placed here

    ;Check flag to see how many sides are complete
    LDR r4, ptr_to_sidesdone
    LDRB r5, [r4]

    ; Get Port B Base Address
    MOV r6, #0x5000
    MOVT r6, #0x4000

    LDRB r7, [r6, #0x3FC]

    ;1 side is complete
    CMP r5, #1
    BEQ ONE_DONE

    ;2 sides are complete
    CMP r5, #2
    BEQ TWO_DONE

    ;3 sides are complete
    CMP r5, #3
    BEQ THREE_DONE

    ;4 sides are complete
    CMP r5, #4
    BEQ FOUR_DONE

    ;All sides are complete -> dance
    CMP r5, #6
    BEQ LED_DANCE

ONE_DONE:
    ORR r7, r7, #0x01            ; 0000 0001
    STRB r7, [r6, #0x3FC]
    B LED_STOP

TWO_DONE:                        ; 0000 0011
    ORR r7, r7, #0x03
    STRB r7, [r6, #0x3FC]
    B LED_STOP

THREE_DONE:                        ; 0000 0111
    ORR r7, r7, #0x07
    STRB r7, [r6, #0x3FC]
    B LED_STOP

FOUR_DONE:                        ; 0000 1111
    ORR r7, r7, #0x0F
    STRB r7, [r6, #0x3FC]
    B LED_STOP

LED_DANCE:                        ; flash leds 4 times
    ; ON all
    ORR r7, r7, #0x0F
    STRB r7, [r6, #0x3FC]

    ; OFF All
    BIC r7, r7, #0x0F
    STRB r7, [r6, #0x3FC]

    ; ON all
    ORR r7, r7, #0x0F
    STRB r7, [r6, #0x3FC]

    ; OFF All
    BIC r7, r7, #0x0F
    STRB r7, [r6, #0x3FC]

    ; ON all
    ORR r7, r7, #0x0F
    STRB r7, [r6, #0x3FC]

    ; OFF All
    BIC r7, r7, #0x0F
    STRB r7, [r6, #0x3FC]

    ; ON all
    ORR r7, r7, #0x0F
    STRB r7, [r6, #0x3FC]

    ; OFF All
    BIC r7, r7, #0x0F
    STRB r7, [r6, #0x3FC]
    B LED_STOP

LED_STOP:

    POP {r4-r12,lr}      ; Restore registers from stack
    MOV pc, lr

;____________________________________________________________________________________________________

validate_move:
    PUSH {r4-r12,lr}    ; Spill registers to stack

	LDR r1, ptr_to_sideflag
	LDR r0, [r1]
	CMP r0, #0
	BEQ v_s1
	CMP r0, #1
	BEQ v_s2
	CMP r0, #2
	BEQ v_s3
	CMP r0, #3
	BEQ v_s4
	CMP r0, #4
	BEQ v_s5
	CMP r0, #5
	BEQ v_s6


v_s1:
	LDR r0, ptr_to_current
	LDR r1, [r0]
	CMP r1, #'s'
	BEQ val_1_s
	CMP r1, #'d'
	BEQ val_1_d
	CMP r1, #'a'
	BEQ val_1_a
	CMP r1, #'w'
	BEQ val_1_w

val_1_s:
	LDR r0, ptr_to_spos
	LDR r1, [r0]


	b v_end

val_1_d:

	b v_end

val_1_a:

	b v_end

val_1_w:


	b v_end

v_s2:

	b v_end

v_s3:

	b v_end

v_s4:

	b v_end

v_s5:

	b v_end

v_s6:

	b v_end




v_end:




    POP {r4-r12,lr}      ; Restore registers from stack
    MOV pc, lr


