
_ultra1:

;ultra2.c,7 :: 		ultra1()
;ultra2.c,9 :: 		i=0;
	CLRF       _i+0
	CLRF       _i+1
;ultra2.c,10 :: 		trisb=0;
	CLRF       TRISB+0
;ultra2.c,11 :: 		portb.f2=1;
	BSF        PORTB+0, 2
;ultra2.c,12 :: 		delay_us(5);
	NOP
	NOP
	NOP
	NOP
	NOP
;ultra2.c,13 :: 		portb.f2=0;
	BCF        PORTB+0, 2
;ultra2.c,14 :: 		trisb=0b00000100;
	MOVLW      4
	MOVWF      TRISB+0
;ultra2.c,15 :: 		delay_us(750);
	MOVLW      249
	MOVWF      R13+0
L_ultra10:
	DECFSZ     R13+0, 1
	GOTO       L_ultra10
	NOP
	NOP
;ultra2.c,16 :: 		while(portb.f2==1)
L_ultra11:
	BTFSS      PORTB+0, 2
	GOTO       L_ultra12
;ultra2.c,17 :: 		{i++;
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;ultra2.c,18 :: 		delay_us(22);
	MOVLW      7
	MOVWF      R13+0
L_ultra13:
	DECFSZ     R13+0, 1
	GOTO       L_ultra13
;ultra2.c,19 :: 		}
	GOTO       L_ultra11
L_ultra12:
;ultra2.c,20 :: 		i=i/2;
	RRF        _i+1, 1
	RRF        _i+0, 1
	BCF        _i+1, 7
	BTFSC      _i+1, 6
	BSF        _i+1, 7
;ultra2.c,21 :: 		}
L_end_ultra1:
	RETURN
; end of _ultra1

_ultra2:

;ultra2.c,22 :: 		ultra2()
;ultra2.c,24 :: 		j=0;
	CLRF       _j+0
	CLRF       _j+1
;ultra2.c,25 :: 		trisb=0;
	CLRF       TRISB+0
;ultra2.c,26 :: 		portb.f6=1;
	BSF        PORTB+0, 6
;ultra2.c,27 :: 		delay_us(5);
	NOP
	NOP
	NOP
	NOP
	NOP
;ultra2.c,28 :: 		portb.f6=0;
	BCF        PORTB+0, 6
;ultra2.c,29 :: 		trisb=0b01000000;
	MOVLW      64
	MOVWF      TRISB+0
;ultra2.c,30 :: 		delay_us(750);
	MOVLW      249
	MOVWF      R13+0
L_ultra24:
	DECFSZ     R13+0, 1
	GOTO       L_ultra24
	NOP
	NOP
;ultra2.c,31 :: 		while(portb.f6==1)
L_ultra25:
	BTFSS      PORTB+0, 6
	GOTO       L_ultra26
;ultra2.c,32 :: 		{j++;
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;ultra2.c,33 :: 		delay_us(22);
	MOVLW      7
	MOVWF      R13+0
L_ultra27:
	DECFSZ     R13+0, 1
	GOTO       L_ultra27
;ultra2.c,34 :: 		}
	GOTO       L_ultra25
L_ultra26:
;ultra2.c,35 :: 		j=j/2;
	RRF        _j+1, 1
	RRF        _j+0, 1
	BCF        _j+1, 7
	BTFSC      _j+1, 6
	BSF        _j+1, 7
;ultra2.c,36 :: 		}
L_end_ultra2:
	RETURN
; end of _ultra2

_ultra3:

;ultra2.c,37 :: 		ultra3()
;ultra2.c,39 :: 		q=0;
	CLRF       _q+0
	CLRF       _q+1
;ultra2.c,40 :: 		trisb=0;
	CLRF       TRISB+0
;ultra2.c,41 :: 		portb.f4=1;
	BSF        PORTB+0, 4
;ultra2.c,42 :: 		delay_us(5);
	NOP
	NOP
	NOP
	NOP
	NOP
;ultra2.c,43 :: 		portb.f4=0;
	BCF        PORTB+0, 4
;ultra2.c,44 :: 		trisb=0b00010000;
	MOVLW      16
	MOVWF      TRISB+0
;ultra2.c,45 :: 		delay_us(750);
	MOVLW      249
	MOVWF      R13+0
L_ultra38:
	DECFSZ     R13+0, 1
	GOTO       L_ultra38
	NOP
	NOP
;ultra2.c,46 :: 		while(portb.f4==1)
L_ultra39:
	BTFSS      PORTB+0, 4
	GOTO       L_ultra310
;ultra2.c,47 :: 		{q++;
	INCF       _q+0, 1
	BTFSC      STATUS+0, 2
	INCF       _q+1, 1
;ultra2.c,48 :: 		delay_us(22);
	MOVLW      7
	MOVWF      R13+0
L_ultra311:
	DECFSZ     R13+0, 1
	GOTO       L_ultra311
;ultra2.c,49 :: 		}
	GOTO       L_ultra39
L_ultra310:
;ultra2.c,50 :: 		q=q/2;
	RRF        _q+1, 1
	RRF        _q+0, 1
	BCF        _q+1, 7
	BTFSC      _q+1, 6
	BSF        _q+1, 7
;ultra2.c,51 :: 		}
L_end_ultra3:
	RETURN
; end of _ultra3

_initrit:

;ultra2.c,52 :: 		initrit(){     trisd=0;
	CLRF       TRISD+0
;ultra2.c,53 :: 		ultra1();
	CALL       _ultra1+0
;ultra2.c,54 :: 		if(i>20){ portd=0b01010000;
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__initrit38
	MOVF       _i+0, 0
	SUBLW      20
L__initrit38:
	BTFSC      STATUS+0, 0
	GOTO       L_initrit12
	MOVLW      80
	MOVWF      PORTD+0
;ultra2.c,55 :: 		}
L_initrit12:
;ultra2.c,56 :: 		}
L_end_initrit:
	RETURN
; end of _initrit

_forward:

;ultra2.c,57 :: 		forward(){    trisd=0;
	CLRF       TRISD+0
;ultra2.c,58 :: 		ultra3();
	CALL       _ultra3+0
;ultra2.c,59 :: 		intToStr(q,txt);
	MOVF       _q+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _q+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;ultra2.c,60 :: 		uart1_write_text(txt);
	MOVLW      _txt+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;ultra2.c,61 :: 		if(q<30)
	MOVLW      128
	XORWF      _q+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__forward40
	MOVLW      30
	SUBWF      _q+0, 0
L__forward40:
	BTFSC      STATUS+0, 0
	GOTO       L_forward13
;ultra2.c,62 :: 		f1++;
	INCF       _f1+0, 1
	BTFSC      STATUS+0, 2
	INCF       _f1+1, 1
L_forward13:
;ultra2.c,63 :: 		while(q>30){         ultra3();
L_forward14:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _q+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__forward41
	MOVF       _q+0, 0
	SUBLW      30
L__forward41:
	BTFSC      STATUS+0, 0
	GOTO       L_forward15
	CALL       _ultra3+0
;ultra2.c,64 :: 		intToStr(q,txt);
	MOVF       _q+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _q+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;ultra2.c,65 :: 		uart1_write_text(txt);
	MOVLW      _txt+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;ultra2.c,66 :: 		uart1_write_text("loop");
	MOVLW      ?lstr1_ultra2+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;ultra2.c,67 :: 		portd=0b01100000;
	MOVLW      96
	MOVWF      PORTD+0
;ultra2.c,68 :: 		}
	GOTO       L_forward14
L_forward15:
;ultra2.c,69 :: 		}
L_end_forward:
	RETURN
; end of _forward

_trnlft:

;ultra2.c,70 :: 		trnlft(){   trisd=0;
	CLRF       TRISD+0
;ultra2.c,71 :: 		ultra2();
	CALL       _ultra2+0
;ultra2.c,72 :: 		intToStr(j,txt);
	MOVF       _j+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _j+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;ultra2.c,73 :: 		uart1_write_text(txt);
	MOVLW      _txt+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;ultra2.c,74 :: 		if(j<30)
	MOVLW      128
	XORWF      _j+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__trnlft43
	MOVLW      30
	SUBWF      _j+0, 0
L__trnlft43:
	BTFSC      STATUS+0, 0
	GOTO       L_trnlft16
;ultra2.c,75 :: 		f2++;
	INCF       _f2+0, 1
	BTFSC      STATUS+0, 2
	INCF       _f2+1, 1
L_trnlft16:
;ultra2.c,76 :: 		sum=j;
	MOVF       _j+0, 0
	MOVWF      _sum+0
	MOVF       _j+1, 0
	MOVWF      _sum+1
;ultra2.c,77 :: 		while(sum>30){
L_trnlft17:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _sum+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__trnlft44
	MOVF       _sum+0, 0
	SUBLW      30
L__trnlft44:
	BTFSC      STATUS+0, 0
	GOTO       L_trnlft18
;ultra2.c,78 :: 		sum=0;
	CLRF       _sum+0
	CLRF       _sum+1
;ultra2.c,79 :: 		intToStr(j,txt);
	MOVF       _j+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _j+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;ultra2.c,80 :: 		uart1_write_text(txt);
	MOVLW      _txt+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;ultra2.c,81 :: 		for(zz=0;zz<10;zz++)
	CLRF       _zz+0
	CLRF       _zz+1
L_trnlft19:
	MOVLW      128
	XORWF      _zz+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__trnlft45
	MOVLW      10
	SUBWF      _zz+0, 0
L__trnlft45:
	BTFSC      STATUS+0, 0
	GOTO       L_trnlft20
;ultra2.c,83 :: 		ultra2();
	CALL       _ultra2+0
;ultra2.c,84 :: 		averege[zz]=j;
	MOVF       _zz+0, 0
	ADDLW      _averege+0
	MOVWF      FSR
	MOVF       _j+0, 0
	MOVWF      INDF+0
;ultra2.c,81 :: 		for(zz=0;zz<10;zz++)
	INCF       _zz+0, 1
	BTFSC      STATUS+0, 2
	INCF       _zz+1, 1
;ultra2.c,85 :: 		}
	GOTO       L_trnlft19
L_trnlft20:
;ultra2.c,86 :: 		for(zz=0;zz<10;zz++)
	CLRF       _zz+0
	CLRF       _zz+1
L_trnlft22:
	MOVLW      128
	XORWF      _zz+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__trnlft46
	MOVLW      10
	SUBWF      _zz+0, 0
L__trnlft46:
	BTFSC      STATUS+0, 0
	GOTO       L_trnlft23
;ultra2.c,87 :: 		sum=sum+averege[zz];
	MOVF       _zz+0, 0
	ADDLW      _averege+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	ADDWF      _sum+0, 1
	BTFSC      STATUS+0, 0
	INCF       _sum+1, 1
;ultra2.c,86 :: 		for(zz=0;zz<10;zz++)
	INCF       _zz+0, 1
	BTFSC      STATUS+0, 2
	INCF       _zz+1, 1
;ultra2.c,87 :: 		sum=sum+averege[zz];
	GOTO       L_trnlft22
L_trnlft23:
;ultra2.c,88 :: 		sum=sum/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _sum+0, 0
	MOVWF      R0+0
	MOVF       _sum+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _sum+0
	MOVF       R0+1, 0
	MOVWF      _sum+1
;ultra2.c,90 :: 		portd=0b10100000;
	MOVLW      160
	MOVWF      PORTD+0
;ultra2.c,91 :: 		}
	GOTO       L_trnlft17
L_trnlft18:
;ultra2.c,92 :: 		}
L_end_trnlft:
	RETURN
; end of _trnlft

_main:

;ultra2.c,93 :: 		void main() {   uart1_init(9600);
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;ultra2.c,94 :: 		uart1_write_text("ready");
	MOVLW      ?lstr2_ultra2+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;ultra2.c,95 :: 		trisd=0 ;
	CLRF       TRISD+0
;ultra2.c,96 :: 		for(zz=0;zz<10;zz++)
	CLRF       _zz+0
	CLRF       _zz+1
L_main25:
	MOVLW      128
	XORWF      _zz+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main48
	MOVLW      10
	SUBWF      _zz+0, 0
L__main48:
	BTFSC      STATUS+0, 0
	GOTO       L_main26
;ultra2.c,98 :: 		initrit();
	CALL       _initrit+0
;ultra2.c,99 :: 		delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main28:
	DECFSZ     R13+0, 1
	GOTO       L_main28
	DECFSZ     R12+0, 1
	GOTO       L_main28
	DECFSZ     R11+0, 1
	GOTO       L_main28
	NOP
;ultra2.c,96 :: 		for(zz=0;zz<10;zz++)
	INCF       _zz+0, 1
	BTFSC      STATUS+0, 2
	INCF       _zz+1, 1
;ultra2.c,100 :: 		}
	GOTO       L_main25
L_main26:
;ultra2.c,101 :: 		while(f1<50)
L_main29:
	MOVLW      128
	XORWF      _f1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main49
	MOVLW      50
	SUBWF      _f1+0, 0
L__main49:
	BTFSC      STATUS+0, 0
	GOTO       L_main30
;ultra2.c,102 :: 		forward();
	CALL       _forward+0
	GOTO       L_main29
L_main30:
;ultra2.c,103 :: 		portd=0;
	CLRF       PORTD+0
;ultra2.c,104 :: 		delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main31:
	DECFSZ     R13+0, 1
	GOTO       L_main31
	DECFSZ     R12+0, 1
	GOTO       L_main31
	DECFSZ     R11+0, 1
	GOTO       L_main31
	NOP
	NOP
;ultra2.c,105 :: 		while(f2<50)
L_main32:
	MOVLW      128
	XORWF      _f2+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main50
	MOVLW      50
	SUBWF      _f2+0, 0
L__main50:
	BTFSC      STATUS+0, 0
	GOTO       L_main33
;ultra2.c,106 :: 		trnlft();
	CALL       _trnlft+0
	GOTO       L_main32
L_main33:
;ultra2.c,107 :: 		portd=0;
	CLRF       PORTD+0
;ultra2.c,108 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
