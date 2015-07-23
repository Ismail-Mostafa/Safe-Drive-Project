
_delay_debounce:

;sen.c,9 :: 		void delay_debounce(){ Delay_ms(300);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_delay_debounce0:
	DECFSZ     R13+0, 1
	GOTO       L_delay_debounce0
	DECFSZ     R12+0, 1
	GOTO       L_delay_debounce0
	DECFSZ     R11+0, 1
	GOTO       L_delay_debounce0
;sen.c,10 :: 		}
	RETURN
; end of _delay_debounce

_delay_refresh:

;sen.c,11 :: 		void delay_refresh(){ Delay_ms(5);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_delay_refresh1:
	DECFSZ     R13+0, 1
	GOTO       L_delay_refresh1
	DECFSZ     R12+0, 1
	GOTO       L_delay_refresh1
;sen.c,12 :: 		}
	RETURN
; end of _delay_refresh

_countpulse:

;sen.c,13 :: 		void countpulse(){ IR_Tx = 1;
	BSF        RA3_bit+0, 3
;sen.c,14 :: 		delay_debounce();
	CALL       _delay_debounce+0
;sen.c,15 :: 		delay_debounce();
	CALL       _delay_debounce+0
;sen.c,16 :: 		TMR0=0;
	CLRF       TMR0+0
;sen.c,17 :: 		Delay_ms(15000);        // Delay 15 Sec
	MOVLW      77
	MOVWF      R11+0
	MOVLW      25
	MOVWF      R12+0
	MOVLW      79
	MOVWF      R13+0
L_countpulse2:
	DECFSZ     R13+0, 1
	GOTO       L_countpulse2
	DECFSZ     R12+0, 1
	GOTO       L_countpulse2
	DECFSZ     R11+0, 1
	GOTO       L_countpulse2
	NOP
	NOP
;sen.c,18 :: 		IR_Tx = 0;
	BCF        RA3_bit+0, 3
;sen.c,19 :: 		pulsecount = TMR0;
	MOVF       TMR0+0, 0
	MOVWF      _pulsecount+0
;sen.c,20 :: 		pulserate = pulsecount*4;
	MOVF       _pulsecount+0, 0
	MOVWF      _pulserate+0
	RLF        _pulserate+0, 1
	BCF        _pulserate+0, 0
	RLF        _pulserate+0, 1
	BCF        _pulserate+0, 0
;sen.c,21 :: 		}
	RETURN
; end of _countpulse

_main:

;sen.c,22 :: 		void main() {
;sen.c,23 :: 		UART1_Init(9600);
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;sen.c,24 :: 		CMCON = 0x07;        // Disable Comparators
	MOVLW      7
	MOVWF      CMCON+0
;sen.c,25 :: 		TRISA = 0b00110001; // RA4/T0CKI input, RA5 is I/P only TRISB = 0b10000000; // RB7 input, rest output
	MOVLW      49
	MOVWF      TRISA+0
;sen.c,26 :: 		OPTION_REG = 0b00101000; // Prescaler (1:1), TOCS =1 for counter mode
	MOVLW      40
	MOVWF      OPTION_REG+0
;sen.c,27 :: 		pulserate = 0;
	CLRF       _pulserate+0
;sen.c,30 :: 		porta.f3=1;
	BSF        PORTA+0, 3
;sen.c,31 :: 		porta.f1=1;
	BSF        PORTA+0, 1
;sen.c,32 :: 		porta.f2=0;
	BCF        PORTA+0, 2
;sen.c,33 :: 		while(porta.f0==1){
L_main3:
	BTFSS      PORTA+0, 0
	GOTO       L_main4
;sen.c,34 :: 		delay_debounce();
	CALL       _delay_debounce+0
;sen.c,35 :: 		countpulse();
	CALL       _countpulse+0
;sen.c,36 :: 		UART1_Write(pulserate);
	MOVF       _pulserate+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;sen.c,37 :: 		}
	GOTO       L_main3
L_main4:
;sen.c,38 :: 		if(porta.f0==0)
	BTFSC      PORTA+0, 0
	GOTO       L_main5
;sen.c,40 :: 		uart1_write(150);
	MOVLW      150
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;sen.c,41 :: 		porta.f1=0;
	BCF        PORTA+0, 1
;sen.c,42 :: 		porta.f2=1;
	BSF        PORTA+0, 2
;sen.c,43 :: 		}
L_main5:
;sen.c,47 :: 		}
	GOTO       $+0
; end of _main
