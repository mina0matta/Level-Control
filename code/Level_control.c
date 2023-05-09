/*****************************
Project : Liquid Level Control
Type : PIC16F877A
Crystal : 8 MHz
*****************************/
/* stop is the reset switch */
#define start_switch portb.f0
#define LL portb.f1
#define HL portb.f2
#define Valve portc.f0
#define Pump portc.f1
/****************************/
void main() {
  trisc=0; portc=0;
  trisb=0b00000111; portb=0;
  
  while(start_switch==0);

  loop:
       if(LL==1)
       {
         Valve=0;
         Pump=1;
       }
       else if(HL==1)
       {
         Pump=0;
         Valve=1;
       }
  goto loop;
}