#include <MozziGuts.h>
#include <Oscil.h>
#include <tables/sin2048_int8.h>

int sensorPin0 = A0;
int sensorPin1 = A1;
int sensorPin2 = A2;
int sensorPin3 = A3;
int sensorPin4 = A4;

int sensorValue = 0;

unsigned long previousMillis = 0;
const long interval = 2;

//harmonics
Oscil <SIN2048_NUM_CELLS, AUDIO_RATE> aSin(SIN2048_DATA);

// use #define for CONTROL_RATE
#define CONTROL_RATE 64 // Hz, powers of 2 are most reliable

void setup() {
  startMozzi(CONTROL_RATE);
  aSin.setFreq(260);
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:

  sensorValue = analogRead(sensorPin1);
  Serial.print(sensorValue);
  Serial.print("a");

  sensorValue = analogRead(sensorPin2);
  Serial.print(sensorValue);
  Serial.print("b");

  sensorValue = analogRead(sensorPin3);
  Serial.print(sensorValue);
  Serial.print("c");

  sensorValue = analogRead(sensorPin4);
  Serial.print(sensorValue);
  Serial.print("d");
  
  delay(interval);
}
