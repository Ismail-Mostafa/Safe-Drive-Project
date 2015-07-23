#line 1 "C:/Documents and Settings/Administrator/Desktop/EmbeddedLab/PIC16F628A/PulseMeter/PulseMeter.c"
#line 9 "C:/Documents and Settings/Administrator/Desktop/EmbeddedLab/PIC16F628A/PulseMeter/PulseMeter.c"
sbit IR_Tx at RA3_bit;
sbit DD0_Set at RA2_bit;
sbit DD1_Set at RA1_bit;
sbit DD2_Set at RA0_bit;
sbit start at RB7_bit;
unsigned short j, DD0, DD1, DD2, DD3;
unsigned short pulserate, pulsecount;
unsigned int i;

unsigned short mask(unsigned short num) {
 switch (num) {
 case 0 : return 0xC0;
 case 1 : return 0xF9;
 case 2 : return 0xA4;
 case 3 : return 0xB0;
 case 4 : return 0x99;
 case 5 : return 0x92;
 case 6 : return 0x82;
 case 7 : return 0xF8;
 case 8 : return 0x80;
 case 9 : return 0x90;
 }
}

void delay_debounce(){
 Delay_ms(300);
}

void delay_refresh(){
 Delay_ms(5);
}

void countpulse(){
 IR_Tx = 1;
 delay_debounce();
 delay_debounce();
 TMR0=0;
 Delay_ms(15000);
 IR_Tx = 0;
 pulsecount = TMR0;
 pulserate = pulsecount*4;
}

void display(){
 DD0 = pulserate%10;
 DD0 = mask(DD0);
 DD1 = (pulserate/10)%10;
 DD1 = mask(DD1);
 DD2 = pulserate/100;
 DD2 = mask(DD2);
 for (i = 0; i<=180*j; i++) {
 DD0_Set = 0;
 DD1_Set = 1;
 DD2_Set = 1;
 PORTB = DD0;
 delay_refresh();
 DD0_Set = 1;
 DD1_Set = 0;
 DD2_Set = 1;
 PORTB = DD1;
 delay_refresh();
 DD0_Set = 1;
 DD1_Set = 1;
 DD2_Set = 0;
 PORTB = DD2;
 delay_refresh();
 }
 DD2_Set = 1;


}



void main() {
 CMCON = 0x07;
 TRISA = 0b00110000;
 TRISB = 0b10000000;
 OPTION_REG = 0b00101000;
 pulserate = 0;
 j = 1;
 display();
 do {
 if(!start){
 delay_debounce();
 countpulse();
 j= 3;
 display();
 }


 } while(1);
}
