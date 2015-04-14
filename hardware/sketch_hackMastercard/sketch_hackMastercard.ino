#include <LiquidCrystal.h>

int portSpeak(3);

int melodiaEntrada[] = {660,660,660,510,660,770};
int duracaodasnotasEntrada[] = {100, 100,100,100,100, 100};
int pausadedoisdasnotasEntrada[] = {150, 300,300,100,300,550};

int motorPin1 = 8;  
int motorPin2 = 9;  
int motorPin3 = 10;    
int motorPin4 = 11;

char c;
        
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
    
    serialFlush();
  } 
  
  if (acionar) {
    abrir();
    tocaSom();
    delay(2000);
    fechar();
    acionar = false;
  }
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

void tocaSom()
{
  for (int nota = 0; nota < 6; nota++) {
      int duracaodanota = duracaodasnotasEntrada[nota];
      tone(portSpeak, melodiaEntrada[nota], duracaodanota);
      //pausa depois das notas
      delay(pausadedoisdasnotasEntrada[nota]);
    }
  noTone(portSpeak);
}

void setOutput(int out)
{
  digitalWrite(motorPin1, bitRead(lookup[out], 0));
  digitalWrite(motorPin2, bitRead(lookup[out], 1));
  digitalWrite(motorPin3, bitRead(lookup[out], 2));
  digitalWrite(motorPin4, bitRead(lookup[out], 3));
}

void serialFlush()
{
  while(Serial.available() > 0)
  {
    char t = Serial.read();
  }
}
