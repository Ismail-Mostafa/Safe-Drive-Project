
_ultra1:

;forward parking.c,7 :: 		ultra1()
;forward parking.c,9 :: 		i=0;
	CLRF       _i+0
	CLRF       _i+1
;forward parking.c,10 :: 		trisb=0;
	CLRF       TRISB+0
;forward parking.c,11 :: 		portb.f2=1;
	BSF        PORTB+0, 2
;forward parking.c,12 :: 		delay_us(5);
	NOP
	NOP
	NOP
	NOP
	NOP
;forward parking.c,13 :: 		portb.f2=0;
	BCF        PORTB+0, 2
;forward parking.c,14 :: 		trisb=0b00000100;
	MOVLW      4
	MOVWF      TRISB+0
;forward parking.c,15 :: 		delay_us(750);
	MOVLW      249
	MOVWF      R13+0
L_ultra10:
	DECFSZ     R13+0, 1
	GOTO       L_ultra10
	NOP
	NOP
;forward parking.c,16 :: 		while(portb.f2==1)
L_ultra11:
	BTFSS      PORTB+0, 2
	GOTO       L_ultra12
;forward parking.c,17 :: 		{i++;
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;forward parking.c,18 :: 		delay_us(22);
	MOVLW      7
	MOVWF      R13+0
L_ultra13:
	DECFSZ     R13+0, 1
	GOTO       L_ultra13
;forward parking.c,19 :: 		}
	GOTO       L_ultra11
L_ultra12:
;forward parking.c,20 :: 		i=i/2;
	RRF        _i+1, 1
	RRF        _i+0, 1
	BCF        _i+1, 7
	BTFSC      _i+1, 6
	BSF        _i+1, 7
;forward parking.c,21 :: 		}
L_end_ultra1:
	RETURN
; end of _ultra1

_ultra2:

;forward parking.c,22 :: 		ultra2()
;forward parking.c,24 :: 		j=0;
	CLRF       _j+0
	CLRF       _j+1
;forward parking.c,25 :: 		trisb=0;
	CLRF       TRISB+0
;forward parking.c,26 :: 		portb.f6=1;
	BSF        PORTB+0, 6
;forward parking.c,27 :: 		delay_us(5);
	NOP
	NOP
	NOP
	NOP
	NOP
;forward parking.c,28 :: 		portb.f6=0;
	BCF        PORTB+0, 6
;forward parking.c,29 :: 		trisb=0b01000000;
	MOVLW      64
	MOVWF      TRISB+0
;forward parking.c,30 :: 		delay_us(750);
	MOVLW      249
	MOVWF      R13+0
L_ultra24:
	DECFSZ     R13+0, 1
	GOTO       L_ultra24
	NOP
	NOP
;forward parking.c,31 :: 		while(portb.f6==1)
L_ultra25:
	BTFSS      PORTB+0, 6
	GOTO       L_ultra26
;forward parking.c,32 :: 		{j++;
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;forward parking.c,33 :: 		delay_us(22);
	MOVLW      7
	MOVWF      R13+0
L_ultra27:
	DECFSZ     R13+0, 1
	GOTO       L_ultra27
;forward parking.c,34 :: 		}
	GOTO       L_ultra25
L_ultra26:
;forward parking.c,35 :: 		j=j/2;
	RRF        _j+1, 1
	RRF        _j+0, 1
	BCF        _j+1, 7
	BTFSC      _j+1, 6
	BSF        _j+1, 7
;forward parking.c,36 :: 		}
L_end_ultra2:
	RETURN
; end of _ultra2

_ultra3:

;forward parking.c,37 :: 		ultra3()
;forward parking.c,39 :: 		q=0;
	CLRF       _q+0
	CLRF       _q+1
;forward parking.c,40 :: 		trisb=0;
	CLRF       TRISB+0
;forward parking.c,41 :: 		portb.f4=1;
	BSF        PORTB+0, 4
;forward parking.c,42 :: 		delay_us(5);
	NOP
	NOP
	NOP
	NOP
	NOP
;forward parking.c,43 :: 		portb.f4=0;
	BCF        PORTB+0, 4
;forward parking.c,44 :: 		trisb=0b00010000;
	MOVLW      16
	MOVWF      TRISB+0
;forward parking.c,45 :: 		delay_us(750);
	MOVLW      249
	MOVWF      R13+0
L_ultra38:
	DECFSZ     R13+0, 1
	GOTO       L_ultra38
	NOP
	NOP
;forward parking.c,46 :: 		while(portb.f4==1)
L_ultra39:
	BTFSS      PORTB+0, 4
	GOTO       L_ultra310
;forward parking.c,47 :: 		{q++;
	INCF       _q+0, 1
	BTFSC      STATUS+0, 2
	INCF       _q+1, 1
;forward parking.c,48 :: 		delay_us(22);
	MOVLW      7
	MOVWF      R13+0
L_ultra311:
	DECFSZ     R13+0, 1
	GOTO       L_ultra311
;forward parking.c,49 :: 		}
	GOTO       L_ultra39
L_ultra310:
;forward parking.c,50 :: 		q=q/2;
	RRF        _q+1, 1
	RRF        _q+0, 1
	BCF        _q+1, 7
	BTFSC      _q+1, 6
	BSF        _q+1, 7
;forward parking.c,51 :: 		}
L_end_ultra3:
	RETURN
; end of _ultra3

_initrit:

;forward parking.c,52 :: 		initrit(){     trisd=0;
	CLRF       TRISD+0
;forward parking.c,53 :: 		ultra1();
	CALL       _ultra1+0
;forward parking.c,54 :: 		if(i>20){ portd=0b01010000;
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__initrit44
	MOVF       _i+0, 0
	SUBLW      20
L__initrit44:
	BTFSC      STATUS+0, 0
	GOTO       L_initrit12
	MOVLW      80
	MOVWF      PORTD+0
;forward parking.c,55 :: 		}
L_initrit12:
;forward parking.c,56 :: 		}
L_end_initrit:
	RETURN
; end of _initrit

_forward:

;forward parking.c,57 :: 		forward(){    trisd=0;
	CLRF       TRISD+0
;forward parking.c,58 :: 		ultra3();
	CALL       _ultra3+0
;forward parking.c,59 :: 		intToStr(q,txt);
	MOVF       _q+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _q+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;forward parking.c,60 :: 		uart1_write_text(txt);
	MOVLW      _txt+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;forward parking.c,61 :: 		if(q<10)
	MOVLW      128
	XORWF      _q+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__forward46
	MOVLW      10
	SUBWF      _q+0, 0
L__forward46:
	BTFSC      STATUS+0, 0
	GOTO       L_forward13
;forward parking.c,62 :: 		f1++;
	INCF       _f1+0, 1
	BTFSC      STATUS+0, 2
	INCF       _f1+1, 1
L_forward13:
;forward parking.c,63 :: 		while(q>10){         ultra3();
L_forward14:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _q+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__forward47
	MOVF       _q+0, 0
	SUBLW      10
L__forward47:
	BTFSC      STATUS+0, 0
	GOTO       L_forward15
	CALL       _ultra3+0
;forward parking.c,64 :: 		intToStr(q,txt);
	MOVF       _q+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _q+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;forward parking.c,65 :: 		uart1_write_text(txt);
	MOVLW      _txt+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;forward parking.c,66 :: 		uart1_write_text("loop");
	MOVLW      ?lstr1_forward_32parking+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;forward parking.c,67 :: 		portd=0b01100000;
	MOVLW      96
	MOVWF      PORTD+0
;forward parking.c,68 :: 		}
	GOTO       L_forward14
L_forward15:
;forward parking.c,69 :: 		}
L_end_forward:
	RETURN
; end of _forward

_trnlft:

;forward parking.c,70 :: 		trnlft(){   trisd=0;
	CLRF       TRISD+0
;forward parking.c,71 :: 		ultra2();
	CALL       _ultra2+0
;forward parking.c,72 :: 		intToStr(j,txt);
	MOVF       _j+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _j+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;forward parking.c,73 :: 		uart1_write_text(txt);
	MOVLW      _txt+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;forward parking.c,74 :: 		if(j<20)
	MOVLW      128
	XORWF      _j+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__trnlft49
	MOVLW      20
	SUBWF      _j+0, 0
L__trnlft49:
	BTFSC      STATUS+0, 0
	GOTO       L_trnlft16
;forward parking.c,75 :: 		f2++;
	INCF       _f2+0, 1
	BTFSC      STATUS+0, 2
	INCF       _f2+1, 1
L_trnlft16:
;forward parking.c,76 :: 		sum=j;
	MOVF       _j+0, 0
	MOVWF      _sum+0
	MOVF       _j+1, 0
	MOVWF      _sum+1
;forward parking.c,77 :: 		while(sum>20){
L_trnlft17:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _sum+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__trnlft50
	MOVF       _sum+0, 0
	SUBLW      20
L__trnlft50:
	BTFSC      STATUS+0, 0
	GOTO       L_trnlft18
;forward parking.c,78 :: 		sum=0;
	CLRF       _sum+0
	CLRF       _sum+1
;forward parking.c,79 :: 		intToStr(j,txt);
	MOVF       _j+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _j+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;forward parking.c,80 :: 		uart1_write_text(txt);
	MOVLW      _txt+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;forward parking.c,81 :: 		for(zz=0;zz<10;zz++)
	CLRF       _zz+0
	CLRF       _zz+1
L_trnlft19:
	MOVLW      128
	XORWF      _zz+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__trnlft51
	MOVLW      10
	SUBWF      _zz+0, 0
L__trnlft51:
	BTFSC      STATUS+0, 0
	GOTO       L_trnlft20
;forward parking.c,83 :: 		ultra2();
	CALL       _ultra2+0
;forward parking.c,84 :: 		averege[zz]=j;
	MOVF       _zz+0, 0
	ADDLW      _averege+0
	MOVWF      FSR
	MOVF       _j+0, 0
	MOVWF      INDF+0
;forward parking.c,81 :: 		for(zz=0;zz<10;zz++)
	INCF       _zz+0, 1
	BTFSC      STATUS+0, 2
	INCF       _zz+1, 1
;forward parking.c,85 :: 		}
	GOTO       L_trnlft19
L_trnlft20:
;forward parking.c,86 :: 		for(zz=0;zz<10;zz++)
	CLRF       _zz+0
	CLRF       _zz+1
L_trnlft22:
	MOVLW      128
	XORWF      _zz+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__trnlft52
	MOVLW      10
	SUBWF      _zz+0, 0
L__trnlft52:
	BTFSC      STATUS+0, 0
	GOTO       L_trnlft23
;forward parking.c,87 :: 		sum=sum+averege[zz];
	MOVF       _zz+0, 0
	ADDLW      _averege+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	ADDWF      _sum+0, 1
	BTFSC      STATUS+0, 0
	INCF       _sum+1, 1
;forward parking.c,86 :: 		for(zz=0;zz<10;zz++)
	INCF       _zz+0, 1
	BTFSC      STATUS+0, 2
	INCF       _zz+1, 1
;forward parking.c,87 :: 		sum=sum+averege[zz];
	GOTO       L_trnlft22
L_trnlft23:
;forward parking.c,88 :: 		sum=sum/10;
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
;forward parking.c,90 :: 		portd=0b10100000;
	MOVLW      160
	MOVWF      PORTD+0
;forward parking.c,91 :: 		}
	GOTO       L_trnlft17
L_trnlft18:
;forward parking.c,92 :: 		}
L_end_trnlft:
	RETURN
; end of _trnlft

_main:

;forward parking.c,93 :: 		void main() {   adcon1=7;
	MOVLW      7
	MOVWF      ADCON1+0
;forward parking.c,94 :: 		uart1_init(9600);
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;forward parking.c,95 :: 		delay_ms(4000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main25:
	DECFSZ     R13+0, 1
	GOTO       L_main25
	DECFSZ     R12+0, 1
	GOTO       L_main25
	DECFSZ     R11+0, 1
	GOTO       L_main25
	NOP
;forward parking.c,96 :: 		trisd=0;
	CLRF       TRISD+0
;forward parking.c,97 :: 		uart1_write_text("ready");
	MOVLW      ?lstr2_forward_32parking+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;forward parking.c,98 :: 		portd=0b01100000;
	MOVLW      96
	MOVWF      PORTD+0
;forward parking.c,99 :: 		for(;;){
L_main26:
;forward parking.c,100 :: 		trisa=0b00000111;
	MOVLW      7
	MOVWF      TRISA+0
;forward parking.c,101 :: 		f1=0;
	CLRF       _f1+0
	CLRF       _f1+1
;forward parking.c,102 :: 		f2=0;
	CLRF       _f2+0
	CLRF       _f2+1
;forward parking.c,106 :: 		while(porta.f1==1)
L_main29:
	BTFSS      PORTA+0, 1
	GOTO       L_main30
;forward parking.c,108 :: 		trisd=0 ;
	CLRF       TRISD+0
;forward parking.c,109 :: 		for(zz=0;zz<10;zz++)
	CLRF       _zz+0
	CLRF       _zz+1
L_main31:
	MOVLW      128
	XORWF      _zz+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main54
	MOVLW      10
	SUBWF      _zz+0, 0
L__main54:
	BTFSC      STATUS+0, 0
	GOTO       L_main32
;forward parking.c,111 :: 		initrit();
	CALL       _initrit+0
;forward parking.c,112 :: 		delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main34:
	DECFSZ     R13+0, 1
	GOTO       L_main34
	DECFSZ     R12+0, 1
	GOTO       L_main34
	DECFSZ     R11+0, 1
	GOTO       L_main34
	NOP
;forward parking.c,109 :: 		for(zz=0;zz<10;zz++)
	INCF       _zz+0, 1
	BTFSC      STATUS+0, 2
	INCF       _zz+1, 1
;forward parking.c,113 :: 		}
	GOTO       L_main31
L_main32:
;forward parking.c,114 :: 		while(f1<80)
L_main35:
	MOVLW      128
	XORWF      _f1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main55
	MOVLW      80
	SUBWF      _f1+0, 0
L__main55:
	BTFSC      STATUS+0, 0
	GOTO       L_main36
;forward parking.c,115 :: 		forward();
	CALL       _forward+0
	GOTO       L_main35
L_main36:
;forward parking.c,116 :: 		portd=0;
	CLRF       PORTD+0
;forward parking.c,117 :: 		delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main37:
	DECFSZ     R13+0, 1
	GOTO       L_main37
	DECFSZ     R12+0, 1
	GOTO       L_main37
	DECFSZ     R11+0, 1
	GOTO       L_main37
	NOP
	NOP
;forward parking.c,118 :: 		while(f2<40)
L_main38:
	MOVLW      128
	XORWF      _f2+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main56
	MOVLW      40
	SUBWF      _f2+0, 0
L__main56:
	BTFSC      STATUS+0, 0
	GOTO       L_main39
;forward parking.c,119 :: 		trnlft();
	CALL       _trnlft+0
	GOTO       L_main38
L_main39:
;forward parking.c,120 :: 		portd=0;
	CLRF       PORTD+0
;forward parking.c,121 :: 		trisa=0;
	CLRF       TRISA+0
;forward parking.c,122 :: 		porta=0;
	CLRF       PORTA+0
;forward parking.c,123 :: 		}
	GOTO       L_main29
L_main30:
;forward parking.c,124 :: 		}     }
	GOTO       L_main26
L_end_main:
	GOTO       $+0
; end of _main
