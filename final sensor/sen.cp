#line 1 "G:/final sensor/sen.c"
sbit IR_Tx at RA3_bit;
sbit DD0_Set at RA2_bit;
sbit DD1_Set at RA1_bit;
sbit DD2_Set at RA0_bit;
sbit start at RB7_bit;
unsigned short j, DD0, DD1, DD2, DD3; unsigned short pulserate, pulsecount; unsigned int i;
 unsigned short a,b;
 char cd,yy ;
void delay_debounce(){ Delay_ms(300);
}
void delay_refresh(){ Delay_ms(5);
}
void countpulse(){ IR_Tx = 1;
delay_debounce();
delay_debounce();
TMR0=0;
Delay_ms(15000);
IR_Tx = 0;
pulsecount = TMR0;
pulserate = pulsecount*4;
}
 void main() {
 UART1_Init(9600);
CMCON = 0x07;
TRISA = 0b00110001;
OPTION_REG = 0b00101000;
pulserate = 0;


porta.f3=1;
porta.f1=1;
porta.f2=0;
while(porta.f0==1){
delay_debounce();
countpulse();
UART1_Write(pulserate);
}
if(porta.f0==0)
{
uart1_write(150);
porta.f1=0;
porta.f2=1;
}



}
