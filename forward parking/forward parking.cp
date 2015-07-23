#line 1 "F:/forward parking/forward parking.c"
int i,j,q,zz;
int f1=0;
int f2=0;
unsigned short int averege[10];
int sum;
char txt[30];
ultra1()
{
i=0;
trisb=0;
portb.f2=1;
delay_us(5);
portb.f2=0;
trisb=0b00000100;
delay_us(750);
while(portb.f2==1)
{i++;
delay_us(22);
 }
i=i/2;
}
ultra2()
{
j=0;
trisb=0;
portb.f6=1;
delay_us(5);
portb.f6=0;
trisb=0b01000000;
delay_us(750);
while(portb.f6==1)
{j++;
delay_us(22);
 }
j=j/2;
}
ultra3()
{
q=0;
trisb=0;
portb.f4=1;
delay_us(5);
portb.f4=0;
trisb=0b00010000;
delay_us(750);
while(portb.f4==1)
{q++;
delay_us(22);
 }
q=q/2;
}
initrit(){ trisd=0;
 ultra1();
 if(i>20){ portd=0b01010000;
 }
 }
forward(){ trisd=0;
 ultra3();
 intToStr(q,txt);
 uart1_write_text(txt);
 if(q<10)
 f1++;
 while(q>10){ ultra3();
 intToStr(q,txt);
 uart1_write_text(txt);
 uart1_write_text("loop");
 portd=0b01100000;
 }
 }
trnlft(){ trisd=0;
 ultra2();
 intToStr(j,txt);
 uart1_write_text(txt);
 if(j<20)
 f2++;
 sum=j;
 while(sum>20){
 sum=0;
 intToStr(j,txt);
 uart1_write_text(txt);
 for(zz=0;zz<10;zz++)
 {
 ultra2();
 averege[zz]=j;
 }
 for(zz=0;zz<10;zz++)
 sum=sum+averege[zz];
 sum=sum/10;

 portd=0b10100000;
 }
 }
void main() { adcon1=7;
 uart1_init(9600);
 delay_ms(4000);
 trisd=0;
 uart1_write_text("ready");
 portd=0b01100000;
 for(;;){
 trisa=0b00000111;
 f1=0;
 f2=0;
#line 106 "F:/forward parking/forward parking.c"
 while(porta.f1==1)
 {
 trisd=0 ;
 for(zz=0;zz<10;zz++)
 {
 initrit();
 delay_ms(200);
 }
 while(f1<80)
 forward();
 portd=0;
 delay_ms(1000);
 while(f2<40)
 trnlft();
 portd=0;
 trisa=0;
 porta=0;
}
 } }
