#include <LiquidCrystal.h>


int motorPin1 = 8;  
int motorPin2 = 9;  
int motorPin3 = 10;    
int motorPin4 = 11;

char c;

LiquidCrystal lcd(3, 2, A5, A4, A3, A2);
       

                
int switchPin = 7;
int ledPin = 13;
boolean lastButton = LOW;
boolean currentButton = LOW;
boolean acionar = false;
boolean luzAcesa = false;

int tempo = 4000;
int motorSpeed = 900; 
int times = 0;
int lookup[8] = {B01000, B01100, B00100, B00110, B00010, B00011, B00001, B01001};

void setup() {
 
  pinMode(motorPin1, OUTPUT);
  pinMode(motorPin2, OUTPUT);
  pinMode(motorPin3, OUTPUT);
  pinMode(motorPin4, OUTPUT);
  
  lcd.begin(16, 2);
  lcd.print("Mastercard      ");
  lcd.setCursor(0, 1);
  lcd.print("Vendor Machine  ");
  
  pinMode(ledPin, OUTPUT);
  pinMode(switchPin, INPUT);
  
  digitalWrite(ledPin, LOW);

  Serial.begin(9600);

}

void loop() { 
  if (Serial.available()) {
    c = Serial.read();

    if (c == 'o') {
      Serial.write(c);
      acionar = true;
    }
  } 
  
  /*currentButton = debounce(lastButton);
  if(lastButton == LOW && currentButton == HIGH) {
      acionar = true;
  }
  lastButton = currentButton;
   */
  if (acionar) {
    abrir();
    escreve();
    delay(3000);
    fechar();
    acionar = false;
  }
}

void escreve() {
  
  lcd.setCursor(0, 0);
  lcd.print("Retire seu     ");
  lcd.setCursor(0, 1);
  lcd.print("Produto!        ");
  digitalWrite(ledPin, HIGH);
}

boolean debounce(boolean last) {
  boolean current = digitalRead(switchPin);
  if (last != current) {
    delay(5);
    current = digitalRead(switchPin);
  }
  return current;
}

void abrir()
{
  for(int i = 0; i < tempo; i++)
  {
    setOutput(i % 8);
    delayMicroseconds(motorSpeed);
  }
  
}

void fechar()
{
  for(int i = tempo; i > 0; i--)
  {
    setOutput(i % 8);
    delayMicroseconds(motorSpeed);
  }
  
}

void setOutput(int out)
{
  digitalWrite(motorPin1, bitRead(lookup[out], 0));
  digitalWrite(motorPin2, bitRead(lookup[out], 1));
  digitalWrite(motorPin3, bitRead(lookup[out], 2));
  digitalWrite(motorPin4, bitRead(lookup[out], 3));
}

