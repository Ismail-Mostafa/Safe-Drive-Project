char rec[80];                                 // nemory to save the location
int i=0;                                       // the element pointer of array
int x=0;
char rr='K';                                      // flag of interrupt
char GP=0;
int mode=0;
char hr[3];
char rem;                               // counter of coma
char we[25]={'A','T','+','C','M','G','S','=','"','0','1','1','1','7','9','4','8','3','6','9','"',13,0};
char e[]="emergency";
char hear[]="Heart rate :";
unsigned short int v=0;

  // LCD
sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D7 at RB3_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D4 at RB0_bit;
// Pin direction
sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D7_Direction at TRISB3_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D4_Direction at TRISB0_bit;
interrupt()
{
rr = UART1_Read();
switch(rr)
{
case '$':
   {
    v=1;
    i=0;
    break;
    }

  case 'G':
   {
   if(v<6)
   {
    v++;
    break;
   }
   }
case 'P':
   {
    if(v==2)
    v=3;
    break;
   }

case 'A':
    {
    if(v==5)
    v=6;
    break;
    }
case 150:
    {
     mode=1;
     break;
    }
}
if (v==6){
 i++;
rec[i] = rr;
}

 }

void main() {
char r;
Lcd_Init();
INTCON=0b11000000;
PIE1=0b00100000;
UART1_Init(9600);               // Initialize UART module at 9600 bps
Delay_ms(300);
adcon1=7;
trisa=0;
porta=0;
TRISD=0;
PORTD=0b11111111;
//portd.f6=0; //GPS Rx
portd.f0=0; //GSM TX
TRISC=0;
portd.f3=0;   //zigbee Rx
portc.f4=1;
delay_ms(2000);
TRISC=255;
delay_ms(2000);
lcd_cmd(_LCD_CURSOR_OFF);
for(;;){
if(mode==0)
{
hr[0]=rr/100+48;
rem=rr%100;
hr[1]=rem/10+48;
hr[2]=rem%10+48;
lcd_out(1,1,hear);
lcd_out_cp(hr);
//lcd_chr(2,1,rr);
}

if(mode==1)
   {
   PORTD=0b11111111;
   portd.f0=0; //GSM TX
   portd.f6=0; //GPS Rx
   lcd_cmd(_LCD_CLEAR);
   porta.f1=1;
   delay_ms(500);
   porta.f1=0;
   mode=2;
   while(v<6)
   { }
   delay_ms(2000);
    lcd_chr(1,1,rec[14]);
    for (r=15;r<23;r++){
    lcd_chr_cp(rec[r]);
    }
    lcd_chr(2,1,rec[26]);
    for (r=27;r<36;r++){
    lcd_chr_cp(rec[r]);
    }
    delay_ms(2000);
    UART1_WRITE_TEXT("AT+CMGF=1");
    UART1_WRITE(13);
    delay_ms(300);
    UART1_WRITE_TEXT(we);
    delay_ms(300);
    UART1_WRITE_TEXT("Latu:");
    for (r=14;r<23;r++){
    UART1_WRITE(rec[r]);
    }
   //UART1_WRITE(10);
    UART1_WRITE(13);
    UART1_WRITE_TEXT("Long:");
    delay_ms(300);
    for (r=26;r<36;r++){
    UART1_WRITE(rec[r]);
    }
    UART1_WRITE(13);
    delay_ms(300);
    UART1_WRITE(26);
    delay_ms(1000);
    }
   }
}