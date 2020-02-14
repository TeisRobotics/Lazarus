/*
 Lazarus y Arduino. 
 Este programa enciende y apaga la salida 13
 Esta salida, normalmente tiene un led asociada en las placas arduino.
 El estado del LED lo envia por el puerto serie.  
 */
int led = 13;
void setup() {
  Serial.begin(9600);
  pinMode (led,OUTPUT);
}

void loop() {
  digitalWrite (led,HIGH);
  Serial.println ("ON");
  delay(1500);
  digitalWrite(led,LOW);
  Serial.println("OFF");
  delay(1500);
}
