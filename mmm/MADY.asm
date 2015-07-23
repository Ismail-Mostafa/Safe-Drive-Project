
_ultra1:

;MADY.c,5 :: 		ultra1()
;MADY.c,7 :: 		i=0;
	CLRF       _i+0
	CLRF       _i+1
;MADY.c,8 :: 		trisb=0;
	CLRF       TRISB+0
;MADY.c,9 :: 		portb.f2=1;
	BSF        PORTB+0, 2
;MADY.c,10 :: 		delay_us(5);
	NOP
	NOP
	NOP
	NOP
	NOP
;MADY.c,11 :: 		portb.f2=0;
	BCF        PORTB+0, 2
;MADY.c,12 :: 		trisb=0b00000100;
	MOVLW      4
	MOVWF      TRISB+0
;MADY.c,13 :: 		delay_us(750);
	MOVLW      249
	MOVWF      R13+0
L_ultra10:
	DECFSZ     R13+0, 1
	GOTO       L_ultra10
	NOP
	NOP
;MADY.c,14 :: 		while(portb.f2==1)
L_ultra11:
	BTFSS      PORTB+0, 2
	GOTO       L_ultra12
;MADY.c,15 :: 		{i++;
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;MADY.c,16 :: 		delay_us(22);
	MOVLW      7
	MOVWF      R13+0
L_ultra13:
	DECFSZ     R13+0, 1
	GOTO       L_ultra13
;MADY.c,17 :: 		}
	GOTO       L_ultra11
L_ultra12:
;MADY.c,18 :: 		i=i/2;
	RRF        _i+1, 1
	RRF        _i+0, 1
	BCF        _i+1, 7
	BTFSC      _i+1, 6
	BSF        _i+1, 7
;MADY.c,19 :: 		}
L_end_ultra1:
	RETURN
; end of _ultra1

_ultra2:

;MADY.c,20 :: 		ultra2()
;MADY.c,22 :: 		j=0;
	CLRF       _j+0
	CLRF       _j+1
;MADY.c,23 :: 		trisb=0;
	CLRF       TRISB+0
;MADY.c,24 :: 		portb.f6=1;
	BSF        PORTB+0, 6
;MADY.c,25 :: 		delay_us(5);
	NOP
	NOP
	NOP
	NOP
	NOP
;MADY.c,26 :: 		portb.f6=0;
	BCF        PORTB+0, 6
;MADY.c,27 :: 		trisb=0b01000000;
	MOVLW      64
	MOVWF      TRISB+0
;MADY.c,28 :: 		delay_us(750);
	MOVLW      249
	MOVWF      R13+0
L_ultra24:
	DECFSZ     R13+0, 1
	GOTO       L_ultra24
	NOP
	NOP
;MADY.c,29 :: 		while(portb.f6==1)
L_ultra25:
	BTFSS      PORTB+0, 6
	GOTO       L_ultra26
;MADY.c,30 :: 		{j++;
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;MADY.c,31 :: 		delay_us(22);
	MOVLW      7
	MOVWF      R13+0
L_ultra27:
	DECFSZ     R13+0, 1
	GOTO       L_ultra27
;MADY.c,32 :: 		}
	GOTO       L_ultra25
L_ultra26:
;MADY.c,33 :: 		j=j/2;
	RRF        _j+1, 1
	RRF        _j+0, 1
	BCF        _j+1, 7
	BTFSC      _j+1, 6
	BSF        _j+1, 7
;MADY.c,34 :: 		}
L_end_ultra2:
	RETURN
; end of _ultra2

_ultra3:

;MADY.c,35 :: 		ultra3()
;MADY.c,37 :: 		q=0;
	CLRF       _q+0
	CLRF       _q+1
;MADY.c,38 :: 		trisb=0;
	CLRF       TRISB+0
;MADY.c,39 :: 		portb.f4=1;
	BSF        PORTB+0, 4
;MADY.c,40 :: 		delay_us(5);
	NOP
	NOP
	NOP
	NOP
	NOP
;MADY.c,41 :: 		portb.f4=0;
	BCF        PORTB+0, 4
;MADY.c,42 :: 		trisb=0b00010000;
	MOVLW      16
	MOVWF      TRISB+0
;MADY.c,43 :: 		delay_us(750);
	MOVLW      249
	MOVWF      R13+0
L_ultra38:
	DECFSZ     R13+0, 1
	GOTO       L_ultra38
	NOP
	NOP
;MADY.c,44 :: 		while(portb.f4==1)
L_ultra39:
	BTFSS      PORTB+0, 4
	GOTO       L_ultra310
;MADY.c,45 :: 		{q++;
	INCF       _q+0, 1
	BTFSC      STATUS+0, 2
	INCF       _q+1, 1
;MADY.c,46 :: 		delay_us(22);
	MOVLW      7
	MOVWF      R13+0
L_ultra311:
	DECFSZ     R13+0, 1
	GOTO       L_ultra311
;MADY.c,47 :: 		}
	GOTO       L_ultra39
L_ultra310:
;MADY.c,48 :: 		q=q/2;
	RRF        _q+1, 1
	RRF        _q+0, 1
	BCF        _q+1, 7
	BTFSC      _q+1, 6
	BSF        _q+1, 7
;MADY.c,49 :: 		}
L_end_ultra3:
	RETURN
; end of _ultra3

_initrit:

;MADY.c,50 :: 		initrit(){     trisd=0;
	CLRF       TRISD+0
;MADY.c,51 :: 		ultra1();
	CALL       _ultra1+0
;MADY.c,52 :: 		if(i>20){ portd=0b01010000;
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__initrit32
	MOVF       _i+0, 0
	SUBLW      20
L__initrit32:
	BTFSC      STATUS+0, 0
	GOTO       L_initrit12
	MOVLW      80
	MOVWF      PORTD+0
;MADY.c,53 :: 		}
L_initrit12:
;MADY.c,54 :: 		}
L_end_initrit:
	RETURN
; end of _initrit

_forward:

;MADY.c,55 :: 		forward(){    trisd=0;
	CLRF       TRISD+0
;MADY.c,56 :: 		ultra3();
	CALL       _ultra3+0
;MADY.c,57 :: 		intToStr(q,txt);
	MOVF       _q+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _q+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;MADY.c,58 :: 		uart1_write_text(txt);
	MOVLW      _txt+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;MADY.c,59 :: 		if(q<10)
	MOVLW      128
	XORWF      _q+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__forward34
	MOVLW      10
	SUBWF      _q+0, 0
L__forward34:
	BTFSC      STATUS+0, 0
	GOTO       L_forward13
;MADY.c,60 :: 		f1++;
	INCF       _f1+0, 1
	BTFSC      STATUS+0, 2
	INCF       _f1+1, 1
L_forward13:
;MADY.c,61 :: 		while(q>10){         ultra3();
L_forward14:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _q+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__forward35
	MOVF       _q+0, 0
	SUBLW      10
L__forward35:
	BTFSC      STATUS+0, 0
	GOTO       L_forward15
	CALL       _ultra3+0
;MADY.c,62 :: 		intToStr(q,txt);
	MOVF       _q+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _q+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;MADY.c,63 :: 		uart1_write_text(txt);
	MOVLW      _txt+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;MADY.c,64 :: 		uart1_write_text("loop");
	MOVLW      ?lstr1_MADY+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;MADY.c,65 :: 		portd=0b01100000;
	MOVLW      96
	MOVWF      PORTD+0
;MADY.c,66 :: 		}
	GOTO       L_forward14
L_forward15:
;MADY.c,67 :: 		}
L_end_forward:
	RETURN
; end of _forward

_trnlft:

;MADY.c,68 :: 		trnlft(){   trisd=0;
	CLRF       TRISD+0
;MADY.c,69 :: 		ultra2();
	CALL       _ultra2+0
;MADY.c,70 :: 		intToStr(j,txt);
	MOVF       _j+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _j+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;MADY.c,71 :: 		uart1_write_text(txt);
	MOVLW      _txt+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;MADY.c,72 :: 		if(j<10)
	MOVLW      128
	XORWF      _j+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__trnlft37
	MOVLW      10
	SUBWF      _j+0, 0
L__trnlft37:
	BTFSC      STATUS+0, 0
	GOTO       L_trnlft16
;MADY.c,73 :: 		f2++;
	INCF       _f2+0, 1
	BTFSC      STATUS+0, 2
	INCF       _f2+1, 1
L_trnlft16:
;MADY.c,74 :: 		while(j>10){
L_trnlft17:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _j+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__trnlft38
	MOVF       _j+0, 0
	SUBLW      10
L__trnlft38:
	BTFSC      STATUS+0, 0
	GOTO       L_trnlft18
;MADY.c,75 :: 		intToStr(j,txt);
	MOVF       _j+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _j+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;MADY.c,76 :: 		uart1_write_text(txt);
	MOVLW      _txt+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;MADY.c,77 :: 		ultra2();
	CALL       _ultra2+0
;MADY.c,78 :: 		portd=0b10100000;
	MOVLW      160
	MOVWF      PORTD+0
;MADY.c,79 :: 		}
	GOTO       L_trnlft17
L_trnlft18:
;MADY.c,80 :: 		}
L_end_trnlft:
	RETURN
; end of _trnlft

_main:

;MADY.c,81 :: 		void main() {   uart1_init(9600);
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;MADY.c,82 :: 		uart1_write_text("ready");
	MOVLW      ?lstr2_MADY+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;MADY.c,83 :: 		trisd=0 ;
	CLRF       TRISD+0
;MADY.c,84 :: 		for(zz=0;zz<10;zz++)
	CLRF       _zz+0
	CLRF       _zz+1
L_main19:
	MOVLW      128
	XORWF      _zz+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main40
	MOVLW      10
	SUBWF      _zz+0, 0
L__main40:
	BTFSC      STATUS+0, 0
	GOTO       L_main20
;MADY.c,86 :: 		initrit();
	CALL       _initrit+0
;MADY.c,87 :: 		delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main22:
	DECFSZ     R13+0, 1
	GOTO       L_main22
	DECFSZ     R12+0, 1
	GOTO       L_main22
	DECFSZ     R11+0, 1
	GOTO       L_main22
	NOP
;MADY.c,84 :: 		for(zz=0;zz<10;zz++)
	INCF       _zz+0, 1
	BTFSC      STATUS+0, 2
	INCF       _zz+1, 1
;MADY.c,88 :: 		}
	GOTO       L_main19
L_main20:
;MADY.c,89 :: 		while(f1<50)
L_main23:
	MOVLW      128
	XORWF      _f1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main41
	MOVLW      50
	SUBWF      _f1+0, 0
L__main41:
	BTFSC      STATUS+0, 0
	GOTO       L_main24
;MADY.c,90 :: 		forward();
	CALL       _forward+0
	GOTO       L_main23
L_main24:
;MADY.c,91 :: 		portd=0;
	CLRF       PORTD+0
;MADY.c,92 :: 		delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main25:
	DECFSZ     R13+0, 1
	GOTO       L_main25
	DECFSZ     R12+0, 1
	GOTO       L_main25
	DECFSZ     R11+0, 1
	GOTO       L_main25
	NOP
	NOP
;MADY.c,93 :: 		while(f2<50)
L_main26:
	MOVLW      128
	XORWF      _f2+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main42
	MOVLW      50
	SUBWF      _f2+0, 0
L__main42:
	BTFSC      STATUS+0, 0
	GOTO       L_main27
;MADY.c,94 :: 		trnlft();
	CALL       _trnlft+0
	GOTO       L_main26
L_main27:
;MADY.c,95 :: 		portd=0;
	CLRF       PORTD+0
;MADY.c,96 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
