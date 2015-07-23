int i,j,q;
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
portb.f3=1;
delay_us(5);
portb.f3=0;
trisb=0b00001000;
delay_us(750);
while(portb.f3==1)
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
initrit(){     trisd=0;
               ultra1();
               if(i>20){ portd=0b01010000;
                        delay_ms(2000);
                        }
          }
forward(){    trisd=0;
              ultra3();
               intToStr(q,txt);
              uart1_write_text(txt);
              while(q>10){             ultra3();
                                   intToStr(q,txt);
                                   uart1_write_text(txt);
                                   uart1_write_text("loop");
                                   portd=0b01100000;
                                   }
           }
trnlft(){   trisd=0;
            while(j>20){          ultra2();
                                  portd=0b01010000;
                                  }
          }
void main() {   uart1_init(9600);
                 uart1_write_text("ready");
              trisd=0 ;
                    //  initrit();
                    for(;;){ 

                     forward();
                    //  portd=0;
                    //  delay_ms(1000);
                     // ultra2();
                   //   trnlft();
                   portd=0; }

}