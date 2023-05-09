
_main:

;Level_control.c,13 :: 		void main() {
;Level_control.c,14 :: 		trisc=0; portc=0;
	CLRF       TRISC+0
	CLRF       PORTC+0
;Level_control.c,15 :: 		trisb=0b00000111; portb=0;
	MOVLW      7
	MOVWF      TRISB+0
	CLRF       PORTB+0
;Level_control.c,17 :: 		while(start_switch==0);
L_main0:
	BTFSC      PORTB+0, 0
	GOTO       L_main1
	GOTO       L_main0
L_main1:
;Level_control.c,19 :: 		loop:
___main_loop:
;Level_control.c,20 :: 		if(LL==1)
	BTFSS      PORTB+0, 1
	GOTO       L_main2
;Level_control.c,22 :: 		Valve=0;
	BCF        PORTC+0, 0
;Level_control.c,23 :: 		Pump=1;
	BSF        PORTC+0, 1
;Level_control.c,24 :: 		}
	GOTO       L_main3
L_main2:
;Level_control.c,25 :: 		else if(HL==1)
	BTFSS      PORTB+0, 2
	GOTO       L_main4
;Level_control.c,27 :: 		Pump=0;
	BCF        PORTC+0, 1
;Level_control.c,28 :: 		Valve=1;
	BSF        PORTC+0, 0
;Level_control.c,29 :: 		}
L_main4:
L_main3:
;Level_control.c,30 :: 		goto loop;
	GOTO       ___main_loop
;Level_control.c,31 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
