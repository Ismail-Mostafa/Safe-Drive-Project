
_ultra1:

;ddd.c,3 :: 		ultra1()
;ddd.c,5 :: 		i=0;
	CLRF       _i+0
	CLRF       _i+1
;ddd.c,6 :: 		trisb=0;
	CLRF       TRISB+0
;ddd.c,7 :: 		portb.f2=1;
	BSF        PORTB+0, 2
;ddd.c,8 :: 		delay_us(5);
	NOP
	NOP
	NOP
	NOP
	NOP
;ddd.c,9 :: 		portb.f2=0;
	BCF        PORTB+0, 2
;ddd.c,10 :: 		trisb=0b00000100;
	MOVLW      4
	MOVWF      TRISB+0
;ddd.c,11 :: 		delay_us(750);
	MOVLW      249
	MOVWF      R13+0
L_ultra10:
	DECFSZ     R13+0, 1
	GOTO       L_ultra10
	NOP
	NOP
;ddd.c,12 :: 		while(portb.f2==1)
L_ultra11:
	BTFSS      PORTB+0, 2
	GOTO       L_ultra12
;ddd.c,13 :: 		{i++;
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;ddd.c,14 :: 		delay_us(22);
	MOVLW      7
	MOVWF      R13+0
L_ultra13:
	DECFSZ     R13+0, 1
	GOTO       L_ultra13
;ddd.c,15 :: 		}
	GOTO       L_ultra11
L_ultra12:
;ddd.c,16 :: 		i=i/2;
	RRF        _i+1, 1
	RRF        _i+0, 1
	BCF        _i+1, 7
	BTFSC      _i+1, 6
	BSF        _i+1, 7
;ddd.c,17 :: 		}
L_end_ultra1:
	RETURN
; end of _ultra1

_ultra2:

;ddd.c,18 :: 		ultra2()
;ddd.c,20 :: 		j=0;
	CLRF       _j+0
	CLRF       _j+1
;ddd.c,21 :: 		trisb=0;
	CLRF       TRISB+0
;ddd.c,22 :: 		portb.f3=1;
	BSF        PORTB+0, 3
;ddd.c,23 :: 		delay_us(5);
	NOP
	NOP
	NOP
	NOP
	NOP
;ddd.c,24 :: 		portb.f3=0;
	BCF        PORTB+0, 3
;ddd.c,25 :: 		trisb=0b00001000;
	MOVLW      8
	MOVWF      TRISB+0
;ddd.c,26 :: 		delay_us(750);
	MOVLW      249
	MOVWF      R13+0
L_ultra24:
	DECFSZ     R13+0, 1
	GOTO       L_ultra24
	NOP
	NOP
;ddd.c,27 :: 		while(portb.f3==1)
L_ultra25:
	BTFSS      PORTB+0, 3
	GOTO       L_ultra26
;ddd.c,28 :: 		{j++;
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;ddd.c,29 :: 		delay_us(22);
	MOVLW      7
	MOVWF      R13+0
L_ultra27:
	DECFSZ     R13+0, 1
	GOTO       L_ultra27
;ddd.c,30 :: 		}
	GOTO       L_ultra25
L_ultra26:
;ddd.c,31 :: 		j=j/2;
	RRF        _j+1, 1
	RRF        _j+0, 1
	BCF        _j+1, 7
	BTFSC      _j+1, 6
	BSF        _j+1, 7
;ddd.c,32 :: 		}
L_end_ultra2:
	RETURN
; end of _ultra2

_ultra3:

;ddd.c,33 :: 		ultra3()
;ddd.c,35 :: 		q=0;
	CLRF       _q+0
	CLRF       _q+1
;ddd.c,36 :: 		trisb=0;
	CLRF       TRISB+0
;ddd.c,37 :: 		portb.f4=1;
	BSF        PORTB+0, 4
;ddd.c,38 :: 		delay_us(5);
	NOP
	NOP
	NOP
	NOP
	NOP
;ddd.c,39 :: 		portb.f4=0;
	BCF        PORTB+0, 4
;ddd.c,40 :: 		trisb=0b00010000;
	MOVLW      16
	MOVWF      TRISB+0
;ddd.c,41 :: 		delay_us(750);
	MOVLW      249
	MOVWF      R13+0
L_ultra38:
	DECFSZ     R13+0, 1
	GOTO       L_ultra38
	NOP
	NOP
;ddd.c,42 :: 		while(portb.f4==1)
L_ultra39:
	BTFSS      PORTB+0, 4
	GOTO       L_ultra310
;ddd.c,43 :: 		{q++;
	INCF       _q+0, 1
	BTFSC      STATUS+0, 2
	INCF       _q+1, 1
;ddd.c,44 :: 		delay_us(22);
	MOVLW      7
	MOVWF      R13+0
L_ultra311:
	DECFSZ     R13+0, 1
	GOTO       L_ultra311
;ddd.c,45 :: 		}
	GOTO       L_ultra39
L_ultra310:
;ddd.c,46 :: 		q=q/2;
	RRF        _q+1, 1
	RRF        _q+0, 1
	BCF        _q+1, 7
	BTFSC      _q+1, 6
	BSF        _q+1, 7
;ddd.c,47 :: 		}
L_end_ultra3:
	RETURN
; end of _ultra3

_initrit:

;ddd.c,48 :: 		initrit(){     trisd=0;
	CLRF       TRISD+0
;ddd.c,49 :: 		ultra1();
	CALL       _ultra1+0
;ddd.c,50 :: 		if(i>20){ portd=0b01010000;
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__initrit25
	MOVF       _i+0, 0
	SUBLW      20
L__initrit25:
	BTFSC      STATUS+0, 0
	GOTO       L_initrit12
	MOVLW      80
	MOVWF      PORTD+0
;ddd.c,51 :: 		delay_ms(2000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_initrit13:
	DECFSZ     R13+0, 1
	GOTO       L_initrit13
	DECFSZ     R12+0, 1
	GOTO       L_initrit13
	DECFSZ     R11+0, 1
	GOTO       L_initrit13
	NOP
	NOP
;ddd.c,52 :: 		}
L_initrit12:
;ddd.c,53 :: 		}
L_end_initrit:
	RETURN
; end of _initrit

_forward:

;ddd.c,54 :: 		forward(){    trisd=0;
	CLRF       TRISD+0
;ddd.c,55 :: 		ultra3();
	CALL       _ultra3+0
;ddd.c,56 :: 		intToStr(q,txt);
	MOVF       _q+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _q+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;ddd.c,57 :: 		uart1_write_text(txt);
	MOVLW      _txt+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;ddd.c,58 :: 		while(q>10){             ultra3();
L_forward14:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _q+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__forward27
	MOVF       _q+0, 0
	SUBLW      10
L__forward27:
	BTFSC      STATUS+0, 0
	GOTO       L_forward15
	CALL       _ultra3+0
;ddd.c,59 :: 		intToStr(q,txt);
	MOVF       _q+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _q+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;ddd.c,60 :: 		uart1_write_text(txt);
	MOVLW      _txt+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;ddd.c,61 :: 		uart1_write_text("loop");
	MOVLW      ?lstr1_ddd+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;ddd.c,62 :: 		portd=0b01100000;
	MOVLW      96
	MOVWF      PORTD+0
;ddd.c,63 :: 		}
	GOTO       L_forward14
L_forward15:
;ddd.c,64 :: 		}
L_end_forward:
	RETURN
; end of _forward

_trnlft:

;ddd.c,65 :: 		trnlft(){   trisd=0;
	CLRF       TRISD+0
;ddd.c,66 :: 		while(j>20){          ultra2();
L_trnlft16:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _j+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__trnlft29
	MOVF       _j+0, 0
	SUBLW      20
L__trnlft29:
	BTFSC      STATUS+0, 0
	GOTO       L_trnlft17
	CALL       _ultra2+0
;ddd.c,67 :: 		portd=0b01010000;
	MOVLW      80
	MOVWF      PORTD+0
;ddd.c,68 :: 		}
	GOTO       L_trnlft16
L_trnlft17:
;ddd.c,69 :: 		}
L_end_trnlft:
	RETURN
; end of _trnlft

_main:

;ddd.c,70 :: 		void main() {   uart1_init(9600);
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;ddd.c,71 :: 		uart1_write_text("ready");
	MOVLW      ?lstr2_ddd+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;ddd.c,72 :: 		trisd=0 ;
	CLRF       TRISD+0
;ddd.c,74 :: 		for(;;){
L_main18:
;ddd.c,76 :: 		forward();
	CALL       _forward+0
;ddd.c,81 :: 		portd=0; }
	CLRF       PORTD+0
	GOTO       L_main18
;ddd.c,83 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
